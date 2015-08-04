<?php

namespace PublicBundle\Controller;

use PublicBundle\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

use PublicBundle\Entity\Commentaire;
use PublicBundle\Form\CommentaireType;
use PublicBundle\Entity\ContactEmail;
use PublicBundle\Form\ContactEmailType;
use PublicBundle\Form\SearchPostType;
use Symfony\Component\HttpFoundation\Request as Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\SecurityContext;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;


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

        return array('results' => $results);
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
            $message = \Swift_Message::newInstance()
                ->setSubject('E-mail de contact')
                ->setFrom('elycee.dev@gmail.com')
                ->setTo(array('elycee.dev@gmail.com', $form->getData()->getEmail()))
                ->setBody($this->renderView('PublicBundle:Public:contactEmail.html.twig', array('contact' => $contact)), 'text/html');
            $this->get('mailer')->send($message);
            $messageToUser = "Votre message a bien été transmis";
            $request->getSession()->getFlashBag()->set('notice', $messageToUser);
            return $this->redirect($this->generateUrl('public.home.index'));
        }

        return array('form' => $form->createView());
    }


    /**
     * @Route("/actus/{page}", name="public.news.index", defaults= {"page" = 1})
     * @Template("PublicBundle:Public:news.html.twig")
     */
    public function newsAction($page)
    {
        $doctrine       = $this->getDoctrine();
        $rc             = $doctrine->getRepository('PublicBundle:Post') ;
        $postsPerPage   = $this->container->getParameter('home.posts_per_page');
        $results        = $rc->getPostByPage($page, $postsPerPage);
        $maxPostsPages  = $rc->getTotalNewsPages($postsPerPage);

        if (null === $results || empty($results)) {
            throw $this->createNotFoundException('La page n\'existe pas');
        } else {
            return array(
                'results'       => $results,
                'currentPage'   => $page,
                'maxPostsPages' => $maxPostsPages
            );
        }
    }

    /**
     * @Route("/ajaxnews/{page}", name="public.news.ajax", options = {"expose" = true})
     */
    public function ajaxnewsAction(Request $request,$page)
    {

        $doctrine       = $this->getDoctrine();
        $rc             = $doctrine->getRepository('PublicBundle:Post') ;
        $postsPerPage   = $this->container->getParameter('home.posts_per_page');
        if ( null !== $request->query->get('expression')) $expression = $request->query->get('expression');
        if (isset($expression)){
            // echo '<pre>'.DEBUG::dump($expression).'</pre>'; exit();
            $results        = $rc->getPostsByContent($page,$postsPerPage,$expression);
        }
        else {
            $results        = $rc->getPostByPage($page, $postsPerPage); 
        }
        $articleSection = $this->renderView('PublicBundle:includes:article-card.html.twig', array('results' => $results));
        $response = array(
            'articleSection' => $articleSection,
        );

        return new JsonResponse($response);
    }

    /**
     * @Route("/actu/{id}", name="public.news.article")
     * @Template("PublicBundle:Public:article.html.twig")
     */
    public function showPostAction(Request $request, $id)
    {
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $article    = $rc->findOneById($id);

        $user       = $this->getUser();
        $userConnect    = false;

        if (true === $this->get('security.context')->isGranted(
            'IS_AUTHENTICATED_FULLY'
        )) {
            $userConnect = true;
        }

        $commentaire = new Commentaire() ;
        $commentairetype = new CommentaireType();
        $formCommentaire =  $this->createForm($commentairetype, $commentaire);
        $formCommentaire->handleRequest($request);

        if ($formCommentaire->isValid()){
            $data = $formCommentaire->getData();

            $akismet = $this->container->get('ornicar_akismet');
            $isSpam = $akismet->isSpam(array(
                 'comment_author'  => $data->getUsername(),
                 'comment_content' => $data->getContenu()
            ));
            if (!$isSpam){
                $commentaire->setCreateAt(new \DateTime());
                $commentaire->setPost($article);
                $em = $this->getDoctrine()->getManager();
                $em->persist($commentaire);
                $em->flush();
                $message = "Votre commentaire a été ajouté";

            }
            else {
                $message = "Vous avez envoyé trop de commentaire sur ce post";
            }
            $request->getSession()->getFlashBag()->set('notice', $message);
            return $this->redirect($this->generateUrl('public.news.article', array('id' => $id)));
        }

        if (null === $article) {
            throw $this->createNotFoundException('L\'article n\'existe pas');
        } else {
            return array(
                'form' => $formCommentaire->createView(),
                'article' => $article,
                'userConnect' => $userConnect,
                'user' => $user
            );
        }
    }

    /**
     *
     * @Template("PublicBundle:includes:sidelinks.html.twig")
     */
    public function recentArticlesAction($max = 5){
        $doctrine   = $this->getDoctrine();
        $rc         = $doctrine->getRepository('PublicBundle:Post') ;
        $results    = $rc->getPostTitle($max);

        return array('results' => $results);
    }



    /**
     *
     * @Template("PublicBundle:includes:tweets.html.twig")
     */
    public function latestTweetsAction(){
        $twitter = $this->get('endroid.twitter');
        $response = $twitter->query('search/tweets', 'GET', 'json', array('q' => 'ecolemultimedia', 'count' => '3'));
        $tweets = json_decode($response->getContent());
        return array('tweets' => $tweets);
    }


    /**
     * @Route("/searching", name="public.search.index")
     * @Template("PublicBundle:includes:searchBar.html.twig")
     * @Method({"POST","GET"})
     */
    public function searchBarAction(Request $request){
        $form = $this->createForm(new SearchPostType());
        $request = $this->getRequest();
        $form->handleRequest($this->getRequest());
        if ($form->isSubmitted()){
            if ($form->isValid()) {
                $data = $form->getData();
                $expression = $data['expression'];
                // echo '<pre>'.Debug::dump($expression).'</pre>'; exit();
                return $this->redirect($this->generateUrl('public.showResults.index',array('page' => 1 , 'expression' => $expression)));
            }else
            {
                throw $this->createNotFoundException('La recherche effectuée est invalide');
            }
        }
        return array('form' => $form->createView());
    }


    /**
     * @Route("/posts/results/{page}", name="public.showResults.index", options = {"expose" = true}, defaults={"page"= 1})
     * @Template("PublicBundle:Public:showResults.html.twig")
     * @Method({"POST","GET"})
     */
    public function showResultsAction(Request $request,$page){
        $expression = $request->query->get('expression');
        $doctrine   = $this->getDoctrine();
        $rc = $doctrine->getRepository('PublicBundle:Post') ;
        $postsPerPage = $this->container->getParameter('home.posts_per_page');
        $TotalResultsPages = $rc->getTotalResultsPages($postsPerPage,$expression);
        $maxPostsPages = $TotalResultsPages['totalNewsPages'];
        $results = $rc->getPostsByContent($page,$postsPerPage,$expression);
        return array(
            'results'        => $results,
            'currentPage'    => $page,
            'maxPostsPages'  => $maxPostsPages,
            'expression'     => $expression,
            'nbTotalResults' => $TotalResultsPages['totalPosts']
        );
    }
}
