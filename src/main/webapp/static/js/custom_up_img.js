$(document).ready(function () {
    $("#up-img-touch").click(function () {
        $("#doc-modal-1").modal();
        // $("#doc-modal-1").css("display", "block");
    });
});
$(function () {
    'use strict';
    // 初始化
    var $image = $('#image');
    var $icon = $('#icon');
    $image.cropper({
        aspectRatio: '1',
        autoCropArea: 0.8,
        preview: '.up-pre-after',

    });

    // $icon.cropper({
    //     aspectRatio: '1',
    //     autoCropArea: 0.8,
    //     preview: '.up-pre-after',
    //
    // });

    // 事件代理绑定事件
    $('.docs-buttons').on('click', '[data-method]', function () {

        var $this = $(this);
        var data = $this.data();
        var result = $image.cropper(data.method, data.option, data.secondOption);
        switch (data.method) {
            case 'getCroppedCanvas':
                if (result) {
                    // 显示 Modal
                    $('#cropped-modal').modal().find('.am-modal-bd').html(result);
                    $('#download').attr('href', result.toDataURL('image/jpeg'));
                }
                break;
        }
    });

    // 上传图片
    var $inputImage = $('#inputImage');
    var URL = window.URL || window.webkitURL;
    var blobURL;

    if (URL) {
        $inputImage.change(function () {
            var files = this.files;
            var file;

            if (files && files.length) {
                file = files[0];

                if (/^image\/\w+$/.test(file.type)) {
                    blobURL = URL.createObjectURL(file);
                    $image.one('built.cropper', function () {
                        // Revoke when load complete
                        URL.revokeObjectURL(blobURL);
                    }).cropper('reset').cropper('replace', blobURL);
                    // $icon.one('built.cropper', function () {
                    //     // Revoke when load complete
                    //     URL.revokeObjectURL(blobURL);
                    // }).cropper('reset').cropper('replace', blobURL);
                    $inputImage.val('');
                } else {
                    window.alert('Please choose an image file.');
                }
            }

            // Amazi UI 上传文件显示代码
            var fileNames = '';
            $.each(this.files, function () {
                fileNames += '<span class="am-badge">' + this.name + '</span> ';
            });
            $('#file-list').html(fileNames);
        });
    } else {
        $inputImage.prop('disabled', true).parent().addClass('disabled');
    }

    //绑定上传事件
    $('#up-btn-ok').click(function () {
        var $modal = $('#my-modal-loading');
        var $modal_alert = $('#my-alert');
        var img_src=$image.attr("src");
        if(img_src==""){
            fail_alert("没有选择上传的图片");
            $modal_alert.modal();
            return false;
        }

        $modal.modal();

        var url=$(this).attr("url");
        var canvas=$("#image").cropper('getCroppedCanvas');
        var data=canvas.toDataURL(); //转成base64
        var tmp = "data:image/png;base64,";
        // set_alert_info(data);
        // $modal_alert.modal();
        $modal.modal('close');
        $("#icon").attr("src", data);

        var image = data.replace(/\+/g, "%2B");
        image = image.split(',')[1];
        if(getCookie("username") != null){
            $.ajax({
                url: "/userAction/uploadIcon",
                type: "POST",
                dataType: "json",
                data: {
                    "image": image,
                    "username": getCookie("username")
                },
                async: false,
                success: function (d) {
                    if (d.result == "fail") {
                        fail_alert("哎呀，上传失败了...");
                    }
                    if (d.result == "success") {
                        $('#iconLabel').css("background-image", "url(" + data + ")");
                        $("#doc-modal-1").modal('close');
                        success_alert("上传成功");
                        $modal_alert.modal();
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    fail_alert("哎呀，网络似乎不太好...");
                }
            });
        }else {
            $("#doc-modal-1").modal('close');
            success_alert("上传成功");
            $modal_alert.modal();
        }
        // $.ajax( {
        //     url:url,
        //     dataType:'json',
        //     type: "POST",
        //     data: {"image":data.toString()},
        //     success: function(data, textStatus){
        //         $modal.modal('close');
        //         set_alert_info(data.result);
        //         $modal_alert.modal();
        //         if(data.result=="ok"){
        //             $("#up-img-touch img").attr("src",data.file);
        //
        //             var img_name=data.file.split('/')[2];
        //             console.log(img_name);
        //             $("#pic").text(img_name);
        //         }
        //     },
        //     error: function(){
        //         $modal.modal('close');
        //         set_alert_info("上传文件失败了！");
        //         $modal_alert.modal();
        //         //console.log('Upload error');
        //     }
        // });
    });
});

function rotateimgright() {
    $("#image").cropper('rotate', 90);
}


function rotateimgleft() {
    $("#image").cropper('rotate', -90);
}

function set_alert_info(content) {
    $("#alert_content").html(content);
}



 
