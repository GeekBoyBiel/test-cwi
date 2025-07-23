<?php

return [

    'name' => env('APP_NAME', 'CWI-TESTE'),
    'env' => env('APP_ENV', 'local'),
    'debug' => (bool) env('APP_DEBUG', true),
    'url' => env('APP_URL', 'http://localhost'),
    'timezone' => env('APP_TIMEZONE', 'America/Sao_Paulo'),
    'locale' => env('APP_LOCALE', 'pt-br'),
    'cipher' => 'AES-256-CBC',
    'key' => env('APP_KEY'),

    // Node API URL
    'external_api_url' => env('EXTERNAL_API_URL'),

];
