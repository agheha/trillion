let modal = document.getElementById('myModal');
let passBtn = document.getElementById("passUpdate");
let span = document.getElementsByClassName("close")[0];                                          

passBtn.onclick = function() {modal.style.display = "block";}
span.onclick = function() {modal.style.display = "none";}
window.onclick = function(e) {
    if (e.target == modal) {modal.style.display = "none";}
} // 모달창 구현


// 모달창에서 클릭시 넘어오는 페이지
let pass = document.querySelector("#passchk")

let btn = document.querySelector("#btn")	
btn.addEventListener("click", e => {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status == 200) {
				if (parseInt(xhr.responseText) === 1) {
					location.href = "/momstudy/jsp/user/updatepass.jsp"
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			} 
		}
	}
	xhr.open("POST", "/momstudy/user/passchk.do", true)
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("pass="+pass.value);
})
