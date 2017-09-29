<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Models\Shop\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //模糊查询
        $where = function($query)use($request){

            //按昵称查询
            if ($request->has('nickname') and $request->nickname != '') {
                $search = "%" . $request->nickname . "%";
                $query->where('nickname', 'like', $search);
            }

            //按微信号查询
            if ($request->has('openid') and $request->openid != '') {
                $search = "%" . $request->openid . "%";
                $query->where('openid', 'like', $search);
            }

            //按性别查询
            if ($request->has('sex') and $request->sex != -1) {
                $query->where('sex', $request->sex);
            }

            //按注册时间查询
            if ($request->has('created_at') and $request->created_at != '') {
                $time = explode("~", $request->input('created_at'));
                $start_time = $time[0].' 00:00:00';
                $end_time   = $time[1].' 23:59:59';
                $query->whereBetween('created_at', [$start_time, $end_time]);
            }

        };

        $customers = Customer::where($where)->orderBy('created_at', 'desc')->paginate(env('pageSize'));
        return view('admin.shop.customer.index', compact('customers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
