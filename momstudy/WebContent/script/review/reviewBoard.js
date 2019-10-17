// 모달창
let modal = document.getElementById("onModal");
let cont = document.getElementById("content");
let closeBtn = document.getElementById("close");
let check = document.querySelectorAll(".checkbox");

// 버튼 클릭 시 모달창 생성
modal.addEventListener("click", (e) => {
    cont.style.display = "block";
})
// x 버튼 클릭 시 모달창 사라짐
closeBtn.addEventListener("click", (e) => {
    cont.style.display = "none";
})


// checkbox 1개만 선택되도록 설정
for (let i = 0; i < check.length; i++) {
    check[i].addEventListener("click", (e) => {
        for(let j = 0; j < check.length; j++) {
            check[j].checked = false;
        }
        check[i].checked = true;
    })
}

function dataChk() {
	let title = document.getElementById("title");
	let cont = document.getElementById("content");
	if(isEmpty(title, "제목을 입력해 주세요.")) return false;
	if(isEmpty(cont, "내용을 입력해 주세요.")) return false;
}
function studyChk() {
	let cnt = 0;
	let checkbox = document.querySelectorAll(".checkbox");
	for (let i = 0; i < checkbox.length; i++) {
		if(checkbox[i].checked == true) {cnt++};
	}
	if (cnt == 0) {
		alert("스터디를 선택해 주세요");
		return false;
	}
}
function isEmpty(ele, msg) {
    if (ele.value == "") {
        alert(msg);
        ele.focus();
        return true; 
    }
    return false;
}
