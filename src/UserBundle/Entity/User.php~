<?php

namespace UserBundle\Entity;
use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection ;
 
/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\OneToMany(targetEntity="\PublicBundle\Entity\Post", mappedBy="auteur")
     */
    protected $posts;

    /**
     * @ORM\OneToMany(targetEntity="\DashboardBundle\Entity\Fiche", mappedBy="teacher")
     */
    protected $fiches; // correspond a la liaison teacher_id de celui qui a créé la fiche

    /**
     * @ORM\ManyToOne(targetEntity="DashboardBundle\Entity\Niveau", inversedBy="students")
     * @ORM\JoinColumn(name="lvl_id", referencedColumnName="id")
     *
     */
    private $niveau;

    public function __construct()
    {
        parent::__construct();
        $this->commentaires = new ArrayCollection();
        $this->posts = new ArrayCollection();
        $this->fiches = new ArrayCollection();
    }

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Add post
     *
     * @param \PublicBundle\Entity\Post $post
     * @return User
     */
    public function addPost(\PublicBundle\Entity\Post $post)
    {
        $this->post[] = $post;

        return $this;
    }

    /**
     * Remove post
     *
     * @param \PublicBundle\Entity\Post $post
     */
    public function removePost(\PublicBundle\Entity\Post $post)
    {
        $this->post->removeElement($post);
    }

    /**
     * Get post
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPost()
    {
        return $this->post;
    }

}
