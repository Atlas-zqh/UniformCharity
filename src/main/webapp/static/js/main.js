$(document).ready(function () {
    checkCookie();

    jQuery.ajax( {
        type : 'GET',
        contentType : 'application/json',
        url : 'schoolAction/allSchool',
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                $.each(data.schools, function(i, item) {
                    var drop = document.getElementById('schoolDrop');
                    // alert(drop.options.length);
                    var op = document.createElement("option");      // 新建OPTION (op)
                    drop.options.add(op);
                    op.setAttribute("value", i);          // 设置OPTION的 VALUE
                    op.appendChild(document.createTextNode(item)); // 设置OPTION的 TEXT
                    op.text = item;
                    // $('#info').append(
                    //     "编号：" + item.id + "，姓名：" + item.username
                    //     + "，年龄：" + item.age);
                    // var s = document.getElementById('s');
                });
            }
        },
        error : function() {
            alert("error")
        }
    });
    // alert("aa");
   // $.ajax({
   //
   // });
});
