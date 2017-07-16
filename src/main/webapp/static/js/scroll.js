var area1 = document.getElementById('scroll');
var cont11 = document.getElementById('scroll1');
var cont12 = document.getElementById('scroll2');

// area.scrollTop = 0;
area1.scrollTop = 0;
// 克隆cont1给cont2
cont12.innerHTML = cont11.innerHTML;

function myScroll1() {
    if(area1.scrollTop >= cont11.scrollHeight) {
        area1.scrollTop = 0;
    }else {
        area1.scrollTop++;
    }
}

var time = 50;
var interval1 = setInterval('myScroll1()', time);

area1.onmouseover = function () {
    clearInterval(interval1);
};

area1.onmouseout = function () {
    // 继续执行之前的定时器
    interval1 = setInterval('myScroll1()', time);
};

var area2 = document.getElementById('scroll3');
var cont21 = document.getElementById('scroll4');
var cont22 = document.getElementById('scroll5');

// area.scrollTop = 0;
area2.scrollTop = 0;
// 克隆cont1给cont2
cont22.innerHTML = cont21.innerHTML;

function myScroll2() {
    if(area2.scrollTop >= cont21.scrollHeight) {
        area2.scrollTop = 0;
    }else {
        area2.scrollTop++;
    }
}

var interval2 = setInterval('myScroll2()', time);

area2.onmouseover = function () {
    clearInterval(interval2);
};

area2.onmouseout = function () {
    // 继续执行之前的定时器
    interval2 = setInterval('myScroll2()', time);
};