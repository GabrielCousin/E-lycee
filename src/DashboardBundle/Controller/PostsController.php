<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class PostsController extends Controller
{
    /**
     * @Route("professeur/{id}/articles/list", name="teacher.article.view")
     * @Template("Dashboard:Articles:home.html.twig")
     */
    public function homeAction($id)
    {
        return array();
    }
}