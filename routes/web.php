<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/',[App\Http\Controllers\LaboratoriosController::class,'index']);
Route::post('/criar_laboratorio',[App\Http\Controllers\LaboratoriosController::class,'criar_laboratorio']);
Route::post('/editar_laboratorio',[App\Http\Controllers\LaboratoriosController::class,'editar_laboratorio']);
