<?php

namespace App\Http\Controllers;

use App\Models\laboratorios;
use Illuminate\Http\Request;
use Inertia\Inertia;

class LaboratoriosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data['laboratorios']=laboratorios::get();

        return Inertia('Index',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function criar_laboratorio(Request $request)
    {

            laboratorios::create($request->all());

    }
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(laboratorios $laboratorios)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(laboratorios $laboratorios)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, laboratorios $laboratorios)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(laboratorios $laboratorios)
    {
        //
    }
}
