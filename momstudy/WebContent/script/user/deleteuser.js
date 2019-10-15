
let chkbtn = document.querySelector("#chkbtn")
let msg = document.querySelector("#msg")
chkbtn.addEventListener("click", e => {
	let pass = document.querySelector("#pass")
	let xhr = new XMLHttpRequest();
	let msg = document.querySelector("#msg")
	msg.style.display = "none";
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status == 200) {
				if (parseInt(xhr.responseText) === 1) {
					modal.style.display="block";
				} else {
					msg.style.display = "block";
				}
			} 
		}
	}
	xhr.open("POST", "/momstudy/user/passchk.do")
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("pass="+pass.value);
})
function agree() {
	let divEle =  document.querySelector("#content");
	divEle.innerHTML = "<div id='que'>맘스터디 탈퇴가 완료되었습니다</div>"
	+ "<br><div id='comp'>이용해 주셔서 감사합니다<div>"
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				setTimeout(() => {
					location.href="/momstudy/main.do"
				}, 2000);
			} 
		}
	}
	xhr.open("GET", "/momstudy/user/deleteuser.do")
	xhr.send();
}