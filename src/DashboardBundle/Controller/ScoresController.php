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
use DashboardBundle\Form\ChoixType;
use DashboardBundle\Form\Choix;
use DashboardBundle\Entity\Score;
use DashboardBundle\Entity\ScoreRepository;
use PublicBundle\Entity\Status;

class  ScoresController extends Controller
{
    /**
     * @Route("etudiant/fiches/list", name="student.fiches.home")
     * @Template("DashboardBundle:Fiches:Student/home.html.twig")
     */
    public function homeAction()
    {
        $token = $this->get('security.context')->getToken();
        $doctrine   = $this->getDoctrine();
        $scoreRp = $doctrine->getRepository('DashboardBundle:Score');
        $scores = $scoreRp->getScoreSeenStudent($token->getUser()->getId());
        return array('scores' => $scores);
    }
}