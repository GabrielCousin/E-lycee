<?php

namespace PublicBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert ;
use Iphp\FileStoreBundle\Mapping\Annotation as FileStore;


/**
 * Commentaire
 *
 * @ORM\Table(name="commentaire")
 * @ORM\Entity(repositoryClass="PublicBundle\Entity\CommentaireRepository")
 */
class Commentaire
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="contenu", type="text")
     * @Assert\NotBlank(message="Vous n'avez pas mis de contenu à votre commentaire")
     */
    private $contenu;

    /**
     * @var datetime
     *
     * @ORM\Column(name="createAt", type="datetime")
     *
     */
    private $createAt;

    /**
     * @var string
     *
     * @ORM\Column(name="username", type="string", length=150)
     * @Assert\NotBlank(message="Vous devez mettre un pseudo à votre commentaire")
     *  @Assert\Length(
     *      min = "2",
     *      max = "150",
     *      minMessage = "Votre pseudo doit faire au moins {{ limit }} caractères",
     *      maxMessage = "Votre pseudo ne peut pas être plus long que {{ limit }} caractères")
     */
    private $username;

    /**
     * @ORM\ManyToOne(targetEntity="Post", inversedBy="commentaires")
     * @ORM\JoinColumn(name="post_id", referencedColumnName="id")
     *
     */
    private $post;

    /**
     * Get id
     *
     * @return integer 
     */

    public function __construct(){
        $this->createAt = new \Datetime('now');
    }
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set contenu
     *
     * @param string $contenu
     * @return Commentaire
     */
    public function setContenu($contenu)
    {
        $this->contenu = $contenu;

        return $this;
    }

    /**
     * Get contenu
     *
     * @return string 
     */
    public function getContenu()
    {
        return $this->contenu;
    }

    /**
     * Set post
     *
     * @param \PublicBundle\Entity\Post $post
     * @return Commentaire
     */
    public function setPost(\PublicBundle\Entity\Post $post = null)
    {
        $this->post = $post;

        return $this;
    }

    /**
     * Get post
     *
     * @return \PublicBundle\Entity\Post 
     */
    public function getPost()
    {
        return $this->post;
    }

     /**
     * Set createAt
     *
     * @param \DateTime $createAt
     * @return Commentaire
     */
    public function setCreateAt($createAt)
    {
        $this->createAt = $createAt;

        return $this;
    }

    /**
     * Get createAt
     *
     * @return \DateTime 
     */
    public function getCreateAt()
    {
        return $this->createAt;
    }

    /**
     * Set username
     *
     * @param string $username
     * @return Commentaire
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username
     *
     * @return string 
     */
    public function getUsername()
    {
        return $this->username;
    }
}
