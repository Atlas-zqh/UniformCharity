/**
 * Created by island on 2017/8/21.
 */
function selectAddSchool(){
    if($('#loginView').css("display") == 'block'){
        fail_alert("请先登陆后再进行后续操作！")
    }else {
        initButtons();
        $('#addSchool').css('color', '#142535');
    }
}

function selectSearchSchool() {
    if($('#loginView').css("display") == 'block'){
        fail_alert("请先登陆后再进行后续操作！")
    }else {
        initButtons();
        $('#searchSchool').css('color', '#142535');
    }
}

function selectPostArticle() {
    if($('#loginView').css("display") == 'block'){
        fail_alert("请先登陆后再进行后续操作！")
    }else {
        initButtons();
        $('#postArticle').css('color', '#142535');
    }
}

function initButtons() {
    $('#addSchool').css('color', 'white');
    $('#searchSchool').css('color', 'white');
    $('#postArticle').css('color', 'white');
}