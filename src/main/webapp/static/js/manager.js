/**
 * Created by island on 2017/8/21.
 */
function selectAddSchool(){
    if($('#loginView').css("display") == 'block'){
        fail_alert("请先登陆后再进行后续操作！")
    }else {
        initButtons();
        $('#addSchool').css('color', '#142535');
        $('#addSchoolView').fadeIn();
        scrollToMain();
    }
}

function selectSearchSchool() {
    if($('#loginView').css("display") == 'block'){
        fail_alert("请先登陆后再进行后续操作！")
    }else {
        initButtons();
        $('#searchSchool').css('color', '#142535');
        $('#searchView').fadeIn();
        scrollToMain();
        //todo 初始化搜索框
    }
}

function selectPostArticle() {
    if($('#loginView').css("display") == 'block'){
        fail_alert("请先登陆后再进行后续操作！")
    }else {
        initButtons();
        $('#postArticle').css('color', '#142535');
        $('#postArticleView').fadeIn();
        scrollToMain();
    }
}

function scrollToMain() {
    $('html, body').animate({
        scrollTop: $("#bodyPart").offset().top
    }, 500);
}

function initButtons() {
    $('#addSchool').css('color', 'white');
    $('#searchSchool').css('color', 'white');
    $('#postArticle').css('color', 'white');
    $('#addSchoolView').css("display", "none");
    $('#searchView').css("display", "none");
    $('#postArticleView').css("display", "none");
}

function searchSchool(){
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