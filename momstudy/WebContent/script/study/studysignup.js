
var modal = document.getElementById("myModal");

var btn = document.getElementById("myBtn");

var span = document.getElementsByClassName("closer")[0];     

btn.onclick = () => {
    modal.style.display = "block";
}
span.onclick = () => {
    modal.style.display = "none";
}
// 모달창 바깥을 클릭했을 때
window.onclick = (e) => {
    if (e.target == modal) {
        modal.style.display = "none";
    }
}
// 신청하기 버튼 눌렀을때 #myModal 띄우기
btn.addEventListener("click", (e) => {
	modal.classList.toggle('hidden');
});