<?php

namespace PublicBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Doctrine\Common\Util\Debug as Debug ;
class PublicController extends Controller
{
    /**
     * @Route("/home",name="public.home.index")
     * @Template("PublicBundle:Public:home.html.twig")
     */
    public function indexAction()
    {
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $results    = $rc->getThreeLastPost();

        return array('results' => $results );
    }

    /**
     * @Route("/news", name="public.news.index" )
     * @Template("PublicBundle:Public:news.html.twig")
     */
    public function newsAction()
    {
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $results    = $rc->getPostByPage(1);

        return array('results' => $results );
    }

    /**
     * @Route("/news/{id}", name="public.news.article")
     * @Template("PublicBundle:Public:article.html.twig")
     */
    public function showPostAction($id)
    {
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $article    = $rc->findOneById($id);
        return array('article' => $article );
    }

    /**
     * @Route("/mentions", name="public.mentions" )
     * @Template("PublicBundle:Public:mentions.html.twig")
     */
    public function mentionsAction()
    {
        return array();
    }

    /**
     * @Route("/contacts", name="public.contacts" )
     * @Template("PublicBundle:Public:contacts.html.twig")
     */
    public function contactsAction()
    {
        return array();
    }
    /**
     *
     * @Template("PublicBundle:includes:sidelinks.html.twig")
     */
    public function recentArticlesAction($max = 5){
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $results    = $rc->getPostTitle($max);
/*        echo '<pre>';
        Debug::dump($results);
        echo '</pre>';*/
        return array('results' => $results);
    }

}
