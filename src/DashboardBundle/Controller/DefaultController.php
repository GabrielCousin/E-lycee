<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DefaultController extends Controller
{
    /**
     * @Route("professeur", name="teacher.home")
     * @Template("DashboardBundle:Default:teacher.html.twig")
     */
    public function teacherAction()
    {
        return array();
    }

    /**
     * @Route("eleve", name="student.home")
     * @Template("DashboardBundle:Default:student.html.twig")
     */
    public function studentAction()
    {
        return array();
    }
}
