<?php

namespace DashboardBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints as Assert ;
use Iphp\FileStoreBundle\Mapping\Annotation as FileStore;


/**
 * Fiche
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="DashboardBundle\Entity\FicheRepository")
 */
class Fiche
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
     * @ORM\Column(name="title", type="string", length=100)
     * @Assert\NotBlank(message="Vous devez renseigner un titre à votre fiche")
     * @Assert\Length(
     *       min = "2",
     *      max = "100",
     *      minMessage = "Votre titre doit faire au moins {{ limit }} caractères",
     *      maxMessage = "Votre nom ne peut pas être plus long que {{ limit }} caractères"
     * )
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="string", length=255)
     * @Assert\NotBlank(message="Vous devez renseigner la question")
     * @Assert\Length(
     *      min = "2",
     *      max = "255",
     *      minMessage = "Votre question doit faire au moins {{ limit }} caractères",
     *      maxMessage = "Votre question de peut pas faire plus de {{ limit }} caractères"
     * )
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity="UserBundle\Entity\User", inversedBy="fiches")
     * @ORM\JoinColumn(name="teacher_id", referencedColumnName="id")
     *
     */
    private $teacher;

    /**
     * @ORM\ManyToOne(targetEntity="DashboardBundle\Entity\Niveau", inversedBy="fiches")
     * @ORM\JoinColumn(name="lvl_id", referencedColumnName="id")
     *
     */
    private $niveau;

    /**
     * @ORM\ManyToOne(targetEntity="PublicBundle\Entity\Status")
     * @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     *
     */
    private $status;

    /**
     * @ORM\OneToMany(targetEntity="DashboardBundle\Entity\Choix", mappedBy="fiche", cascade={"persist","remove"})
     * @Assert\Valid
     */
    protected $choices;

    /**
     * @ORM\OneToMany(targetEntity="DashboardBundle\Entity\Score", mappedBy="fiche", cascade={"persist","remove"})
     */
    protected $scores;


    public function __construct()
    {
        $this->choices = new ArrayCollection();
        $this->students = new ArrayCollection();
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
     * Set title
     *
     * @param string $title
     * @return Fiche
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set content
     *
     * @param string $content
     * @return Fiche
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string 
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set teacher
     *
     * @param \UserBundle\Entity\User $teacher
     * @return Fiche
     */
    public function setTeacher(\UserBundle\Entity\User $teacher = null)
    {
        $this->teacher = $teacher;

        return $this;
    }

    /**
     * Get teacher
     *
     * @return \UserBundle\Entity\User 
     */
    public function getTeacher()
    {
        return $this->teacher;
    }

    /**
     * Set niveau
     *
     * @param \DashboardBundle\Entity\Niveau $niveau
     * @return Fiche
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
     * Add choices
     *
     * @param \DashboardBundle\Entity\Choix $choices
     * @return Fiche
     */
    public function addChoice(\DashboardBundle\Entity\Choix $choices)
    {
        $this->choices[] = $choices;

        return $this;
    }

    /**
     * Remove choices
     *
     * @param \DashboardBundle\Entity\Choix $choices
     */
    public function removeChoice(\DashboardBundle\Entity\Choix $choices)
    {
        $this->choices->removeElement($choices);
    }

    /**
     * Get choices
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getChoices()
    {
        return $this->choices;
    }

    public function setChoices(ArrayCollection $choices)
    {
        foreach ($choices as $choice) {
            $choice->setFiche($this);
        }

        $this->choices = $choices;
    }


    /**
     * Set status
     *
     * @param \PublicBundle\Entity\Status $status
     * @return Fiche
     */
    public function setStatus(\PublicBundle\Entity\Status $status = null)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return \PublicBundle\Entity\Status 
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Add scores
     *
     * @param \DashboardBundle\Entity\Score $scores
     * @return Fiche
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

    public function setScores(ArrayCollection $scores)
    {
        foreach ($scores as $score) {
            $scores->setFiche($this);
        }

        $this->choices = $choices;
    }
}
