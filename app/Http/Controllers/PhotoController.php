<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PhotoController extends Controller
{
    public function store(Request $request)
    {
        if ($request->hasFile('image') && $request->image->isValid()) {
            $allow_types = ['image/png', 'image/jpeg', 'image/gif'];

            if (!in_array($request->image->getMimeType(), $allow_types)) {
                return ['status' => 0, 'msg' => '图片类型不正确!'];
            }

            if ($request->image->getClientSize() > 1024 * 1024 * 3) {
                return ['status' => 0, 'msg' => '图片大小不能超过 3M！'];
            }

            $path = $request->image->store('public/images');

            //上传到本地
//            return ['status' => 1, 'msg' => '/storage' . str_replace('public', '', $path)];

            //本地的绝对路径
            $file_path = storage_path('app/') . $path;
//            return $file_path;
            image_upload($file_path);

            return ['status' => 1, 'msg' => 'http://ow5nehaxj.bkt.clouddn.com/' . basename($file_path)];
        }
    }
}
