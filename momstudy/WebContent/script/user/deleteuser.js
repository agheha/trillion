
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
					location.href = "/momstudy/user/deleteuser.do"
				} else {
					msg.style.display = "block";
				}
			} 
		}
	}
	xhr.open("POST", "/momstudy/user/passchk.do", true)
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("pass="+pass.value);
})