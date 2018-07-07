<?php
declare(strict_types=1);

namespace App\Entities;

class User extends Entity
{
    use Traits\HasRole;
}
