<?php
declare(strict_types=1);

namespace App\Roles;

use Closure;

interface Role
{
    /**
     * @return Closure[]
     */
    public function interactions(): array;
}