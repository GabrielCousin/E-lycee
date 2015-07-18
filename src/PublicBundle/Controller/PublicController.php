<?php

namespace PublicBundle\Controller;

use PublicBundle\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

use PublicBundle\Entity\Commentaire ;
use PublicBundle\Form\CommentaireType;
use PublicBundle\Entity\ContactEmail;
use PublicBundle\Form\ContactEmailType;
use Symfony\Component\HttpFoundation\Request as Request;
use Symfony\Component\Security\Core\SecurityContext;

use Doctrine\Common\Util\Debug as Debug ;


class PublicController extends Controller
{
    /**
     * @Route("/home",name="public.home.index")
     * @Template("PublicBundle:Public:home.html.twig")
     */
    public function indexAction(\Symfony\Component\HttpFoundation\Request $request)
    {
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $results    = $rc->getThreeLastPost();

        $error = "";
        $session = $request->getSession();

        if ($request->attributes->has(SecurityContext::AUTHENTICATION_ERROR)) {
            $error = $request->attributes->get(SecurityContext::AUTHENTICATION_ERROR);
        } elseif (null !== $session && $session->has(SecurityContext::AUTHENTICATION_ERROR)) {
            $error = $session->get(SecurityContext::AUTHENTICATION_ERROR);
        } else {
            $error = '';
        }

        if ($error) {
            $error = $error->getMessage();
        }

        return array('results' => $results, 'error' => $error);
    }

    /**
     * @Route("/contact",name="public.contact")
     * @Template("PublicBundle:Public:contact.html.twig")
     * @Method({"POST","GET"})
     */
    public function contactAction(Request $request)
    {
        $contact = new ContactEmail();
        $contactType = new ContactEmailType();
        $form = $this->createForm($contactType,$contact);
        $form->handleRequest($request);

        if ($form->isValid()){
//            echo '<pre>';
//            Debug::dump($form->getData());
//            echo '</pre>';
//            exit();
            $message = \Swift_Message::newInstance()
                ->setSubject('E-mail de contact')
                ->setFrom('elycee.dev@gmail.com')
                ->setTo(array('elycee.dev@gmail.com', $form->getData()->getEmail()))
                ->setBody($this->renderView('PublicBundle:Public:contactEmail.html.twig', array('contact' => $contact)), 'text/html');
            $this->get('mailer')->send($message);
            return $this->redirect($this->generateUrl('public.home.index'));
        }
        return array('form' => $form->createView());
    }

    /**
     * @Route("/legal",name="public.legal")
     * @Template("PublicBundle:Public:legal.html.twig")
     */
    public function legalAction()
    {
        return array();
    }

    /**
     * @Route("/lycee",name="public.lycee")
     * @Template("PublicBundle:Public:lycee.html.twig")
     */
    public function lyceeAction()
    {
        return array();
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

        return array('results' => $results);
    }

    /**
     * @Route("/news/{id}", name="public.news.article")
     * @Template("PublicBundle:Public:article.html.twig")
     */
    public function showPostAction(Request $request, $id)
    {
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $article    = $rc->findOneById($id);

        $user       = $this->getUser();

        $commentaire = new Commentaire() ;
        $commentairetype = new CommentaireType();
        $formCommentaire =  $this->createForm($commentairetype, $commentaire);
        $formCommentaire->handleRequest($request);

        if ($formCommentaire->isValid()){
            $commentaire->setCreateAt(new \DateTime());
            $commentaire->setPost($article);
            $em = $this->getDoctrine()->getManager();
            $em->persist($commentaire);
            $em->flush();

            return $this->redirect($this->generateUrl('public.news.article', array('id' => $id)));
        }

        return array('form' => $formCommentaire->createView(), 'article' => $article, 'user' => $user);
    }

    /**
     *
     * @Template("PublicBundle:includes:sidelinks.html.twig")
     */
    public function recentArticlesAction($max = 5){
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $results    = $rc->getPostTitle($max);
        /* echo '<pre>';
        Debug::dump($results);
        echo '</pre>';*/



        return array('results' => $results);
    }

    /**
     *
     * @Template("PublicBundle:includes:tweets.html.twig")
     */
    public function latestTweetsAction(){
        $twitter = $this->get('endroid.twitter');
        $response = $twitter->query('search/tweets', 'GET', 'json', array('q' => 'LLG75005', 'count' => '3'));
        $tweets = json_decode($response->getContent());

        return array('tweets' => $tweets);
    }

}
