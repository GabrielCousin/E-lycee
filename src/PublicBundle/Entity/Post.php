<?php

namespace PublicBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert ;
use Doctrine\Common\Collections\ArrayCollection ;
use Iphp\FileStoreBundle\Mapping\Annotation as FileStore;



/**
 * Post
 *
 * @ORM\Table(name="post")
 * @ORM\Entity(
 *      repositoryClass="PostRepository"
 * )
 * @FileStore\Uploadable
 */
class Post
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
     * @ORM\Column(name="title", type="string", length=150)
     * @Assert\NotBlank(message="Vous devez renseigner un titre à votre article")
     * @Assert\Length(
     *       min = "2",
     *      max = "150",
     *      minMessage = "Votre titre doit faire au moins {{ limit }} caractères",
     *      maxMessage = "Votre nom ne peut pas être plus long que {{ limit }} caractères"
     * )
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="extract", type="string", length=255)
     * @Assert\NotBlank(message="Vous devez renseigner un extrait à votre article")
     * @Assert\Length(
     *      min = "2",
     *      max = "255",
     *      minMessage = "Votre extrait doit faire au moins {{ limit }} caractères",
     *      maxMessage = "Votre extrait ne peut pas être plus long que {{ limit }} caractères"
     * )
     */
    private $extract;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     * @Assert\NotBlank(message="Vous n'avez pas mis de contenu dans votre article")
     * @Assert\Length(
     *      min = "100",
     *      minMessage = "Votre article doit faire au moins {{ limit }} caractères"
     * )
     */
    private $content;

    /**
     * @var string
     *
     * @ORM\Column(name="picture", type="array", nullable=true)
     * @Assert\Image(
     *      maxSize="2M",
     *      mimeTypes={"image/jpeg","image/png","image/gif"},
     *      mimeTypesMessage="Vous devez transférer des JPG,PNG ou GIF uniquement."
     * )
     * @FileStore\UploadableField(mapping="picture")
     */
    private $picture;

    /**
     * @var datetime
     *
     * @ORM\Column(name="createAt", type="datetime")
     */
    private $createAt;

    /**
     * @ORM\ManyToOne(targetEntity="Status")
     * @ORM\JoinColumn(name="status_id", referencedColumnName="id")
     *
     */
    private $status;

    /**
     * @ORM\ManyToOne(targetEntity="UserBundle\Entity\User", inversedBy="posts")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     *
     */
    private $auteur;

    /**
     * @ORM\OneToMany(targetEntity="Commentaire", mappedBy="post")
     */
    protected $commentaires;

    public function __construct()
    {
        $this->commentaires = new ArrayCollection();
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
     * Set title
     *
     * @param string $title
     * @return Post
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
     * Set extract
     *
     * @param string $extract
     * @return Post
     */
    public function setExtract($extract)
    {
        $this->extract = $extract;

        return $this;
    }

    /**
     * Get extract
     *
     * @return string 
     */
    public function getExtract()
    {
        return $this->extract;
    }

    /**
     * Set content
     *
     * @param string $content
     * @return Post
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
     * Set urlThumbnail
     *
     * @param string $urlThumbnail
     * @return Post
     */
    public function setUrlThumbnail($urlThumbnail)
    {
        $this->urlThumbnail = $urlThumbnail;

        return $this;
    }

    /**
     * Get urlThumbnail
     *
     * @return string 
     */
    public function getUrlThumbnail()
    {
        return $this->urlThumbnail;
    }

    /**
     * Set status
     *
     * @param string $status
     * @return Post
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return string 
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Add commentaires
     *
     * @param \PublicBundle\Entity\Commentaire $commentaires
     * @return Post
     */
    public function addCommentaire(\PublicBundle\Entity\Commentaire $commentaires)
    {
        $this->commentaires[] = $commentaires;

        return $this;
    }

    /**
     * Remove commentaires
     *
     * @param \PublicBundle\Entity\Commentaire $commentaires
     */
    public function removeCommentaire(\PublicBundle\Entity\Commentaire $commentaires)
    {
        $this->commentaires->removeElement($commentaires);
    }

    /**
     * Get commentaires
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCommentaires()
    {
        return $this->commentaires;
    }

    /**
     * Set auteur
     *
     * @param \UserBundle\Entity\User $auteur
     * @return Post
     */
    public function setAuteur(\UserBundle\Entity\User $auteur = null)
    {
        $this->auteur = $auteur;

        return $this;
    }

    /**
     * Get auteur
     *
     * @return \UserBundle\Entity\User
     */
    public function getAuteur()
    {
        return $this->auteur;
    }

    /**
     * Set createAt
     *
     * @param \DateTime $createAt
     * @return Post
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
     * Set picture
     *
     * @param array $picture
     * @return Post
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;

        return $this;
    }

    /**
     * Get picture
     *
     * @return array 
     */
    public function getPicture()
    {
        return $this->picture;
    }
}
