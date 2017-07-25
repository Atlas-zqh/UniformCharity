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
    var school = $('#uploadSchoolDrop option:selected').text();
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
            alert(data.success);
        });

        var submitButton = document.querySelector("#submit-all")
        myDropzone = this; // closure

        submitButton.addEventListener("click", function () {
            var school = $('#uploadSchoolDrop option:selected').text();
            var type = $('#uploadTypeDrop option:selected').text();
            var gender = $('#uploadGenderDrop option:selected').text();
            var size = $('#uploadSizeDrop option:selected').text();
            if (school == "" || type == "" || gender == "" || size == "") {
                fail_alert("请填写完整信息！");
            }else {

                myDropzone.processQueue(); // Tell Dropzone to process all queued files.
            }
        });

    }
};