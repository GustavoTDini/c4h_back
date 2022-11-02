<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
require '..z';

class BlogController extends AbstractController
{
    #[Route('/usuarios/getAll')]
    public function list(): Response
    {
        // ...
    }
}
