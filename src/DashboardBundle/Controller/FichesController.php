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
//                echo '<pre>';  Debug::dump($niveau);    echo '</pre>';    exit();
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
        /*      echo '<pre>';
              Debug::dump($request->getQueryString());
              echo '</pre>';
              exit();*/
        $doctrine = $this->getDoctrine();
        $rp = $doctrine->getRepository('DashboardBundle:Fiche');
        $statusRp = $doctrine->getRepository('PublicBundle:Status');
        $studentRp = $doctrine->getRepository('UserBundle:User');

        $em = $doctrine->getManager();
        $fiche = $rp->findOneBy(array('id'=>$id));
        $niveauFiche = $fiche->getNiveau();
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
        $scoreRp = $doctrine->getRepository('DashboardBundle:Score');
        $fiche       = $repository->find($id);
/*        $scores     = $fiche->getScores();
        foreach ($scores as $score){
            $em->remove($score);
            $em->flush();
        }*/
//                echo '<pre>';Debug::dump($post->getStatus()->getId());echo '</pre>';exit();
//        $status = $repository->find($id);

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
//        $status = $repository->find($id);
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
}
