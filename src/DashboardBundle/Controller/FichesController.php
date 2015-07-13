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

class FichesController extends Controller
{
    /**
 * @Route("professeur/qcm/list", name="teacher.qcm.view")
 * @Template("DashboardBundle:Fiches:home.html.twig")
 */
    public function homeAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
//        $repository = $doctrine->getRepository('PublicBundle:Post');
//        $posts    = $repository->getPostByAuteur($token->getUser()->getId());
        return array();
    }


}