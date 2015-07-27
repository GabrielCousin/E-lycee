<?php

namespace PublicBundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * CommentaireRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CommentaireRepository extends EntityRepository
{
/*    public function getNbCommentByPost($id){
        $result = $this
            ->createQueryBuilder('c')
            ->select('COUNT(c.id) AS total')
            ->join('c.post','p')
            ->where('p.id = :id')
            ->setParameter(':id',$id)
            ->getQuery()
            ->getSingleScalarResult();
        return $result;
    }*/

    public function getTotalCommentaires() {
        $result = $this
            ->createQueryBuilder('c')
            ->select('COUNT(c.id) AS total')
            ->getQuery()
            ->getSingleScalarResult();

        return $result;
    }
}
