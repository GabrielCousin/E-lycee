<?php

namespace DashboardBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use UserBundle\Entity\User;
use UserBundle\Entity\UserRepository ;

class DefaultController extends Controller
{
    /**
     * @Route("professeur", name="teacher.home")
     * @Template("DashboardBundle:Default:teacher.html.twig")
     */
    public function teacherAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $fiches     = $doctrine->getRepository('DashboardBundle:Fiche')->findBy(array('teacher' => $token->getUser()->getId()));
        $articles   = $doctrine->getRepository('PublicBundle:Post')->getLatestPostsByAuteur($token->getUser()->getId());
        $totalCommentaires = $doctrine->getRepository('PublicBundle:Commentaire')->getTotalCommentaires();
        $nbrStudents = $doctrine->getRepository('UserBundle:User')->getNbrStudents();

        if (empty($articles) || empty($fiches)) {
            return $this->redirect($this->generateUrl('dashboard.onboarding'));
        } else {
            return array(
                'articles' => $articles,
                'fiches' => $fiches,
                'totalCommentaires' => $totalCommentaires,
                'nbrStudents' => $nbrStudents
            );
        }
    }
    /**
     * @Route("professeur/classe", name="teacher.students.list")
     * @Template("DashboardBundle:Students:list.html.twig")
     */
    public function classroomAction()
    {
        $doctrine = $this->getDoctrine();
        $rc = $doctrine->getRepository('UserBundle:User');
        $students = $rc->getAllStudents();
        return array('students' => $students);
    }
    /**
     * @Route("eleve", name="student.home")
     * @Template("DashboardBundle:Default:student.html.twig")
     */
    public function studentAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $scoreRp = $doctrine->getRepository('DashboardBundle:Score');
        $scores = $scoreRp->getScoreSeenStudent($token->getUser()->getId());

        if (empty($scores)) {
            return $this->redirect($this->generateUrl('dashboard.onboarding'));
        } else {
            return array('scores' => $scores);
        }
    }
}
