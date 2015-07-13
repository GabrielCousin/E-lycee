<?php

namespace DashboardBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

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
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="string", length=255)
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity="UserBundle\Entity\User", inversedBy="fiches")
     * @ORM\JoinColumn(name="teacher_if", referencedColumnName="id")
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
     * @ORM\OneToMany(targetEntity="DashboardBundle\Entity\Choix", mappedBy="fiche")
     */
    protected $choices;

    /**
     * @ORM\OneToMany(targetEntity="UserBundle\Entity\User", mappedBy="fiche")
     */
    private $students;

    public function __construct()
    {
        $this->choices = new ArrayCollection();
        $this->students = new ArrayCollection();
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

    /**
     * Add students
     *
     * @param \UserBundle\Entity\User $students
     * @return Fiche
     */
    public function addStudent(\UserBundle\Entity\User $students)
    {
        $this->students[] = $students;

        return $this;
    }

    /**
     * Remove students
     *
     * @param \UserBundle\Entity\User $students
     */
    public function removeStudent(\UserBundle\Entity\User $students)
    {
        $this->students->removeElement($students);
    }

    /**
     * Get students
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getStudents()
    {
        return $this->students;
    }
}
