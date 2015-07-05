<?php
    namespace PublicBundle\Service;

    use PublicBundle\Entity\Commentaire;
    use PublicBundle\Form\CommentaireType;
    use Symfony\Component\HttpFoundation\Request;





    class Commentaires {
        private $request;

        public function __construct(Request $request){
            $this->request = $request;
        }

        public function createFormCommentaires(){
            $entity = new Commentaire();
            $type = new CommentaireType();
            $form   = $this->createForm($type, $entity);


//            $form = $this->createform($type,$commentaire);
            $form->handleRequest($this->request);
            return $form;
        }
        public function getForm(){
            $form = $this->createFormCommentaires();
            return $form;
        }
    }