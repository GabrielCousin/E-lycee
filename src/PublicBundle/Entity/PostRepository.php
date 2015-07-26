<?php

namespace PublicBundle\Entity;

use Doctrine\ORM\EntityRepository;
use Doctrine\Common\Util\Debug as Debug;
/**
 * UserRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PostRepository extends EntityRepository
{
    public function getThreeLastPost(){
        $results = $this
            ->createQueryBuilder('p')
            ->orderBy('p.createAt','DESC')
            ->where('p.status = 1')
            ->setMaxResults(3)
            ->getQuery()
            ->getResult();
        return $results;
    }

    public function getPostByPage($page, $postsPerPage){
        $offset = $page * $postsPerPage - 1 ;
        $results = $this
            ->createQueryBuilder('p')
            ->orderBy('p.createAt','DESC')
            ->where('p.status = 1')
            ->setFirstResult($offset)
            ->setMaxResults($postsPerPage)
            ->getQuery()
            ->getResult();
        return $results;
    }

    public function getTotalNewsPages($postsPerPage) {
        $totalPosts = $this
            ->createQueryBuilder('p')
            ->select('COUNT(p.title) AS total')
            ->where('p.status = 1')
            ->getQuery()
            ->getSingleScalarResult();
        $totalNewsPages = ceil($totalPosts / $postsPerPage);
        return $totalNewsPages;
    }

    public function getPostByAuteur($id){
        $results = $this
            ->createQueryBuilder('p')
            ->select('p.title, p.id, p.extract, p.createAt','s.label,s.name','a.username,a.firstname,a.lastname')
            ->join('p.auteur','a')
            ->join('p.status','s')
            ->where('a.id = :id')
            ->setParameter(':id',$id)
            ->getQuery()
            ->getResult();
        return $results ;
    }


    public function getPostTitle($max){
        $results = $this
            ->createQueryBuilder('p')
            ->orderBy('p.createAt','DESC')
            ->where('p.status = 1')
            ->setFirstResult(4)
            ->setMaxResults($max)
            ->getQuery()
            ->getResult();

        return $results;
    }

    public function getPostsByIds(Array $ids){
        $stringIds = implode(' ,',$ids);
        $results = $this
            ->createQueryBuilder('p')
            ->where ('p.id IN (' . $stringIds . ')')
            ->getQuery()
            ->getResult();

        return $results ;
    }
}
