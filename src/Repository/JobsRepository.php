<?php

namespace App\Repository;

use App\Entity\Jobs;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Categories;

/**
 * @method Jobs|null find($id, $lockMode = null, $lockVersion = null)
 * @method Jobs|null findOneBy(array $criteria, array $orderBy = null)
 * @method Jobs[]    findAll()
 * @method Jobs[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class JobsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Jobs::class);
    }

    // /**
    //  * @return Jobs[] Returns an array of Jobs objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('j')
            ->andWhere('j.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('j.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Jobs
    {
        return $this->createQueryBuilder('j')
            ->andWhere('j.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */

    public function getLast10Jobs()
    {
        $em = $this->getEntityManager();
        $dql = $em->createQuery('SELECT j FROM App\Entity\Jobs j JOIN j.categorieId c WHERE j.active = 1 ORDER BY j.id DESC')->setMaxResults(10);
        return $dql->getResult();
    }

    public function searchJob($motCle){
        $em = $this->getEntityManager();
        $dql = 'SELECT j FROM App\Entity\Jobs j WHERE j.denomination LIKE \'%'.$motCle.'%\'';
        $result = $em->createQuery($dql);
        return $result->getResult();
    }

    public function jobsByCateg($cat){
        $em = $this->getEntityManager();
        $dql = 'SELECT j FROM App\Entity\Jobs j JOIN j.categorieId c WHERE c.nom = ?1';
        $result = $em->createQuery($dql);
        $result->setParameter(1,$cat);
        return $result->getResult();
    }

    public function jobByToken($token){
        $em = $this->getEntityManager();
        $dql = 'SELECT j FROM App\Entity\Jobs j JOIN j.categorieId c WHERE j.token = ?1';
        $result = $em->createQuery($dql);
        $result->setParameter(1,$token);
        return $result->getResult();
    }

    public function updateJob($jobId, $dateExpire){
        // if(date_diff(date('Y-m-d H:i:s'),$dateExpire<=5){

        // }
        $em = $this->getEntityManager();
        $dateExpire = date_add(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')), date_interval_create_from_date_string('30 days'));
        $dql = 'UPDATE App\Entity\Jobs j SET j.updated = CURRENT_TIMESTAMP(), j.expire = ?1 WHERE j.id = ?2';
        $result = $em->createQuery($dql);
        $result->setParameter(1, $dateExpire);
        $result->setParameter(2, $jobId);
        $result->getResult();
        return 'Annonce mise à jours';
    }
}
