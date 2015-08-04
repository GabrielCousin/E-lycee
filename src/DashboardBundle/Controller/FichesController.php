<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request ;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\Common\Util\Debug;
use DashboardBundle\Entity\Fiche;
use DashboardBundle\Form\FicheType;
use DashboardBundle\Form\ChoixType;
use DashboardBundle\Form\Choix;
use DashboardBundle\Entity\Score;
use PublicBundle\Entity\Status;

class FichesController extends Controller
{
 /**
 * @Route("professeur/fiches/list/{page}", name="teacher.fiches.home", defaults={"page" = 1}, options={"expose" = true})
 * @Template("DashboardBundle:Fiches:Teacher/home.html.twig")
 */
    public function homeAction($page)
    {
        $token      = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $repository = $doctrine->getRepository('DashboardBundle:Fiche');
        // $fiches     = $repository->findBy(array('teacher' => $token->getUser()->getId()));
        $itemsPerPage   = $this->container->getParameter('dashboard.posts_per_page');
        $id         = $token->getUser()->getId();
        $fiches     = $repository->getFichesByTeacher($id, $page, $itemsPerPage);
        $maxPages = $repository->getTotalFichesByTeacher($id, $itemsPerPage);

        return array('fiches' => $fiches, 'maxPages' => $maxPages);
    }



