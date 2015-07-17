<?php

namespace DashboardBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert ;
/**
 * Choix
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="DashboardBundle\Entity\ChoixRepository")
 */
class Choix
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
     * @var integer
     *
     * @ORM\Column(name="note", type="integer")
     * @Assert\NotBlank(message="Vous devez donner une note à la réponse")
     * @Assert\GreaterThan(value = 0,message="La note doit être strictement positive ")
     *
     */

    private $note;


    /**
     * @var boolean
     *
     * @ORM\Column(name="reponse", type="boolean")
     * @Assert\Choice(choices = {"0","1"}, message = "Choisissez un réponse valide.")
     */

    private $reponse;
    
    /**
     * @var string
     *
     * @ORM\Column(name="content", type="string", length=255)
     * @Assert\NotBlank(message="Vous devez donner une description à ce choix")
     * @Assert\Length(
     *      min = "2",
     *      max = "255",
     *      minMessage = "Votre description doit faire au moins {{ limit }} caractères",
     *      maxMessage = "Votre description ne peut pas être plus longue que {{ limit }} caractères"
     * )
     */
    private $content;

    /**
     * @ORM\ManyToOne(targetEntity="DashboardBundle\Entity\Fiche", inversedBy="choices")
     * @ORM\JoinColumn(name="fiche_id", referencedColumnName="id")
     *
     */
    private $fiche;


    public function __construct(){
        $this->note = 2;
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
     * Set content
     *
     * @param string $content
     * @return Choix
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
     * Set fiche
     *
     * @param \DashboardBundle\Entity\Fiche $fiche
     * @return Choix
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
     * Set note
     *
     * @param integer $note
     * @return Choix
     */
    public function setNote($note)
    {
        $this->note = $note;

        return $this;
    }

    /**
     * Get note
     *
     * @return integer 
     */
    public function getNote()
    {
        return $this->note;
    }

    /**
     * Set reponse
     *
     * @param boolean $reponse
     * @return Choix
     */
    public function setReponse($reponse)
    {
        $this->reponse = $reponse;

        return $this;
    }

    /**
     * Get reponse
     *
     * @return boolean 
     */
    public function getReponse()
    {
        return $this->reponse;
    }
}
