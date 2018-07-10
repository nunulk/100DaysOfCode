<?php
declare(strict_types=1);

namespace App;

use App\Contexts\LoginContext;
use App\Entities\User;

class Main
{
    public function run()
    {
        echo 'running app...' . PHP_EOL;

        $user = new User(['email' => 'example@localdomain.com']);
        $context = new LoginContext($user);
        $result = $context->interact('hoge', 'fuga');

        echo 'done.' . PHP_EOL;
    }
}
