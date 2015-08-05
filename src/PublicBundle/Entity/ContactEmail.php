<?php

namespace PublicBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert ;
/**
 * Contact
 *
 * @ORM\Table(name="contactemail")
 * @ORM\Entity(repositoryClass="PublicBundle\Entity\ContactRepository")
 */
class ContactEmail
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
     * @ORM\Column(name="prenom", type="string", length=50)
     * @Assert\NotBlank(message="merci de bien vouloir renseigner votre prénom")
     * @Assert\Length(
     *      min = "2",
     *      max = "50",
     *      minMessage = "Votre nom doit faire au minimum {{ limit }} caractères",
     *      maxMessage = "Votre nom ne peut pas être plus long que {{ limit }} caractères"
     * )
     */
    private $prenom;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=50)
     * @Assert\NotBlank(message="merci de bien vouloir renseigner votre nom")
     * @Assert\Length(
     *      min = "2",
     *      max = "50",
     *      minMessage = "Votre nom doit faire au minimum {{ limit }} caractères",
     *      maxMessage = "Votre nom ne peut pas être plus long que {{ limit }} caractères"
     * )
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=150)
     * @Assert\NotBlank(message="vous devez renseigner un email pour que nous puissions vous répondre")
     * @Assert\Email(
     *     message = "'{{ value }}' n'est pas un email valide.",
     *     checkMX = true
     * )
     * @Assert\Length(
     *      min = "2",
     *      max = "150",
     *      minMessage = "Votre email doit faire au minimum {{ limit }} caractères",
     *      maxMessage = "Votre email ne peut pas être plus long que {{ limit }} caractères"
     * )
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="message", type="text")
     * @Assert\NotBlank(message="vous devez écrire un message, qui sera transmis à l'administration de l'école")
     * @Assert\Length(
     *     min = "20",
     *     minMessage = "Votre message doit faire au minimum {{ limit }} caractères",
     * )
     */
    private $message;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="createAt", type="datetime")
     */
    private $createAt;

    public function __construct(){
        $this->createAt = new \Datetime('now');
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
     * Set prenom
     *
     * @param string $prenom
     * @return Contact
     */
    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;

        return $this;
    }

    /**
     * Get prenom
     *
     * @return string 
     */
    public function getPrenom()
    {
        return $this->prenom;
    }

    /**
     * Set nom
     *
     * @param string $nom
     * @return Contact
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string 
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set email
     *
     * @param string $email
     * @return Contact
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set message
     *
     * @param string $message
     * @return Contact
     */
    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    /**
     * Get message
     *
     * @return string 
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * Set createAt
     *
     * @param \DateTime $createAt
     * @return Contact
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
}
