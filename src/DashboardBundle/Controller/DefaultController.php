<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DefaultController extends Controller
{
    /**
     * @Route("/dashboard/professeur/{user}", name="dashboard.teacher.home", defaults= {"user":"anonymous"})
     * @Template("DashboardBundle:Default:home.html.twig")
     */
    public function homeAction($user)
    {
        return array();
    }
}
