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
     * @ORM\OneToMany(targetEntity="\DashboardBundle\Entity\Score", mappedBy="student")
     */
    protected $scores; // correspond a la liason avec les scores d'un utilisateur étudiant

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
        $this->scores = new ArrayCollection();
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


    /**
     * Get posts
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPosts()
    {
        return $this->posts;
    }

    /**
     * Add fiches
     *
     * @param \DashboardBundle\Entity\Fiche $fiches
     * @return User
     */
    public function addFich(\DashboardBundle\Entity\Fiche $fiches)
    {
        $this->fiches[] = $fiches;

        return $this;
    }

    /**
     * Remove fiches
     *
     * @param \DashboardBundle\Entity\Fiche $fiches
     */
    public function removeFich(\DashboardBundle\Entity\Fiche $fiches)
    {
        $this->fiches->removeElement($fiches);
    }

    /**
     * Get fiches
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getFiches()
    {
        return $this->fiches;
    }

    /**
     * Set niveau
     *
     * @param \DashboardBundle\Entity\Niveau $niveau
     * @return User
     */
    public function setNiveau(\DashboardBundle\Entity\Niveau $niveau = null)
    {
        $this->niveau = $niveau;

        return $this;
    }

    /**
     * Get niveau
     *
     * @return \DashboardBundle\Entity\Niveau 
     */
    public function getNiveau()
    {
        return $this->niveau;
    }

    /**
     * Add scores
     *
     * @param \DashboardBundle\Entity\Score $scores
     * @return User
     */
    public function addScore(\DashboardBundle\Entity\Score $scores)
    {
        $this->scores[] = $scores;

        return $this;
    }

    /**
     * Remove scores
     *
     * @param \DashboardBundle\Entity\Score $scores
     */
    public function removeScore(\DashboardBundle\Entity\Score $scores)
    {
        $this->scores->removeElement($scores);
    }

    /**
     * Get scores
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getScores()
    {
        return $this->scores;
    }
}
