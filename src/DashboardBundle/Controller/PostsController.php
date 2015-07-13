<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use PublicBundle\Entity\Post ;
use PublicBundle\Entity\PostRepository;

class PostsController extends Controller
{
    /**
     * @Route("professeur/{id}/articles/list", name="teacher.article.view")
     * @Template("DashboardBundle:Articles:home.html.twig")
     */
    public function homeAction($id)
    {
        $doctrine   = $this->getDoctrine();
        $repository = $doctrine->getRepository('PublicBundle:Post');
        $posts    = $repository->getPostByAuteur($id);
        return array('posts' => $posts);
    }
}