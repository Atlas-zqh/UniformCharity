// $(document).ready(function () {
//     checkCookie();
//
//     getAllSchool('schoolDrop');
// });

function getGradeAndClass(){
    var gradeNum = $('#gradeDrop option:selected').val();
    var classNum = $('#classDrop option:selected').val();
    $('#my-popup').modal('close');
    $('#GradeAndClass').text(gradeNum + '年级' + classNum + '班');
}