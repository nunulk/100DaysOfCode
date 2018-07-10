<?php
declare(strict_types=1);

namespace App\Contexts;

use App\Entities\User;
use App\Roles\LoginRole;

class LoginContext implements Context
{
    private $user;

    public function __construct(User $user)
    {
        $user->assign(new LoginRole());
        $this->user = $user;
    }

    public function interact(...$params)
    {
        echo 'params received: ' . implode(',', $params) . PHP_EOL;
        echo 'this user has login interaction?: ' . ($this->user->hasRole('login') ? 'yes' : 'no') . PHP_EOL;

        return $this->user->login($params);
    }
}