    /**
     * @Route("professeur/fiches/new", name="teacher.fiches.new")
     * @Template("DashboardBundle:Fiches:Teacher/create.html.twig")
     * @Method({"POST","GET"})
     */
    public function createAction(Request $request)
    {
        $token = $this->get('security.context')->getToken();
        $doctrine = $this->getDoctrine();
        $statusRp = $doctrine->getRepository('PublicBundle:Status');
        $studentRp = $doctrine->getRepository('UserBundle:User');
        $unpublished = $statusRp->findOneBy(array('name'=>'UNPUBLISHED'));
        $user = $token->getUser();
        $em = $doctrine->getManager();
        $fiche = new Fiche();
        $ficheType = new FicheType();
        $form = $this->createForm($ficheType, $fiche);
        $form->handleRequest($request);
        if ($request->isMethod('POST')){
            if ($form->isValid() && $form->isSubmitted()) {
                $data = $form->getData();
                $data->setTeacher($user);
                $data->setStatus($unpublished);

                // on s'assure la liaison entre Fiche et Choix
                $data->setChoices($data->getChoices());

                // on crée des entités scores pour le niveau donné.
                $niveau = $data->getNiveau();

                $students = $studentRp->findBy(array('niveau' => $niveau->getId() ));
                $undone = $statusRp->findOneBy(array('name'=>'UNDONE'));
                foreach ($students as $key=>$student){
                    $score = new Score();
                    $score->setNote(0);
                    $score->setStatus($undone);
                    $score->setStudent($student);
                    $score->setFiche($data);
                    $em->persist($score);
                }

                $em->persist($data);
                $em->flush();
                $message = "Votre fiche a été créée";
                $request->getSession()->getFlashBag()->set('notice', $message);
                $urlRedirect = $this->generateUrl('teacher.fiches.home');
                return $this->redirect($urlRedirect);
            }
        }
        return array('form' => $form->createView());
    }
    /**
     * @Route("professeur/fiches/update/{id}", name="teacher.fiches.update")
     * @Template("DashboardBundle:Fiches:Teacher/update.html.twig")
     * @Method({"POST","GET"})
     */
    public function updateAction($id,Request $request)
    {
        $doctrine = $this->getDoctrine();
        $rp = $doctrine->getRepository('DashboardBundle:Fiche');
        $statusRp = $doctrine->getRepository('PublicBundle:Status');
        $studentRp = $doctrine->getRepository('UserBundle:User');

        $em = $doctrine->getManager();
        $fiche = $rp->findOneBy(array('id'=>$id));

        if(empty($fiche)) {
            throw $this->createNotFoundException('La fiche n\'existe pas');
        }

        $niveauFiche = $fiche->getNiveau();
        $ficheType = new FicheType();
        $form = $this->createForm($ficheType, $fiche)
            ->add('status','entity',array(
                'class' => 'PublicBundle:Status',
                'property' => 'label'
            ));
                               // echo '<pre>';Debug::dump($fiche->getChoices());echo '</pre>';exit();
        $statusActuel = $fiche->getStatus() ;
        $form->handleRequest($request);
        if ($request->isMethod('POST')){
            if ($form->isValid() && $form->isSubmitted()) {
                $data = $form->getData();

                $data->setStatus($statusActuel);
                $dataNiveau = $data->getNiveau();

                // si changement de niveau : réinitialisation des scores et attributions de nouveaux "scores" aux étudiants du niveau correspondant.
                // faire une validation intermédiaire en js confirm()
                if ($dataNiveau != $niveauFiche ){
                    $scores = $data->getScores();
                    foreach($scores as $score){
                        $score->remove();
                    }
                    if (count($scores) == 0){
                        $undone = $statusRp->findOneBy(array('name'=>'UNDONE'));

                        $students = $studentRp->findBy(array('niveau' => $dataNiveau->getId() ));
                        foreach ($students as $key=>$student){
                            $score = new Score();
                            $score->setNote(0);
                            $score->setStatus($undone);
                            $score->setStudent($student);
                            $score->setFiche($data);
                            $em->persist($score);
                        }
                    }
                }

                $em->persist($data);
                $em->flush();
                $message = "Votre fiche a été créée";
                $request->getSession()->getFlashBag()->set('notice', $message);
                $urlRedirect = $this->generateUrl('teacher.fiches.home');
                return $this->redirect($urlRedirect);
            }
        }
        return array('form' => $form->createView());
    }
    /**
     * @Route("/professeur/fiche/delete/{id}", name="teacher.fiche.delete", options={"expose"=true})
     */
    public function deleteAction($id, Request $request){
        $doctrine   = $this->getDoctrine();
        $em         = $doctrine->getManager();
        $repository = $doctrine->getRepository('DashboardBundle:Fiche');
        $fiche       = $repository->find($id);

        if(empty($fiche)) {
            throw $this->createNotFoundException('La fiche n\'existe pas');
        }

        $em->remove($fiche);
        $em->flush();
        $message = "La fiche a bien été supprimée";
        $request->getSession()->getFlashBag()->set('notice', $message);
        $urlRedirect = $this->generateUrl('teacher.fiches.home');
        return $this->redirect($urlRedirect);
    }
    /**
     * @Route("/professeur/fiche/edit/status/{id}", name="teacher.fiche.editStatus", options={"expose"= true})
     */
    public function editStatusAction($id){
        $doctrine   = $this->getDoctrine();
        $em = $doctrine->getManager();
        $repository = $doctrine->getRepository('DashboardBundle:Fiche');
        $repositoryStatus = $doctrine->getRepository('PublicBundle:Status');
        $fiche    = $repository->find($id);
        if ($fiche->getStatus()->getId() == 1 ){
            $status = $repositoryStatus->find(2);
            $fiche->setStatus($status);
            $message = "non publié";
        }
        else{
            $status = $repositoryStatus->find(1);
            $fiche->setStatus($status);
            $message = "publié";
        }
        $em->persist($fiche);
        $em->flush();
        $response = array('status'=>'OK','message'=>$message);
        return new JsonResponse($response);
    }
    /**
     * @Route("/professeur/fiches/multiple/", name="teacher.fiches.multiple", options={"expose"=true})
     * @Method({"POST","GET"})
     */
    public function ManageMultipleAction(Request $request){
        $action = $request->query->get('action');
        $ids    = $request->query->get('ids');
        $ids = explode(',',$ids);
        $doctrine   = $this->getDoctrine();
        $em         = $doctrine->getManager();
        $postRp = $doctrine->getRepository('DashboardBundle:Fiche');
        $statusRp = $doctrine->getRepository('PublicBundle:Status');
        $posts = $postRp->getFichesById($ids);
        switch ($action) {
            case 'UNPUBLISH' :
                $unpublished = $statusRp->findOneBy(array('name'=>'UNPUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($unpublished);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre fiche n\'est plus publié' : 'Vos '.count($posts).' fiches ne sont plus publiés' ;
                break ;
            case 'PUBLISH' :
                $published = $statusRp->findOneBy(array('name'=>'PUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($published);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre fiche a été publié' : 'Vos '.count($posts).' fiches ont été publiés' ;
                break ;
            case 'DELETE':
                foreach ($posts as $post){
                    $em->remove($post);
                }
                $message = ( count($posts) == 1 ) ? 'La fiche a été supprimé' : 'Vos '.count($posts).' fiches ont été supprimés avec succès' ;
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
