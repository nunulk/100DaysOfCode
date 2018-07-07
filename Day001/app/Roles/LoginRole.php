<?php
declare(strict_types=1);

namespace App\Roles;

class LoginRole implements Role
{
    /**
     * @return \Closure[]
     */
    public function interactions(): array
    {
        return [
            'login' => function () {
                echo 'LoginRole::login called. ' . $this->attributes['email'] . PHP_EOL;
            },
        ];
    }
}