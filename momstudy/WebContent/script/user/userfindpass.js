let passMsg = document.querySelector("#passmsg")
function findpass() {
	let xhr = new XMLHttpRequest();
	let pname = document.querySelector("#pname").value
	let pemail = document.querySelector("#pemail").value
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let senddata = JSON.parse(xhr.responseText);
				if (senddata === null) {
					passMsg.innerHTML = "입력정보를 찾을수 없습니다."
					passMsg.style.color="red"
				} else {
					passMsg.innerHTML = 
						`인증메일 전송이 완료되었습니다<br>인증시 입력한 이메일을 확인해주세요.`
					passMsg.style.color="red"
				}
			}
		}
	}
	xhr.open("GET",`findpass.do?name=${pname}&email=${pemail}`);
	xhr.send();
}
document.querySelector("#pbtn").addEventListener("click", findpass)
document.querySelector("#pbtn").addEventListener("blur", e =>{
	passMsg.innerHTML = "본인인증시 사용하였던 <br> 휴대전화번호와 이름을 입력해주세요."
	passMsg.style.color="#888"
	let pname = document.querySelector("#pname").value =""
	let pemail = document.querySelector("#pemail").value =""
})
