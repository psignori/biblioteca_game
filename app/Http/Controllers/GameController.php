<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoregameRequest;
use App\Http\Requests\UpdategameRequest;
use App\Models\game;

class GameController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoregameRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(game $game)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(game $game)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdategameRequest $request, game $game)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(game $game)
    {
        //
    }
}
