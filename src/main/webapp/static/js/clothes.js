/**
 * Created by island on 2017/7/23.
 */
function getAllSchool(id){
    jQuery.ajax( {
        type : 'GET',
        contentType : 'application/json',
        url : '/schoolAction/allSchool',
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption(id, "null", "");
                $.each(data.schools, function(i, item) {
                    addOption(id, item, item);
                });
            }
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function getAllTypesOfSchool(id, school){
    clearSelectList(id);
    jQuery.ajax( {
        type : 'POST',
        url : '/clothesAction/allTypesOfSchool',
        data:{
          "school": school
        },
        dataType : 'json',
        success : function(data) {
            // alert("success");
            if (data && data.success == "true") {
                addOption(id, "null", "");
                $.each(data.type, function(i, item) {
                    addOption(id, item, item);
                    // fail_alert(i);
                });
            }
        },
        error : function() {
            fail_alert("哎呀呀，初始化信息失败...")
        }
    });
}

function clearSelectList(id) {
    var case_list = document.getElementById(id);
    var num = case_list.childNodes.length;
    for (num - 1; num >= 0; num--) {
        if (case_list.childNodes.item(num) != null)
        // alert(case_list.childNodes.item(num));
            case_list.removeChild(case_list.childNodes.item(num));
    }
}

function addOption(id, value, text) {
    var drop = document.getElementById(id);
    // alert(drop.options.length);
    var op = document.createElement("option");      // 新建OPTION (op)
    drop.options.add(op);
    op.setAttribute("value", value);          // 设置OPTION的 VALUE
    op.appendChild(document.createTextNode(text)); // 设置OPTION的 TEXT
    op.text = text;
}

function changeSchool(id, school_id){
    s = '#' + school_id + ' option:selected';
    var school = $(s).text();
    // alert(id);
    // alert(school);
    getAllTypesOfSchool(id, school);
}