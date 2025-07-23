<?php

namespace App\Swagger;

/**
 * @OA\OpenApi(
 *     @OA\Info(
 *         title="API Test CWI",
 *         version="1.0.0",
 *         description="Documentação da API p/ o teste técnico.",
 *         @OA\Contact(
 *             email="gabriel.r.s@outlook.com"
 *         )
 *     ),
 *     @OA\Server(
 *         url="http://localhost:8000",
 *         description="Servidor local"
 *     )
 * )
 */
class SwaggerDoc {} // <- obrigatório ter uma classe para o Swagger-php escanear
