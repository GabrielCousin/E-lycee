<?php
    namespace DashboardBundle\Service;

class ManageMultiple {
    private $doctrine;
    public function __construct($doctrine){
        $this->doctrine = $doctrine;
    }

    public function ficheStatusManage(Array $ids,$action){
        $em         = $this->doctrine->getManager();
        $postRp = $this->doctrine->getRepository('DashboardBundle:Fiche');
        $statusRp = $this->doctrine->getRepository('PublicBundle:Status');
        $posts = $postRp->getFichesById($ids);
        switch ($action) {
            case 'UNPUBLISH' :
                $unpublished = $statusRp->findOneBy(array('name'=>'UNPUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($unpublished);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre fiche n\'est plus publié' : 'Vos '.count($posts).' fiches ne sont plus publiés' ;
                break ;
            case 'PUBLISH' :
                $published = $statusRp->findOneBy(array('name'=>'PUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($published);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre fiche a été publié' : 'Vos '.count($posts).' fiches ont été publiés' ;
                break ;
            case 'DELETE':
                foreach ($posts as $post){
                    $em->remove($post);
                }
                $message = ( count($posts) == 1 ) ? 'La fiche a été supprimé' : 'Vos '.count($posts).' fiches ont été supprimés avec succès' ;
                break ;
            default :
                $message = "une erreur s'est produite.";
                break;
        }
        $em->flush();
        $response = array('status'=>'OK','message'=>$message);
        return  $response ;
    }


    public function postStatusManager(Array$ids,$action){
        $em         = $this->doctrine->getManager();
        $postRp     = $this->doctrine->getRepository('PublicBundle:Post');
        $statusRp   = $this->doctrine->getRepository('PublicBundle:Status');
        $posts      = $postRp->getPostsByIds($ids);
        switch ($action) {
            case 'UNPUBLISH' :
                $unpublished = $statusRp->findOneBy(array('name'=>'UNPUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($unpublished);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre article n\'est plus publié' : 'Vos '.count($posts).' articles ne sont plus publiés' ;
            break ;
            case 'PUBLISH' :
                $published = $statusRp->findOneBy(array('name'=>'PUBLISHED'));
                foreach ($posts as $post){
                    $post->setStatus($published);
                    $em->persist($post);
                }
                $message = ( count($posts) == 1 ) ? 'Votre article a été publié' : 'Vos '.count($posts).' articles ont été publiés' ;
            break ;
            case 'DELETE':
                foreach ($posts as $post){
                    $em->remove($post);
                }
                $message = ( count($posts) == 1 ) ? 'L\'article a été supprimé' : 'Vos '.count($posts).' articles ont été supprimés avec succès' ;
            break ;
            default :
                $message = "une erreur s'est produite.";
                break;
        }
        $em->flush();
        $response = array('status'=>'OK','message'=>$message);
        return $response;
    }
}