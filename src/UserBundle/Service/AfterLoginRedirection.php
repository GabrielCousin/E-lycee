<?php

namespace UserBundle\Service;

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationSuccessHandlerInterface;
use UserBundle\Entity\User ;
class AfterLoginRedirection implements AuthenticationSuccessHandlerInterface
{
    /**
     * @var \Symfony\Component\Routing\RouterInterface
     */
    private $router;

    /**
     * @param RouterInterface $router
     */
    public function __construct(RouterInterface $router)
    {
        $this->router = $router;
    }

    /**
     * @param Request $request
     * @param TokenInterface $token
     * @return RedirectResponse
     */
    public function onAuthenticationSuccess(Request $request, TokenInterface $token)
    {
        // On récupère la liste des rôles d'un utilisateur
        $roles = $token->getRoles();
        // On transforme le tableau d'instance en tableau simple
        $user = $token->getUser();

        $rolesTab = array_map(function($role){
            return $role->getRole();
        }, $roles);
        if (in_array('ROLE_TEACHER', $rolesTab, true) || in_array('ROLE_ADMIN', $rolesTab, true))
             $redirection = new RedirectResponse($this->router->generate('teacher.home',array('id' => $user->getId())));
        elseif (in_array('ROLE_STUDENT', $rolesTab, true))
            $redirection = new RedirectResponse($this->router->generate('student.home',array('id' => $user->getId())));
        else
            $redirection = new RedirectResponse($this->router->generate('public.home.index'));
        return $redirection;
    }
}