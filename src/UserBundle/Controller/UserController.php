<?php

namespace UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Doctrine\Common\Util\Debug as Debug;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;


class UserController extends Controller
{

    /**
     * @Route("/ajaxlogin", name="user.ajax.login", options = {"expose" = true})
     */
    public function ajaxLoginAction(Request $request) {

        $loginForm = $this->renderView('UserBundle:Security:ajax-login.html.twig');

        $response = array(
            'loginForm' => $loginForm
        );

        return new JsonResponse($response);
    }
}
