<?php

namespace App\Services;
use Illuminate\Support\Facades\Http;
class ExternalApiService
{
    protected string $baseUrl;
    public function __construct()
    {
        $this->baseUrl = config('app.external_api_url');
    }
    public function fetchData(): array
    {
        $response = Http::get($this->baseUrl);
        if ($response->successful()) {
            return $response->json();
        }
        return [];
    }
}
