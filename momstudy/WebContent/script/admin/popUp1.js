// 1번쨰 모달
function mopen1() {
  document.querySelector("#modal1").classList.add("show1");
}
function mclose1() {
let close =  document.querySelector("#modal1");

  close.classList.remove("show1");
  close.classList.add("hide1");
  setTimeout(function () {
    close.classList.remove('hide1');
}, 500);
}

