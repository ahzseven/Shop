<?php

namespace App\Http\Controllers\Admin;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SystemController extends Controller
{




    public function cache()
    {
        return view('admin.cache');
    }
}
