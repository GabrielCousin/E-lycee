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
use PublicBundle\Entity\Status;

class FichesController extends Controller
{
    /**
 * @Route("professeur/fiches/list", name="teacher.fiches.home")
 * @Template("DashboardBundle:Fiches:Teacher/home.html.twig")
 */
    public function homeAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $repository = $doctrine->getRepository('DashboardBundle:Fiche');
        $fiches    = $repository->findBy(array('teacher' => $token->getUser()->getId()));
        return array('fiches' => $fiches);
    }
    /**
     * @Route("professeur/fiches/new", name="teacher.fiches.new")
     * @Template("DashboardBundle:Fiches:Teacher/create.html.twig")
     * @Method({"POST","GET"})
     */
    public function createAction(Request $request)
    {
  /*      echo '<pre>';
        Debug::dump($request->getQueryString());
        echo '</pre>';
        exit();*/

        $token = $this->get('security.context')->getToken();
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository('PublicBundle:Status');
        $unpublished = $repository->findOneBy(array('name'=>'UNPUBLISHED'));
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
                $data->setChoices($data->getChoices());
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
        /*      echo '<pre>';
              Debug::dump($request->getQueryString());
              echo '</pre>';
              exit();*/
        $doctrine = $this->getDoctrine();
        $rp = $doctrine->getRepository('DashboardBundle:Fiche');
        $em = $doctrine->getManager();
        $fiche = $rp->findOneBy(array('id'=>$id));
        $ficheType = new FicheType();
        $form = $this->createForm($ficheType, $fiche)
            ->add('status','entity',array(
                'class' => 'PublicBundle:Status',
                'property' => 'label'
            ));
        $form->handleRequest($request);
        if ($request->isMethod('POST')){
            if ($form->isValid() && $form->isSubmitted()) {
                $data = $form->getData();
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
//                echo '<pre>';Debug::dump($post->getStatus()->getId());echo '</pre>';exit();
//        $status = $repository->find($id);

        $em->remove($fiche);
        $em->flush();
        $message = "La fiche a bien été supprimée";
        $request->getSession()->getFlashBag()->set('notice', $message);
        $urlRedirect = $this->generateUrl('teacher.fiches.view');
        return $this->redirect($urlRedirect);
    }
    /**
     * @Route("/professeur/fiche/edit/status/{id}", name="teacher.fiche.editStatus", options={"expose"=true})
     */
    public function editStatusAction($id){
        $doctrine   = $this->getDoctrine();
        $em = $doctrine->getManager();
        $repository = $doctrine->getRepository('DashboardBundle:Fiche');
        $repositoryStatus = $doctrine->getRepository('PublicBundle:Status');
        $fiche    = $repository->find($id);
//        $status = $repository->find($id);
        if ($fiche->getStatus()->getId() == 1 ){
            $status = $repositoryStatus->find(2);
            $fiche->setStatus($status);
            $message = "Votre Fiche n'est plus publiée";
        }
        else{
            $status = $repositoryStatus->find(1);
            $fiche->setStatus($status);
            $message = "Votre Fiche est désormais publiée";
        }
        $em->persist($fiche);
        $em->flush();
        $response = array('status'=>'OK','message'=>$message);
        return new JsonResponse($response);
    }
}