<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DefaultController extends Controller
{
    /**
     * @Route("professeur/{id}", name="teacher.home")
     * @Template("DashboardBundle:Default:teacher.html.twig")
     */
    public function teacherAction($id)
    {
        return array();
    }

    /**
     * @Route("eleve/{id}", name="student.home")
     * @Template("DashboardBundle:Default:student.html.twig")
     */
    public function studentAction($id)
    {
        return array();
    }
}
