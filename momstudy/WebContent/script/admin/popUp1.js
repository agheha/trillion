// 1번쨰 모달
function mopen1() {
//	alert("팝업실행");
  document.querySelector("#prpop1").classList.add("prshow1");
}
function mclose1() {
let close =  document.querySelector("#prpop1");

  close.classList.remove("prshow1");
  close.classList.add("prhide1");
  setTimeout(function () {
    close.classList.remove('prhide1');
}, 10);
}

