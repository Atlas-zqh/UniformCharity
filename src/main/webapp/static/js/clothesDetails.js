/**
 * Created by island on 2017/7/26.
 */
function changePic(id) {
    var pic = document.getElementById('pic');
    pic.src = document.getElementById(id).src;
}

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
                $('#title').html(data.clothes.schoolName + '-' + data.clothes.clothesType);
                $('#clothesID').html(data.clothes.clothesID);
                $('#user').html(data.user.username);
                $('#user').onclick = function () {
                    //todo
                    window.open("");
                };
                $('#school').html(data.clothes.schoolName);
                $('#type').html(data.clothes.clothesType);
                $('#gender').html(data.clothes.gender);
                $('#size').html(data.clothes.clothesHeight);
                if(data.clothes.status == 'Available'){
                    $('#status').html("未售出");
                }else{
                    $('#status').html("已售出");
                }
                $('#pic').attr("src", data.pics[0]);
                $('#price').html("¥ " + data.price);

                for(var i = 0; i < data.pics.length; i++){
                    $('#box' + (i + 1)).css("display", "table-cell");
                    $('#pic' + (i + 1)).attr("src", data.pics[i]);
                    var img = document.createElement('img');
                    img.src = data.pics[i];
                    var detail = document.getElementById('detailPart');
                    detail.appendChild(img);
                }
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

function buyClothes() {
    var clothesID = $('#clothesID').html();
    window.location.href = "../jsp/confirmOrder.jsp?id=" + clothesID;
}