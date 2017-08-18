/**
 * Created by island on 2017/7/18.
 */
function showUploadView() {
    if (!checkCookie()) {
        fail_alert("请登陆后再上传衣物");
    } else {

        var bh = $("body").css("padding-bottom");
        var bw = $("body").width();
        $("#fullbg").css({
            "padding-bottom": bh,
            width: bw,
            display: "block"
        });
        $(document.body).css({
            "overflow-x": "hidden",
            "overflow-y": "hidden"
        });
        $('#uploadView').fadeIn();
    }
}

function closeUploadView() {
    $(document.body).css({
        "overflow-x": "auto",
        "overflow-y": "auto"
    });

    $("#fullbg").css({
        display: "none"
    });

    $('#uploadView').css("display", "none");
}

function uploadClothes() {
    var type = $('#uploadTypeDrop option:selected').text();
    var gender = $('#uploadGenderDrop option:selected').text();
    var size = $('#uploadSizeDrop option:selected').text();
}

Dropzone.options.myDropzone = {
    init: function () {
        this.on("addedfile", function (file) {

            // Create the remove button
            var removeButton = Dropzone.createElement("<button></button>");
            removeButton.className = "removeButton";

            // Capture the Dropzone instance as closure.
            var _this = this;

            // Listen to the click event
            removeButton.addEventListener("click", function (e) {
                // Make sure the button click doesn't submit the form:
                e.preventDefault();
                e.stopPropagation();

                // Remove the file preview.
                _this.removeFile(file);
                // If you want to the delete the file on the server as well,
                // you can do the AJAX request here.
            });

            // Add the button to the file preview element.
            file.previewElement.appendChild(removeButton);
        });

        this.on("successmultiple", function(file, data) {
            success_alert(data.success);
        });

        var submitButton = document.querySelector("#submit-all")
        myDropzone = this; // closure

        submitButton.addEventListener("click", function () {
            if(myDropzone.files.length == 0){
                fail_alert("请至少添加一张图片！");
            }else {
                // var school = $('#uploadSchoolDrop option:selected').text();
                var type = $('#uploadTypeDrop option:selected').text();
                var gender = $('#uploadGenderDrop option:selected').text();
                var size = $('#uploadSizeDrop option:selected').text();
                var donor = $('#id').val();
                // alert(donor);
                if ( type == "" || gender == "" || size == "") {
                    fail_alert("请填写完整信息！");
                } else {
                    $.ajax({
                        url: "/clothesAction/uploadClothes",
                        type: "POST",
                        dataType: "json",
                        data: {
                            "id": donor,
                            // "school": school,
                            "type": type,
                            "gender": gender,
                            "size": size
                        },
                        async: false,
                        success: function (data) {
                            if (data.success == "true") {
                                $('#clothesID').val(data.clothesID);
                                myDropzone.processQueue(); // Tell Dropzone to process all queued files.
                                window.location.href = "../jsp/uploadClothes.jsp";
                                return;
                            }
                            if (data.success == "false") {
                                fail_alert("上传失败！");
                                return;
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            fail_alert("哎呀，网络似乎不太好...");
                        }
                    });

                    // myDropzone.processQueue(); // Tell Dropzone to process all queued files.
                }
            }
        });

    }
};

function uploadType() {
    var type = $('#typeCheck').is(":checked");
    if (type){
        $('#uploadView').fadeOut();
        $('#uploadOldView').fadeIn();
    }else{
        $('#uploadView').fadeIn();
        $('#uploadOldView').fadeOut();
    }
}

function getAllTypes(id) {
    clearSelectList(id);
    jQuery.ajax( {
        type : 'POST',
        url : '/clothesAction/allTypesOfUser',
        data:{
            "id": getCookie('id')
        },
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption(id, "null", "");
                $.each(data.type, function(i, item) {
                    addOption(id, item, item);
                    // fail_alert(i);
                });
            }
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}