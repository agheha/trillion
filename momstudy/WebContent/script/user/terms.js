function chkCount() {
    let f = document.sForm
    let menu = f.menu;
    let menuCnt = 0;
    for (let i = 0; i< menu.length ; i++) {
        if (menu[i].checked ) menuCnt++
    }
    return menuCnt;
}
function doCheck() {
    let f = document.sForm
    let menu = f.menu;
    for (let i = 0; i< menu.length ; i++) {
        menu[i].checked = f.chkAll.checked;
    }
}
// 필수동의 
function doAction() {
    let f = document.sForm
    let menu = f.menu;
    // console.log(f.all.checked)
    // 하나일 경우와 여러개일 경우 코딩을 분리해야 한다.

    console.log(f.menu.length)
    // 여러개일 경우
    if (menu.length) {
        for (let i = 0; i< menu.length ; i++) {
            console.log(menu[i].checked)
        }
    } else {
        console.log(menu.checked)
    }
    console.log(chkCount())
    if (chkCount() != 3) {
        alert("필수 항목을 모두 체크해주세요!")
        return false;
    }
    return true
}