let emailMsg = document.querySelector("#emailmsg")
function findEmail() {
	let xhr = new XMLHttpRequest();
	let iname = document.querySelector("#iname").value
	let iphnum = document.querySelector("#iphnum").value
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let emaildata = JSON.parse(xhr.responseText);
				if (emaildata === null) {
					emailMsg.innerHTML = "입력정보를 찾을수 없습니다."
					emailMsg.style.color="red"
				} else {
					emailMsg.innerHTML = 
						`인증완료되었습니다.<br>아이디는 ${emaildata}입니다.`
					emailMsg.style.color="red"
				}
			}
		}
	}
	xhr.open("GET",`findemail.do?iname=${iname}&iphnum=${iphnum}`);
	xhr.send();
}
document.querySelector("#idbtn").addEventListener("click", findEmail)
document.querySelector("#idbtn").addEventListener("blur", e =>{
	emailMsg.innerHTML = "본인인증시 사용하였던 <br> 휴대전화번호와 이름을 입력해주세요."
	emailMsg.style.color="#888"
	let name = document.querySelector("#iname").value =""
	let phnum = document.querySelector("#iphnum").value =""
})
