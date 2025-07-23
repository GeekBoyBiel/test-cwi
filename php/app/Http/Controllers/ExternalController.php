<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;

class ExternalController extends Controller
{
    /**
     * @OA\Get(
     *     path="/external",
     *     summary="Obter dados do microsserviço externo",
     *     tags={"Sistema"},
     *     @OA\Response(
     *         response=200,
     *         description="Resposta do microsserviço retornada com sucesso"
     *     ),
     *     @OA\Response(
     *         response=500,
     *         description="Erro ao acessar o microsserviço"
     *     )
     * )
     */
    public function index()
    {
        $url = env('EXTERNAL_API_URL');

        try {
            $response = Http::timeout(5)->get($url);

            if ($response->successful()) {
                return response()->json($response->json(), 200);
            }

            return response()->json([
                'error' => 'Falha ao obter dados do serviço externo',
                'status' => $response->status(),
                'body' => $response->body(),
            ], $response->status());
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Erro de conexão com o microsserviço externo',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
