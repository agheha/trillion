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