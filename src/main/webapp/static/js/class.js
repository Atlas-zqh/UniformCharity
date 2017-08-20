/**
 * Created by island on 2017/8/15.
 */
function showGradeContent() {
    $('#gradeContent').css("display", "inline-block");
    $('#classContent').css("display", "none");
    var username = getCookie('username');
    $('#gradeScore').html($('#briefGradeScore').text());
    $.ajax({
        url: "/classAction/gradeCredits",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#schoolScore').html(data.sum);
                var names = [];
                var scores = [];
                $.each(data.credits, function (i, item) {
                    names.push(item.sgrade);
                    scores.push(item.credits);
                    // fail_alert(i);
                });
                initGragh(names, scores, 'gradeChart');
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function showClassContent() {
    $('#classContent').css("display", "inline-block");
    $('#gradeContent').css("display", "none");
    var username = getCookie('username');
    $('#classScore').html($('#briefClassScore').text());
    $.ajax({
        url: "/classAction/classCredits",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#classMem').html(data.user.length);
                var names = [];
                var scores = [];
                $.each(data.user, function (i, item) {
                    names.push(item.username);
                    scores.push(item.credits);
                    // fail_alert(i);
                });
                initGragh(names, scores, 'classChart');
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function initBlocks() {
    var username = getCookie('username');
    // alert(username);
    $.ajax({
        url: "/userAction/getUser",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#gradeLabel').html(data.user.sgrade);
                $('#classLabel').html(data.user.sclass);
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });

    $.ajax({
        url: "/classAction/briefClassCredits",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#briefClassScore').html(data.score);
                $('#briefClassRank').html(data.rank);
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });

    $.ajax({
        url: "/classAction/briefGradeCredits",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                $('#briefGradeScore').html(data.score);
                $('#briefGradeRank').html(data.rank);
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function getClassContent() {
    var username = getCookie('username');
    $.ajax({
        url: "/classAction/classCredits",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                var names = [];
                var scores = [];
                $.each(data.user, function (i, item) {
                    addClassMember(i, item);
                    // fail_alert(i);
                });
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function getGradeContent() {
    var username = getCookie('username');
    $.ajax({
        url: "/classAction/gradeCredits",
        type: "POST",
        dataType: "json",
        data: {
            "username": username
        },
        async: false,
        success: function (data) {
            if (data.success == "true") {
                // success_alert(data.user.username);
                var names = [];
                var scores = [];
                $.each(data.credits, function (i, item) {
                    addGradeMember(i, item);
                    // fail_alert(i);
                });
                return;
            } else {
                fail_alert("哎呀，获取信息失败...");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            fail_alert("哎呀，网络似乎不太好...");
        }
    });
}

function addClassMember(i, item) {
    var studentTable = document.getElementById('studentTable');
    var tbody = document.createElement('tbody');
    tbody.className = 'table-content-body';
    studentTable.appendChild(tbody);

    var tr = document.createElement('tr');
    tbody.appendChild(tr);

    var td1 = document.createElement('td');
    tr.appendChild(td1);
    td1.style.width = '10%';
    td1.appendChild(document.createTextNode(i + 1));

    var td2 = document.createElement('td');
    tr.appendChild(td2);
    td2.style.width = '20%';
    var a = document.createElement('a');
    if (item.personID == getCookie('id')) {
        a.onclick = function () {
            window.open("../jsp/userInfo.jsp");
        };
    }
    else {
        a.onclick = function () {
            window.open("../jsp/friendInfo.jsp?id=" + item.personID);
        };
    }
    a.appendChild(document.createTextNode(item.username));
    td2.appendChild(a);

    var td3 = document.createElement('td');
    tr.appendChild(td3);
    td3.style.width = '20%';
    td3.appendChild(document.createTextNode(item.realName));

    var td4 = document.createElement('td');
    tr.appendChild(td4);
    td4.style.width = '10%';
    td4.appendChild(document.createTextNode(item.credits));
}

function addGradeMember(i, item) {
    var gradeTable = document.getElementById('gradeTable');
    if (gradeTable == null)
        alert("SAd");
    var tbody = document.createElement("tbody");
    tbody.className = "table-content-body";

    var tr = document.createElement('tr');
    tbody.appendChild(tr);

    var td1 = document.createElement('td');
    tr.appendChild(td1);
    td1.appendChild(document.createTextNode(i + 1));

    var td3 = document.createElement('td');
    tr.appendChild(td3);
    td3.appendChild(document.createTextNode(item.sgrade));

    var td4 = document.createElement('td');
    tr.appendChild(td4);
    td4.appendChild(document.createTextNode(item.credits));

    gradeTable.appendChild(tbody);

}

function initGragh(xAxisData, data, id) {
    var chart = echarts.init(document.getElementById(id));

    var option = {
        // title: {
        //     text: '柱状图动画延迟'
        // },
        // legend: {
        //     data: ['bar', 'bar2'],
        //     align: 'left'
        // },
        toolbox: {
            // y: 'bottom',
            feature: {
                // magicType: {
                //     type: ['stack', 'tiled']
                // },
                // dataView: {},
                // saveAsImage: {
                //     pixelRatio: 2
                // }
            }
        },
        tooltip: {},
        xAxis: {
            data: xAxisData,
            silent: false,
            splitLine: {
                show: false
            },
            axisLine: {
                lineStyle: 'grey'
            }
        },
        yAxis: {},
        series: [{
            // name: 'bar',
            type: 'bar',
            barWidth: '20vmax',
            data: data,
            animationDelay: function (idx) {
                return idx * 10;
            }
            // }, {

            //     name: 'bar2',
            //     type: 'bar',
            //     data: data2,
            //     animationDelay: function (idx) {
            //         return idx * 10 + 100;
            //     }
        }],
        animationEasing: 'elasticOut',
        animationDelayUpdate: function (idx) {
            return idx * 5;
        },
        itemStyle: {
            normal: {
                // 设置扇形的颜色
                color: '#e3d391'
                // shadowBlur: 200,
                // shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        },
        textStyle: {
            color: 'grey'
        },
        lineStyle: {
            color: 'grey'
        }
    };
    chart.setOption(option);
}

// var gradeChart = echarts.init(document.getElementById('gradeChart'));
// var classChart = echarts.init(document.getElementById('classChart'));
//
//
//
// var xAxisData = ['1年级', '2年级', '3年级', '4年级', '5年级', '6年级'];
// var data1 = [199, 223, 213, 123, 324, 213];
// // for (var i = 0; i < 12; i++) {
// //     xAxisData.push('类目' + i);
// //     data1.push((Math.sin(i / 5) * (i / 5 -10) + i / 6) * 5);
// //     data2.push((Math.cos(i / 5) * (i / 5 -10) + i / 6) * 5);
// // }
//
// option = {
//     // title: {
//     //     text: '柱状图动画延迟'
//     // },
//     // legend: {
//     //     data: ['bar', 'bar2'],
//     //     align: 'left'
//     // },
//     toolbox: {
//         // y: 'bottom',
//         feature: {
//             // magicType: {
//             //     type: ['stack', 'tiled']
//             // },
//             // dataView: {},
//             // saveAsImage: {
//             //     pixelRatio: 2
//             // }
//         }
//     },
//     tooltip: {},
//     xAxis: {
//         data: xAxisData,
//         silent: false,
//         splitLine: {
//             show: false
//         },
//         axisLine: {
//             lineStyle: 'grey'
//         }
//     },
//     yAxis: {
//     },
//     series: [{
//         // name: 'bar',
//         type: 'bar',
//         barWidth: '20vmax',
//         data: data1,
//         animationDelay: function (idx) {
//             return idx * 10;
//         }
//     // }, {
//
//     //     name: 'bar2',
//     //     type: 'bar',
//     //     data: data2,
//     //     animationDelay: function (idx) {
//     //         return idx * 10 + 100;
//     //     }
//     }],
//     animationEasing: 'elasticOut',
//     animationDelayUpdate: function (idx) {
//         return idx * 5;
//     },
//     itemStyle: {
//         normal: {
//             // 设置扇形的颜色
//             color: '#e3d391'
//             // shadowBlur: 200,
//             // shadowColor: 'rgba(0, 0, 0, 0.5)'
//         }
//     },
//     textStyle: {
//         color: 'grey'
//     },
//     lineStyle: {
//         color: 'grey'
//     }
// };
//
// gradeChart.setOption(option);
// classChart.setOption(option);

window.onresize = function () {

    var gradeChart = echarts.init(document.getElementById('gradeChart'));
    gradeChart.resize();

    var classChart = echarts.init(document.getElementById('classChart'));
    classChart.resize();
};