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
//        $repository = $doctrine->getRepository('DashboardBundle:Fiche');
//        $posts    = $repository->getPostByAuteur($token->getUser()->getId());
        return array();
    }
    /**
     * @Route("professeur/fiches/new", name="teacher.fiches.new")
     * @Template("DashboardBundle:Fiches:Teacher/create.html.twig")
     * @Method({"POST","GET"})
     */
    public function createAction(Request $request)
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $user = $token->getUser();
        $em = $doctrine->getManager();
        $fiche = new Fiche();
        $ficheType = new FicheType();
        $form = $this->createForm($ficheType,$fiche);
        $form->handleRequest($request);

        return array('form' => $form->createView());

//        $repository = $doctrine->getRepository('PublicBundle:Post');
//        $posts    = $repository->getPostByAuteur($token->getUser()->getId());
    }

}