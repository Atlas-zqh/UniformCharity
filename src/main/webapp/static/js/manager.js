/**
 * Created by island on 2017/8/21.
 */
var schoolName = '';
function selectAddSchool() {
    if ($('#loginView').css("display") == 'block') {
        fail_alert("请先登陆后再进行后续操作！")
    } else {
        if ($('#addSchoolView').css("display") != 'block') {
            initButtons();
            $('#addSchool').css('color', '#142535');
            $('#addSchoolView').fadeIn();
            scrollToMain();
            initAddSchoolView();
        } else {
            scrollToMain();
        }
    }
}

function initAddSchoolView() {

}

function selectSearchSchool() {
    if ($('#loginView').css("display") == 'block') {
        fail_alert("请先登陆后再进行后续操作！")
    } else {
        if ($('#searchView').css("display") != 'block') {
            initButtons();
            $('#searchSchool').css('color', '#142535');
            $('#searchView').fadeIn();
            scrollToMain();
            //todo 初始化搜索框
        } else {
            scrollToMain();
        }
    }
}

function selectPostArticle() {
    if ($('#loginView').css("display") == 'block') {
        fail_alert("请先登陆后再进行后续操作！")
    } else {
        if ($('#postArticleView').css("display") != 'block') {
            initButtons();
            $('#postArticle').css('color', '#142535');
            $('#postArticleView').fadeIn();
            scrollToMain();
        } else {
            scrollToMain();
        }
    }
}

function scrollToMain() {
    $('html, body').animate({
        scrollTop: $("#bodyPart").offset().top
    }, 500);
}

function scrollToTop() {
    $('html, body').animate({
        scrollTop: 0
    }, 500);
}

function initButtons() {
    $('#addSchool').css('color', 'white');
    $('#searchSchool').css('color', 'white');
    $('#postArticle').css('color', 'white');
    $('#addSchoolView').css("display", "none");
    $('#searchView').css("display", "none");
    $('#postArticleView').css("display", "none");
    $('#schoolInfoView').css("display", "none");
    $('#modifySchoolInfoView').css("display", "none");
}

function searchSchool() {
    $('#schoolInfoView').fadeIn();
    $('html, body').animate({
        scrollTop: $("#schoolInfoView").offset().top
    }, 500);
}

function addSchool() {
    document.getElementById('gradeForm').reset();
}

function postArticle() {

}

function closeModifySchoolInfoView() {
    $('html, body').animate({
        scrollTop: $("#schoolInfoView").offset().top
    }, 500, function () {
        $('#modifySchoolInfoView').css("display", "none")
    });


}

function showAddTypeView() {
    $('#addTypeView').css('display', 'block');
    $('#addStudentView').css('display', 'none');
    $('#modifySchoolInfoView').fadeIn();
    $('html, body').animate({
        scrollTop: $("#modifySchoolInfoView").offset().top
    }, 500);
}

function showAddStudentView() {
    $('#addStudentView').css('display', 'block');
    $('#addTypeView').css('display', 'none');
    $('#modifySchoolInfoView').fadeIn();
    $('html, body').animate({
        scrollTop: $("#modifySchoolInfoView").offset().top
    }, 500);
}

function getCities() {
    $.ajax({
        url: '/schoolAction/allCities',
        type: 'GET',
        success: function (data) {
            if (data.success == "true") {
                $.each(data.cities, function (i, item) {
                    var cityList = document.getElementById('cityList');

                    var city = document.createElement('li');
                    city.appendChild(document.createTextNode(item));
                    city.onclick = function () {
                        getDistricts(item);
                    };

                    cityList.appendChild(city);

                    if (i == 0) {
                        getDistricts(item);
                    }
                    // cityList
                });

            } else {
                fail_alert('获取信息失败...');
            }
        },
        error: function (data) {
            fail_alert('获取信息失败...');
        }
    });
}

function getDistricts(city) {
    // alert('as');
    delAllChildren('blockList');
    selectChild('cityList', city);
    $.ajax({
        url: '/schoolAction/getDistricts',
        type: 'POST',
        data: {
            'city': city
        },
        dataType: 'json',
        asy: false,
        success: function (data) {
            if (data.success == "true") {
                $.each(data.districts, function (i, item) {
                    var blockList = document.getElementById('blockList');

                    var block = document.createElement('li');
                    block.appendChild(document.createTextNode(item));
                    block.onclick = function () {
                        getSchools(city, item);
                    };

                    blockList.appendChild(block);
                    if (i == 0) {
                        getSchools(city, item);
                    }
                    // cityList
                });
            } else {
                fail_alert('获取信息失败...');
            }
        },
        error: function (data) {
            fail_alert('获取信息失败...');
        }
    });
}

function getSchools(city, district) {
    delAllChildren('schoolList');
    $.ajax({
        url: '/schoolAction/getSchools',
        type: 'POST',
        data: {
            'city': city,
            'district': district
        },
        dataType: 'json',
        asy: false,
        success: function (data) {
            if (data.success == "true") {
                $.each(data.schools, function (i, item) {
                    var schoolList = document.getElementById('schoolList');

                    var school = document.createElement('li');
                    school.appendChild(document.createTextNode(item));
                    school.onclick = function () {
                        schoolName = item;
                        selectChild(city, district, item);
                    };

                    schoolList.appendChild(school);
                    // cityList
                    if (i == 0) {
                        schoolName = item;
                        selectChild(city, district, item);
                    }
                });
            } else {
                fail_alert('获取信息失败...');
            }
        },
        error: function (data) {
            fail_alert('获取信息失败...');
        }
    });
}

function delAllChildren(id) {
    var menu = document.getElementById(id);
    var num = menu.childNodes.length;
    for (num - 1; num >= 0; num--) {
        if (menu.childNodes.item(num) != null)
        // alert(case_list.childNodes.item(num));
            menu.removeChild(menu.childNodes.item(num));
    }
}

function selectChild(city, district, school) {
    changeColor('cityList', city);
    changeColor('blockList', district);
    changeColor('schoolList', school);
}

function changeColor(id, content){
    var cities = document.getElementById(id).getElementsByTagName('li');
    // var num = menu.childNodes.length;
    for (var i = 0; i < cities.length; i++) {
        cities[i].className = '';
        if (cities[i].innerHTML == content)
            cities[i].className = 'selectLi';

    }
}