<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DefaultController extends Controller
{
    /**
     * @Route("/dashboard/professeur", name="dashboard.teacher.home")
     * @Template("DashboardBundle:Default:home.html.twig")
     */
    public function homeAction($user)
    {
        return array();
    }
}
