/**
 * Created by island on 2017/7/25.
 */
function initMenu(maxPage, id, page){
    page = parseInt(page);
    clearMenu(id);
    var firstItem = addMenuItem(id, 'First');
    firstItem.onclick = function () {
        first();
    };
    var previousItem = addMenuItem(id, 'Previous');
    previousItem.onclick = function () {
        previous();
    };
    if(page < 4) {
        if (maxPage > 5) {
            var menu = document.getElementById(id);
            var i = 0;
            for (i = 1; i <= 5; i++) {
                var item = addMenuItem(id, i);
                if (i == page) {
                    item.className = "click";
                }
            }
        } else {
            for (i = 1; i <= maxPage; i++) {
                item = addMenuItem(id, i);
                if (i == page) {
                    item.className = "click";
                }
            }
        }
    }else{
        if(page + 2 <= maxPage) {
            for (i = page - 2; i <= page + 2; i++){
                item = addMenuItem(id, i);
                if (i == page) {
                    item.className = "click";
                }
            }
        }else{
            for(i = page - (4 - maxPage + page); i <= maxPage; i++){
                item = addMenuItem(id, i);
                if (i == page) {
                    item.className = "click";
                }
            }
        }
    }
    var nextItem = addMenuItem(id, 'Next');
    nextItem.onclick = function () {
        next();
    };
    var lastItem = addMenuItem(id, 'Last');
    lastItem.onclick = function () {
        last()
    };
}

function clearMenu(id){
    var menu = document.getElementById(id);
    var num = menu.childNodes.length;
    for (num - 1; num >= 0; num--) {
        if (menu.childNodes.item(num) != null)
        // alert(case_list.childNodes.item(num));
            menu.removeChild(menu.childNodes.item(num));
    }
}

function addMenuItem(id, item) {
    var menu = document.getElementById(id);

    var first_item = document.createElement("li");
    var first_a = document.createElement("a");

    first_a.appendChild(document.createTextNode(item));
    first_item.appendChild(first_a);
    menu.appendChild(first_item);
    return first_a;
}
