<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;

class Handler extends ExceptionHandler
{
    // Exceptions not reported
    protected $dontReport = [
        //
    ];

    // Inputs not included in validation errors
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    // Register error handling callbacks
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }
}
