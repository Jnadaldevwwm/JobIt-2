<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\Affilies;

class AffiliesController extends AbstractController
{
    /**
     * @Route("/affilies", name="affilies")
     */
    public function index(): Response
    {
        return $this->render('affilies/index.html.twig', [
            'controller_name' => 'AffiliesController',
        ]);
    }

    /**
     * @Route("/affiliesconfirm", name="affiliesconfirm")
     */
    public function affiliesconfirm(Request $rq): Response
    {
        $dataForm = $rq->request->all();
        //check Nom :
        $affilieTest = $this->getDoctrine()
                        ->getRepository('App\Entity\Affilies')
                        ->findBy(array(
                            'nom' => $dataForm['nom']
                        ));
        if($affilieTest == NULL){
            $affilieTest = $this->getDoctrine()
                        ->getRepository('App\Entity\Affilies')
                        ->findBy(array(
                            'email' => $dataForm['email']
                        ));
            if($affilieTest == NULL){
                $affilieTest = $this->getDoctrine()
                        ->getRepository('App\Entity\Affilies')
                        ->findBy(array(
                            'url' => $dataForm['site']
                        ));
                if($affilieTest == NULL){
                    $errorMsg = NULL;
                    $partenaire = new Affilies;
                    $partenaire->setUrl($dataForm['site']);
                    $partenaire->setNom($dataForm['nom']);
                    $partenaire->setEmail($dataForm['email']);
                    $partenaire->setActive(0);
                    $partenaire->setCreated(\DateTime::createFromFormat('Y-m-d H:i:s', date('Y-m-d H:i:s')));

                    $em = $this->getDoctrine()->getManager();
                    $em->persist($partenaire);
                    $em->flush();

                } else {
                    $errorMsg = 'Un partenaire avec ce site web existe déja';
                }
            } else {
                $errorMsg = 'Un partenaire avec cet email existe déja';
            }
        } else {
            $errorMsg = 'Un partenaire avec ce nom existe déja';
        }

        


        return $this->render('affilies/affiliesconfirm.html.twig', [
            'controller_name' => 'AffiliesController', 'error' => $errorMsg
        ]);
    }
}
