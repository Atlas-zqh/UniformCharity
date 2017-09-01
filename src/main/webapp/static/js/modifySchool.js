/**
 * Created by island on 2017/8/27.
 */
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
                fail_alert("请添加一张默认图片！");
            }else {
                // var school = $('#uploadSchoolDrop option:selected').text();
                var name = $('#typeName').val();
                var price = $('#typePrice').val();


                $('#name').val(name);
                $('#price').val(price);
                $('#school').val($('#schoolName').html());
                // alert(donor);
                if ( name == "" || price == "") {
                    fail_alert("请填写完整信息！");
                } else {
                    if(price.match(/^(:?(:?\d+.\d+)|(:?\d+))$/)){
                        myDropzone.processQueue(); // Tell Dropzone to process all queued files.

                    }else{
                        fail_alert('价格只能输入数字！');
                    }

                }
            }
        });

    }
};