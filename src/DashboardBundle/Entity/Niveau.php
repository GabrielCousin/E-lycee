<?php

namespace DashboardBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection ;

/**
 * Niveau
 *
 * @ORM\Table(name="niveau")
 * @ORM\Entity(repositoryClass="DashboardBundle\Entity\NiveauRepository")
 */
class Niveau
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
     * @ORM\Column(name="name", type="string", length=25)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="\DashboardBundle\Entity\Fiche", mappedBy="niveau")
     */
    protected $fiches;

    /**
     * @ORM\OneToMany(targetEntity="\UserBundle\Entity\User", mappedBy="niveau")
     */
    protected $students;

    public function __construct()
    {
        $this->fiches = new ArrayCollection();
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
     * Set name
     *
     * @param string $name
     * @return Niveau
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Add fiches
     *
     * @param \DashboardBundle\Entity\Fiche $fiches
     * @return Niveau
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
     * Add students
     *
     * @param \UserBundle\Entity\User $students
     * @return Niveau
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
