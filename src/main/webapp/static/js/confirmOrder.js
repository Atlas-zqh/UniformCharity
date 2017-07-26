/**
 * Created by island on 2017/7/26.
 */
$(document).ready(function () {
    var clothesID = (decodeURIComponent(getArgsFromHref(window.location.href, 'id')).split('#')[0]);
    findClothesByID(clothesID);
});

function findClothesByID(clothesID) {
    jQuery.ajax({
        type: 'POST',
        url: '/clothesAction/findClothesByID',
        data: {
            "clothesID": clothesID
        },
        dataType: 'json',
        success: function (data) {
            // alert("success");
            if (data && data.success == "true") {
                $('#title').val(data.clothes.schoolName + '-' + data.clothes.type);
                $('#title').onclick = function () {
                    //todo
                    window.open("");
                };
                $('#user').val(data.clothes.donor);
                $('#user').onclick = function () {
                    //todo
                    window.open("");
                };
                $('#school').val(data.clothes.schoolName);
                $('#type').val(data.clothes.type);
                $('#gender').val(data.clothes.gender);
                $('#size').val(data.clothes.size);
                $('#pic').attr("src", data.clothes.picurl);
                // $('#largePic1').attr("src", data.clothes.picurl);
            } else {
                fail_alert("无结果");
            }
        },
        error: function () {
            fail_alert("哎呀呀，网络似乎不太好...")
        }
    });
}

function pay(){
    window.location.href = "../jsp/payed.jsp";
}