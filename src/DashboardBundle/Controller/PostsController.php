<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use PublicBundle\Entity\Post ;
use PublicBundle\Entity\PostRepository;
use PublicBundle\Form\PostType ;
use Symfony\Component\HttpFoundation\Request ;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\Common\Util\Debug;

class PostsController extends Controller
{
    /**
     * @Route("professeur/articles/list/{page}", name="teacher.articles.view", defaults={"page" = 1}, options={"expose" = true})
     * @Template("DashboardBundle:Articles:home.html.twig")
     */
    public function homeAction($page)
    {
        $token          = $this->get('security.context')->getToken();
        $doctrine       = $this->getDoctrine();
        $repository     = $doctrine->getRepository('PublicBundle:Post');
        $itemsPerPage   = $this->container->getParameter('dashboard.posts_per_page');
        $posts          = $repository->getPostsByAuteur($page, $itemsPerPage, $token->getUser()->getId());
        $maxPages       = $repository->getTotalPostsPagesByAuteur($itemsPerPage, $token->getUser()->getId());

        return array('posts' => $posts, 'maxPages' => $maxPages);
    }

    /**
     * @Route(
     *      "/professeur/article/new",
     *      name="teacher.article.new",
     *      defaults = { "id" = null }
     * )
     * @Route(
     *      "/professeur/article/{id}",
     *      name="teacher.article.edit",
     * )
     * @Template("DashboardBundle:Articles:edit.html.twig")
     * @Method({"POST","GET"})
     */
    public function formAction(Request $request,$id)
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $repository = $doctrine->getRepository('PublicBundle:Post');
        $pictureDefault = $repository->find(1)->getPicture();
        $user = $token->getUser();
        $em = $doctrine->getManager();

        if (!$id){ //route de création d'article
            $post = new Post();
            $post->setPicture($pictureDefault);
            $message = "L'article a été ajouté";
        }
        else { // route d'update d'article
            $post    = $repository->find($id);

            if(empty($post)) {
                throw $this->createNotFoundException('Le post n\'existe pas');
            }

            $message   = "L'article a été mis à jour";
            $auteurId = $post->getAuteur()->getId();
            if ($auteurId != $user->getId() ) {
                // MESSAGE D'ERREUR
                $message = "Vous n'êtes pas autorisé à modifier cet article";
                $request->getSession()->getFlashBag()->set('notice', $message);
                return $this->redirect($this->generateUrl('teacher.articles.view'));
            }
        }

        $postType = new PostType();
        $form  = $this->createForm($postType,$post);
        $form->handleRequest($request);

        if ($form->isValid() && $form->isSubmitted()){
            $data = $form->getData();
            $data->setAuteur($user);
            if ($data->getPicture() == null){

                if ($post->getPicture() == null){
                    $data->setPicture($pictureDefault);
       // echo '<pre>';Debug::dump($data);echo '</pre>';exit();
                }
                else  $data->setPicture($post->getPicture());
            }
            $em->persist($data);
            $em->flush();
            $request->getSession()->getFlashBag()->set('notice',$message);
            $urlRedirect = $this->generateUrl('teacher.articles.view');
            return $this->redirect($urlRedirect);
        }
        return array('form' => $form->createView());
    }


    /**
     * @Route("/professeur/article/edit/status/{id}", name="teacher.article.editStatus", options={"expose"=true})
     */
    public function editStatusAction($id){
        $doctrine   = $this->getDoctrine();
        $em = $doctrine->getManager();
        $repository = $doctrine->getRepository('PublicBundle:Post');
        $repositoryStatus = $doctrine->getRepository('PublicBundle:Status');
        $post    = $repository->find($id);
        if ($post->getStatus()->getId() == 1 ){
            $status = $repositoryStatus->find(2);
            $post->setStatus($status);
            $message = "non publié";
        }
        else {
            $status = $repositoryStatus->find(1);
            $post->setStatus($status);
            $message = "publié";
        }
        $em->persist($post);
        $em->flush();
        $response = array('status'=>'OK','message'=>$message);
        return new JsonResponse($response);
    }


    /**
     * @Route("/professeur/article/delete/{id}", name="teacher.article.delete", options={"expose"=true})
     */
    public function deleteAction($id,Request $request){
        $doctrine   = $this->getDoctrine();
        $em         = $doctrine->getManager();
        $repository = $doctrine->getRepository('PublicBundle:Post');
        $post       = $repository->find($id);

        if(empty($post)) {
            throw $this->createNotFoundException('Le post n\'existe pas');
        }

        $em->remove($post);
        $em->flush();
        $message = "L'article a bien été supprimé";
        $request->getSession()->getFlashBag()->set('notice', $message);
        $urlRedirect = $this->generateUrl('teacher.articles.view');
        return $this->redirect($urlRedirect);
    }

    /**
     * @Route("/professeur/article/multiple/", name="teacher.article.multiple", options={"expose"=true})
     * @Method({"POST","GET"})
     */
    public function ManageMultipleAction(Request $request){
        $action = $request->query->get('action');
        $ids    = $request->query->get('ids');
        $ids = explode(',',$ids);
        $doctrine   = $this->getDoctrine();
        $em         = $doctrine->getManager();
        $postRp = $doctrine->getRepository('PublicBundle:Post');
        $statusRp = $doctrine->getRepository('PublicBundle:Status');
        $posts = $postRp->getPostsByIds($ids);
        switch ($action) {
            case 'UNPUBLISH' :
                $unpublished = $statusRp->findOneBy(array('name'=>'UNPUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($unpublished);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre article n\'est plus publié' : 'Vos '.count($posts).' articles ne sont plus publiés' ;
            break ;
            case 'PUBLISH' :
                $published = $statusRp->findOneBy(array('name'=>'PUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($published);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre article a été publié' : 'Vos '.count($posts).' articles ont été publiés' ;
            break ;
            case 'DELETE':
                foreach ($posts as $post){
                    $em->remove($post);
                }
                $message = ( count($posts) == 1 ) ? 'L\'article a été supprimé' : 'Vos '.count($posts).' articles ont été supprimés avec succès' ;
            break ;
            default :
                $message = "une erreur s'est produite.";
                break;
        }
        $em->flush();
        $response = array('status'=>'OK','message'=>$message);
        return new JsonResponse($response);
    }

}
