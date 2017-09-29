<?php

namespace App\Http\Controllers\Admin\System;

use App\Models\System;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class InfoController extends Controller
{
    public function index()
    {
        $system = System::find(1);
        return view('admin.system.info.index', compact('system'));
    }

    public function update(Request $request, $id)
    {
        $system = System::find($id);
        $system->update($request->all());

        return redirect(route('system.config.index'))->with('success', '保存成功');
    }
}
