<?php

namespace DashboardBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Score
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="DashboardBundle\Entity\ScoreRepository")
 */
class Score
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
     * @var float
     *
     * @ORM\Column(name="note", type="float")
     */
    private $note;

    /**
     * @ORM\ManyToOne(targetEntity="DashboardBundle\Entity\Fiche", inversedBy="scores")
     * @ORM\JoinColumn(name="fiche_id", referencedColumnName="id")
     *
     */
    private $fiche;

    /**
     * @ORM\ManyToOne(targetEntity="UserBundle\Entity\User", inversedBy="scores")
     * @ORM\JoinColumn(name="student_id", referencedColumnName="id")
     *
     */
    private $student;

    /**
     * @ORM\ManyToOne(targetEntity="PublicBundle\Entity\Status")
     * @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     *
     */
    private $status;

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
     * Set note
     *
     * @param float $note
     * @return Score
     */
    public function setNote($note)
    {
        $this->note = $note;

        return $this;
    }

    /**
     * Get note
     *
     * @return float 
     */
    public function getNote()
    {
        return $this->note;
    }

    /**
     * Set fiche
     *
     * @param \DashboardBundle\Entity\Fiche $fiche
     * @return Score
     */
    public function setFiche(\DashboardBundle\Entity\Fiche $fiche = null)
    {
        $this->fiche = $fiche;

        return $this;
    }

    /**
     * Get fiche
     *
     * @return \DashboardBundle\Entity\Fiche 
     */
    public function getFiche()
    {
        return $this->fiche;
    }

    /**
     * Set student
     *
     * @param \UserBundle\Entity\User $student
     * @return Score
     */
    public function setStudent(\UserBundle\Entity\User $student = null)
    {
        $this->student = $student;

        return $this;
    }

    /**
     * Get student
     *
     * @return \UserBundle\Entity\User
     */
    public function getStudent()
    {
        return $this->student;
    }

    /**
     * Set status
     *
     * @param \PublicBundle\Entity\Status $status
     * @return Score
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
}
