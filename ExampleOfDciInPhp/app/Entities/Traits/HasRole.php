<?php
declare(strict_types=1);

namespace App\Entities\Traits;

use App\Roles\Role;
use BadMethodCallException;

trait HasRole
{
    /** @var Role[] */
    protected $roles = [];

    public function assign(Role $role)
    {
        $this->roles = $role->interactions();
    }

    public function hasRole(string $method): bool
    {
        return isset($this->roles[$method]);
    }

    public function __call(string $method, array $params)
    {
        if (!$this->hasRole($method)) {
            throw new BadMethodCallException(sprintf('method %s not exist.', $method));
        }
        return call_user_func_array($this->roles[$method]->bindTo($this, static::class), $params);
    }
}
