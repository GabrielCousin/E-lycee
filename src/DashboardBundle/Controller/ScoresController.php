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
use DashboardBundle\Form\ReponseType;
use DashboardBundle\Form\Choix;
use DashboardBundle\Entity\Score;
use DashboardBundle\Entity\ScoreRepository;
use PublicBundle\Entity\Status;

class  ScoresController extends Controller
{
    /**
     * @Route("etudiant/fiches/list", name="student.fiches.home")
     * @Template("DashboardBundle:Fiches:Student/home.html.twig")
     */
    public function homeAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $scoreRp = $doctrine->getRepository('DashboardBundle:Score');
        $scores = $scoreRp->getScoreSeenStudent($token->getUser()->getId());
        return array('scores' => $scores);
    }

    /**
     * @Route("etudiant/fiche/{id}", name="student.fiches.form")
     * @Template("DashboardBundle:Fiches:Student/form.html.twig")
     * @Method({"POST","GET"})
     */
    public function formAction($id, Request $request)
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $em = $doctrine->getManager();
        $scoreRp = $doctrine->getRepository('DashboardBundle:Score');
        $score = $scoreRp->find($id);

        if(empty($score)) {
            throw $this->createNotFoundException('La fiche n\'existe pas');
        }
        if($token->getUser()->getId() !== $score->getStudent()->getId()){
            throw $this->createNotFoundException('La fiche n\'existe pas');
        }
        if($score->getStatus()->getName() == "DONE"){
            $message = "Vous avez déjà fait cette fiche. Vous ne pouvez donc pas retourner dessus";
            $request->getSession()->getFlashBag()->set('notice', $message);
            return $this->redirect($this->generateUrl('student.fiches.home'));
        }
        if ($score->getFiche()->getStatus()->getName() == "UNPUBLISHED"){
            $message = "Cette fiche n'est plus active";
            $request->getSession()->getFlashBag()->set('notice', $message);
            return $this->redirect($this->generateUrl('student.fiches.home'));       
        }

        $fiche = $score->getFiche();
        // faire une vérification si la fiche n'est pas publiée ou déja faire ....

        $form = $this->createFormBuilder($score) ;
        foreach ($fiche->getChoices() as $choice ){
            $form->add('reponse_'.$choice->getId(),'choice',array(
                'choices'   => array('oui' => 'oui', 'non' => 'non'),
                'label'     => $choice->getContent(),
                'expanded'  => true,
                'mapped'    => false,
                'required'  => true
            ));
        }

        $form = $form->getForm()->handleRequest($request);
        if ($request->isMethod('POST')){
            if ($form->isValid() && $form->isSubmitted()) {
                $choixRp = $doctrine->getRepository('DashboardBundle:Choix');
                $data = $form->all();
                $note = 0 ;
                $max  = 0;
                foreach ($data as $key => $reponse){
                    $id_choix = explode('_',$key)[1];
                    $choix = $choixRp->find($id_choix);
                                    // echo '<pre>';Debug::dump($reponse->getData(), $choix->getReponse() );echo '</pre>';exit();
                    if ($reponse->getData() == $choix->getReponse()){
                       $note += $choix->getNote() ;
                    }
                    $max += $choix->getNote() ;
                }
                $status = $doctrine->getRepository('PublicBundle:Status');
                $done = $status->findOneBy(array('name' => 'DONE'));

                $score->setNote($note);
                $score->setStatus($done);
                $em->persist($score);
                $em->flush();

                $message = "Votre Fiche a bien été soumise. Votre note est de ".$note."/".$max;
                $request->getSession()->getFlashBag()->set('notice', $message);
                $urlRedirect = $this->generateUrl('student.fiches.home');
                return $this->redirect($urlRedirect);
            }
        }

        return array('score' => $score,'form' => $form->createView());
    }
}
