<?php

namespace App\Http\Controllers;

class HealthCheckController extends Controller
{
    /**
     * @OA\Get(
     *     path="/health",
     *     summary="Verificar status da API",
     *     tags={"Sistema"},
     *     @OA\Response(
     *         response=200,
     *         description="API operando normalmente"
     *     )
     * )
     */
    public function index()
    {
        return response()->json(['status' => 'ok']);
    }
}
