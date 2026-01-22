<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    // GET /api/items
    public function index()
    {
        return response()->json(Item::orderBy('id', 'asc')->get());
    }

    // POST /api/items
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string'
        ]);

        $item = Item::create([
            'name' => $request->name
        ]);

        return response()->json($item, 201);
    }

    // DELETE /api/items/{item}
    public function destroy(Item $item)
    {
        $item->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
