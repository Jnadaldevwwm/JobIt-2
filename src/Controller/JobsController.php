<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Jobs;
use Knp\Component\Pager\PaginatorInterface;
use App\Service\FileUploader;

class JobsController extends AbstractController
{
    /**
     * @Route("/jobs", name="jobs")
     */
    public function index(Request $rq): Response
    {
        $jobId = $rq->query->get('jobId');
        $job = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->find($jobId);

        return $this->render('jobs/index.html.twig', [
            'controller_name' => 'JobsController', 'job' => $job
        ]);
    }

     /**
     * @Route("/searchJob", name="searchJob")
     */
    public function searchJob(Request $rq)
    {
        $keywords = $rq->request->get('recherche');
        $jobs = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->searchJob($keywords);

        return $this->render('jobs/search.html.twig', [
            'controller_name' => 'JobsController', 'jobs'=> $jobs, 'keys' => $keywords
        ]);
    }

     /**
     * @Route("/categorie", name="categorie")
     */
    public function jobsByCateg(Request $rq,PaginatorInterface $paginator)
    {
        $nomCat = $rq->query->get('nomCat');
        $jobs = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->jobsByCateg($nomCat);

        $paginnedJob = $paginator->paginate(
            $jobs,
            $rq->query->getInt('page', 1),
            10 // resultat par page
        );
        return $this->render('jobs/jobsByCateg.html.twig', [
            'controller_name' => 'JobsController', 'jobs' => $paginnedJob, 'cat' => $nomCat
        ]);
    }

    /**
     * @Route("/createForm", name="createForm")
     */
    public function createFormJob()
    {
        $categs = $this->getDoctrine()
                    ->getRepository('App\Entity\Categories')
                    ->findAll();

        return $this->render('jobs/createForm.html.twig', [
            'controller_name' => 'JobsController', 'categs' => $categs
        ]);
    }

     /**
     * @Route("/createJob", name="createJob")
     */
    public function createJob(Request $rq, FileUploader $file_uploader)
    {
        $data = $rq->request->all();
        // $objetJob = $this->getDoctrine()->getRepository('App\Entity\Jobs')->createJob($data);

        $job = new Jobs;
    
        $categ = $this->getDoctrine()->getRepository('App\Entity\Categories')->find($data['cat'],$lockMode = null);
        $job->setCategorieId($categ);
        $job->setContrat($data['contrat']);
        $job->setEntreprise($data['entreprise']);

        $logo = $rq->files->get('logo');
        $logoNom = $file_uploader->upload($logo);
        $job->setLogo($logoNom);

        $job->setUrl($data['URL']);
        $job->setLieu($data['ville']);
        $job->setPays($data['pays']);
        $job->setEmail($data['mail']);
        $job->setDenomination($data['denomination']);
        $job->setDescription($data['desc']);
        $job->setPostuler($data['postuler']);
        $job->setCreated(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')));
        $job->setExpire(date_add(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')), date_interval_create_from_date_string('30 days')));
        $job->setUpdated(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')));
        $job->setActive(0);
        $job->setToken(bin2hex(random_bytes(50)));

        
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();



        return $this->render('jobs/createJob.html.twig', [
            'controller_name' => 'JobsController', 'job' => $job
        ]);
    }

     /**
     * @Route("/modifJob", name="modifJob")
     */
    public function modifJob(Request $rq)
    {
        $token = $rq->query->get('token');
        $job = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->findByToken($token);

        $categs = $this->getDoctrine()
                    ->getRepository('App\Entity\Categories')
                    ->findAll();
        //dd($job);
        if($job != NULL){
            return $this->render('jobs/modifJob.html.twig', [
            'controller_name' => 'JobsController', 'job' => $job, 'categs' => $categs
        ]);
        } else {
            $error = 'L\'annonce que vous souhaitez modifier n\'existe pas/plus...';
            return $this->render('error.html.twig', [
                'controller_name' => 'JobsController', 'error' => $error
            ]);
        }
        
    }

    /**
     * @Route("/upJob", name="upJob")
     */
    public function updateJob(Request $rq)
    {
        $jobId = $rq->query->get('jobId');
        $job = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->find($jobId);
        $dateExpire = $job->getExpire();

        $maj = $this->getDoctrine()
                    ->getRepository('App\Entity\Jobs')
                    ->updateJob($jobId, $dateExpire);

        return $this->render('jobs/upJob.html.twig', [
            'controller_name' => 'JobsController', 'maj' => $maj
        ]);
    }
}
