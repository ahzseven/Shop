//上传图片
var opts = {
    type:'POST',
    url:"/photos",
    beforeSend:function () {
        $("#loading").attr('class', 'am-icon-spinner am-icon-spin');
    },
    success: function (result, status) {
        if (result.status == 0) {
            alert(result.msg);
            return false;
        }
        $("input[name='image']").val(result.msg);
        $("#img_show").attr("src", result.msg);
        $("#loading").attr('class', 'am-icon-cloud-upload');
    },
    error: function () {
        alert('图片上传失败');
        $("#loading").attr('class', 'am-icon-cloud-upload');
    }
};
$("#image_upload").fileUpload(opts);