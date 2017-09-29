<?php
// 引入鉴权类
use Qiniu\Auth;

// 引入上传类
use Qiniu\Storage\UploadManager;

function image_upload($filePath)
{
    // 需要填写你的 Access Key 和 Secret Key
    $accessKey = "qRX9meraUtWf-P4hOrHcpFkXM0xTaQT0nUvmcVgk";
    $secretKey = "FRcy20iHVcUQgq-qegfGZXKoeguuv42PcOL9Prso";
    $bucket    = "public";

    // 构建鉴权对象
    $auth = new Auth($accessKey, $secretKey);

    // 生成上传 Token
    $token = $auth->uploadToken($bucket);

    // 要上传文件的本地路径
//    $filePath = './php-logo.png';

    // 上传到七牛后保存的文件名
    $key = basename($filePath);

    // 初始化 UploadManager 对象并进行文件的上传。
    $uploadMgr = new UploadManager();

    // 调用 UploadManager 的 putFile 方法进行文件的上传。
    list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);

    //删除项目里面缓存的图片
    unlink($filePath);

}
