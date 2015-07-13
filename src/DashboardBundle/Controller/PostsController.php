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
 * @Route("professeur/articles/list", name="teacher.articles.view")
 * @Template("DashboardBundle:Articles:home.html.twig")
 */
    public function homeAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $repository = $doctrine->getRepository('PublicBundle:Post');
        $posts    = $repository->getPostByAuteur($token->getUser()->getId());
        return array('posts' => $posts);
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
        $user = $token->getUser();
        $em = $doctrine->getManager();

        if (!$id){ //route de création d'article
            $post = new Post();
            $message = "L'article a été ajouté";
        }
        else { // route d'update d'article
            $repository = $doctrine->getRepository('PublicBundle:Post');
            $post    = $repository->find($id);
            $message   = "L'article a été mis à jour";
            $auteurId = $post->getAuteur()->getId();
            if ($auteurId != $user->getId() ) {
                // MESSAGE D'ERREUR
                $message = "Vous n'êtes pas autorisé à modifier cet article";
                $request->getSession()->getFlashBag()->set('notice', $message);
                return $this->redirect($this->generateUrl('teacher.home'));
            }
        }

        $postType = new PostType();
        $form  = $this->createForm($postType,$post);
        $form->handleRequest($request);

        if ($form->isValid() && $form->isSubmitted()){
            $data = $form->getData();
            $data->setAuteur($user);
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
//        $status = $repository->find($id);
        if ($post->getStatus()->getId() == 1 ){
            $status = $repositoryStatus->find(2);
            $post->setStatus($status);
            $message = "Votre Article n'est plus publié";
        }
        else{
            $status = $repositoryStatus->find(1);
            $post->setStatus($status);
            $message = "Votre Article est désormais publié";
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
//                echo '<pre>';Debug::dump($post->getStatus()->getId());echo '</pre>';exit();
//        $status = $repository->find($id);

        $em->remove($post);
        $em->flush();
        $message = "L'article a bien été supprimé";
        $request->getSession()->getFlashBag()->set('notice', $message);
        $urlRedirect = $this->generateUrl('teacher.articles.view');
        return $this->redirect($urlRedirect);
    }
}