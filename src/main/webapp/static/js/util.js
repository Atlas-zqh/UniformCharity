/**
 * Created by island on 2017/7/24.
 */
function getArgsFromHref(sHref, sArgName)
{
    var args    = sHref.split("?");
    var retval = "";

    if(args[0] == sHref) /*参数为空*/
    {
        return retval; /*无需做任何处理*/
    }
    var str = args[1];
    args = str.split("&");
    for(var i = 0; i < args.length; i ++)
    {
        str = args[i];
        var arg = str.split("=");
        if(arg.length <= 1) continue;
        if(arg[0] == sArgName) retval = arg[1];
    }
    return retval;
}

function setSelected(id, value) {
    var all_options = document.getElementById(id).options;
    var i = 0;
    for (i = 0; i < all_options.length; i++) {
        if(all_options[i].selected == true){
            all_options[i].selected = false;
        }
        if (all_options[i].text == value)  // 根据option标签的ID来进行判断  测试的代码这里是两个等号
        {
            all_options[i].selected = true;
            all_options[i].text = value;
            return;
        }
    }
}

function delAllChile(id) {
    var menu = document.getElementById(id);
    var num = menu.childNodes.length;
    for (num - 1; num >= 0; num--) {
        if (menu.childNodes.item(num) != null)
        // alert(case_list.childNodes.item(num));
            menu.removeChild(menu.childNodes.item(num));
    }
}