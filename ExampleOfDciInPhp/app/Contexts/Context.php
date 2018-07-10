<?php
declare(strict_types=1);

namespace App\Contexts;

interface Context
{
    public function interact(...$params);
}