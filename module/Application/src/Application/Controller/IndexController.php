<?php

namespace Application\Controller;

use SpiffyConfig\Annotation\Route;
use Zend\Mvc\Controller\AbstractActionController;

class IndexController extends AbstractActionController
{
    /**
     * @Route\Literal("/", name="home")
     */
    public function indexAction()
    {
    }
}