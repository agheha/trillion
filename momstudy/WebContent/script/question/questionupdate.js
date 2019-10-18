function resize(obj) {
	obj.style.height="1px";
	obj.style.height = (12+obj.scrollHeight) + "px";
}
let upque = document.querySelector("#updatequestion");
let agreebtn = document.querySelector("#agreebtn");
let upcontent = document.querySelector(".board_cont");
upque.addEventListener("click", () => {
	agreebtn.innerHTML = "<button type='button' id='agbtn'><a>확인</a></button>"
	upcontent.innerHTML = `<textarea onkeydown='resize(this)' onkeyup='resize(this)' id='uptext'>${content}</textarea>`
	let uptext = document.querySelector("#uptext")
	uptext.focus();
	uptext.classList.add("texta")
	eventAdd(); 	
})
function eventAdd(){
	let agbtn = document.querySelector("#agbtn");
	agbtn.addEventListener("click", () => {
		let uptext = document.querySelector("#uptext").value
		let xhr = new XMLHttpRequest()
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4){
				if (xhr.status === 200) {
					location.href = `/momstudy/question/questiondetail.do?num=${num}`
				}
			}
		}
		xhr.open("POST",  "/momstudy/question/questionupdate.do")
	 	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send(`num=${num}&content=${uptext}`);
	})
}
