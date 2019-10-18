let select;	
function btnAction(num) {
	if (num === 1) {
		let cancells = document.querySelectorAll("button[name='cancell']");
		cancells.forEach((ele) => {
			ele.addEventListener("click", e => {
				select = e.target.value
				msgmodal.style.display="block";
			})
		})
	} else {
		let parcancell = document.querySelectorAll("button[name='parcancell']");
		parcancell.forEach((ele) => {
			ele.addEventListener("click", e => {
				select = e.target.value
				msgmodal.style.display="block";
			})
		})
			
	}
}
function deleteCode(num) {
	return html = `
		<div id="que">스터디를 탈퇴하시겠습니까</div>
		<div>
			<button type="button" id="signup" onclick="reragree(${num})">확인</button>
			<button name="detbe" class="closer" id="closecell">취소</button>
		</div>	
			`
}


function agree(num) {
	if (num === 1) {
		let divEle =  document.querySelector("#myBtn");
		divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
			let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = e => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					setTimeout(() => {
						msgmodal.style.display = "none"; 
						divEle.innerHTML = deleteCode(num);
						loadPart();
					}, 1500);
				} 
			}
		}
		xhr.open("GET", "/momstudy/user/studydelete.do?cancell="+select)
		xhr.send();
	} else {
		let divEle =  document.querySelector("#myBtn");
		divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
			let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = e => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					setTimeout(() => {
						msgmodal.style.display = "none"; 
						divEle.innerHTML = deleteCode(num);
						loadPartList();
					}, 1500);
				} 
			}
		}
		xhr.open("GET", "/momstudy/user/delparticipant.do?parcancell="+select)
		xhr.send();		
	}
}
