let email = document.getElementById("email");
email.addEventListener("blur", e => {
	let chkMsg = document.getElementById("chkmsg");
	let chkMsgok = document.getElementById("chkmsgok");
	chkMsgok.style.display="none"
	chkMsg.style.display="none"
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = e => {
		if(xhr.readyState === 4) {
			if (xhr.status === 200) {
				if (parseInt(xhr.responseText) === 0) {
				    if(e.target.value !== null) {
				    	chkMsgok.style.display="block"
				    }
				} else {
					chkMsgok.style.display="none"
					chkMsg.style.display="block"
				}
			}
		}
	}
	xhr.open("GET","emailcheck.do?email="+ email.value);
	xhr.send();
})

function dataChk() {
	let re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 	패스워드가 적합한지 검사할 정규식
	let re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	// 이메일이 적합한지 검사할 정규식

	let pw = document.getElementById("pw");
	let checkpw = document.getElementById("chkpw");
	let name = document.getElementById("name");
	let year = document.getElementById("year");
	let month = document.getElementById("month");
	let date = document.getElementById("date");
	let phnum = document.getElementById("phnum");
	let gender = document.getElementById("gender");
	// 이메일 중복체크 
	
	// ------------ 이메일 까지 -----------
	if (isEmpty(email,"이메일은 입력해주세요.")) return false;
	
	if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}
	if (isEmpty(pw,"비밀번호를 입력해주세요.")) return false;
	if (isEmpty(checkpw,"비밀번호를 입력해주세요.")) return false;
	if (isEmpty(name,"이름를 입력해주세요.")) return false;
	if (isEmpty(phnum,"핸드폰번호를 입력해주세요.")) return false;
	if (!check(re, pw, "비밀번호는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		return false;
	}
	if (join.pw.value != join.checkpw.value) {
		alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		join.checkpw.value = "";
		join.checkpw.focus();
		return false;
	}
	if (join.gender.value == "0") {
		alert("성별을 입력해주세요.")
		return false;
	}
	if (join.year.value == "2019" && join.year.value =="1" && join.year.value =="1") {
		alert("생년월일을 선택해 주세요.")
		return false;
	}
	
	// 관심분야 미입력시 얼터창 

	alert("회원가입이 완료되었습니다.");
}
function isEmpty(ele, msg) {
    if (ele.value == "") {
        alert(msg);
        ele.focus();
        return true; 
    }
    return false;
}

function check(re, what, message) {
	if (re.test(what.value)) {
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	// return false;
}
