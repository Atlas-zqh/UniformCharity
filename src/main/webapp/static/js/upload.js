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