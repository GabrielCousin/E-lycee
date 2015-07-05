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
                ->setSubject('Test d\'envoie email')
                ->setFrom('elycee.dev@gmail.com')
                ->setTo(array('elycee.dev@gmail.com', $form->getData()->getEmail()))
                ->setBody($this->renderView('PublicBundle:Public:contactEmail.txt.twig', array('contact' => $contact)));
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

        return array('results' => $results );
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

        return array('form' => $formCommentaire->createView(),'article' => $article );
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
