<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Jobs;
use App\Entity\Categories;

class IndexController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(): Response
    {

        $jobs = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->getLast10Jobs();
        //$jobs = $this->getDoctrine()->getRepository('App\Entity\Jobs')->findAll();
        $categ = $this->getDoctrine()
                    ->getRepository('App\Entity\Categories')
                    ->findAll();

    // On récupère le nom des catégories retournée dans le resultat des 10 derniers jobs
        $tabCateg = array();
        foreach($jobs as $job){
            if(!in_array($job->getCategorieId()->getNom(), $tabCateg)){
                $tabCateg[] = $job->getCategorieId()->getNom();
            }
        }
        //dd($jobs);
        return $this->render('index/index.html.twig', [
            'controller_name' => 'IndexController', 'jobs' => $jobs, 'cats' => $tabCateg,
        ]);
    }
}
