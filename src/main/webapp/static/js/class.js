/**
 * Created by island on 2017/8/15.
 */
function showGradeContent() {
    $('#gradeContent').css("display", "inline-block");
    $('#classContent').css("display", "none");
}

function showClassContent() {
    $('#classContent').css("display", "inline-block");
    $('#gradeContent').css("display", "none");
}


var gradeChart = echarts.init(document.getElementById('gradeChart'));

var xAxisData = ['1年级', '2年级', '3年级', '4年级', '5年级', '6年级'];
var data1 = [199, 223, 213, 123, 324, 213];
var data2 = [];
// for (var i = 0; i < 12; i++) {
//     xAxisData.push('类目' + i);
//     data1.push((Math.sin(i / 5) * (i / 5 -10) + i / 6) * 5);
//     data2.push((Math.cos(i / 5) * (i / 5 -10) + i / 6) * 5);
// }

option = {
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
    yAxis: {
    },
    series: [{
        name: 'bar',
        type: 'bar',
        barWidth: '20vmax',
        data: data1,
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

gradeChart.setOption(option);

window.onresize = function(){

    var gradeChart = echarts.init(document.getElementById('gradeChart'));
    gradeChart.resize();

};