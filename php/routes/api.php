<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ExternalController;
use App\Http\Controllers\HealthCheckController;
Route::get('/', function () {
    return response()->json(['message' => 'Hey, :P']);
});

Route::get('/health', [HealthCheckController::class, 'index']);

Route::get('/external', [ExternalController::class, 'index']);

Route::prefix('users')->group(function () {
    Route::get('/', [UserController::class, 'index']);
    Route::get('/{id}', [UserController::class, 'show']);
    Route::post('/', [UserController::class, 'store']);
    Route::put('/{id}', [UserController::class, 'update']);
    Route::patch('/{id}', [UserController::class, 'update']);
    Route::delete('/{id}', [UserController::class, 'destroy']);
});
