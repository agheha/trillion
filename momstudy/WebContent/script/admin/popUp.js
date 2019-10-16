// 0번째모달
function mopen() {
//	alert("팝업실행");
  document.querySelector("#prpop").classList.add("prshow");
}
function mclose() {
let close =  document.querySelector("#prpop");

  close.classList.remove("prshow");
  close.classList.add("prhide");
  setTimeout(function () {
    close.classList.remove('prhide');
}, 10);
}

