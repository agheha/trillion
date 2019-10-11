// 0번째모달
function mopen() {
  document.querySelector("#modal").classList.add("show");
}
function mclose() {
let close =  document.querySelector("#modal");

  close.classList.remove("show");
  close.classList.add("hide");
  setTimeout(function () {
    close.classList.remove('hide');
}, 500);
}

