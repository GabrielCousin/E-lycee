<?php

namespace DashboardBundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * ScoreRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ScoreRepository extends EntityRepository
{
    // retourne les score/fiches qui sont publiées 
    public function getScoreSeenStudent($id_student){
        $results = $this
            ->createQueryBuilder('s')
            ->join('s.fiche','f')
            ->join('f.status','status')
            ->where('status.name = \'PUBLISHED\'')
            ->andWhere('s.student = :id')
            ->setParameter(':id',$id_student)
            ->orderBy('status.id','DESC')
            ->getQuery()
            ->getResult();
        return $results ;
    }

}
