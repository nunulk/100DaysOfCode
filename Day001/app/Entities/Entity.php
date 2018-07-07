<?php
declare(strict_types=1);

namespace App\Entities;

abstract class Entity
{
    protected $attributes;

    public function __construct(array $attributes = [])
    {
        $this->attributes = $attributes;
    }
}
