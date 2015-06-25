<?php

namespace PublicBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class PublicController extends Controller
{
    /**
     * @Route("/home",name="public.home.index")
     * @Template("PublicBundle:Public:home.html.twig")
     */
    public function indexAction()
    {
        return array();
    }

    /**
     * @Route("/actus/{page}", name="public.membres.index", defaults = { "page" = 1 } )
     * @Template("PublicBundle:Public:news.html.twig")
     */
    public function actuAction($id)
    {
        return array();
    }

}
