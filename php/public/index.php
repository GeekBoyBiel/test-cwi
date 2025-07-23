<?php

use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Autoload
require __DIR__.'/../vendor/autoload.php';

// Start Laravel
(require_once __DIR__.'/../bootstrap/app.php')
    ->handleRequest(Request::capture());
