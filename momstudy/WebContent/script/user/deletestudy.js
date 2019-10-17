let select;	
function btnAction(num) {
	if (num === 1) {
		let cancells = document.querySelectorAll("button[name='cancell']");
		cancells.forEach((ele) => {
			ele.addEventListener("click", e => {
				select = e.target.value
				deleteCode(num) 
				modal.style.display = "block";
			})
		})
	} else {
		let parcancell = document.querySelectorAll("button[name='parcancell']");
		parcancell.forEach((ele) => {
			ele.addEventListener("click", e => {
				select = e.target.value
				document.querySelector("#content").innerHTML = deleteCode(num)
				modal.style.display = "block";
			})
		})
			
	}
}
function deleteCode(num) {
	return html = 
		`<input type="hidden" name="stdnum" />
		<div id="que">스터디를 탈퇴하시겠습니까?</div>
		<br/>
		<button type="button" id="signup" onclick="agree(${num})">확인</button>
		<button class="closer">취소</button>`
}


function agree(num) {
	if (num === 1) {
		let divEle =  document.querySelector("#content");
		divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
			let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = e => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					setTimeout(() => {
						modal.style.display="none"
						divEle.innerHTML = deleteCode(num);
						loadPartList()
					}, 2000);
				} 
			}
		}
		xhr.open("GET", "/momstudy/user/studydelete.do?cancell="+select)
		xhr.send();
	} else {
		let divEle =  document.querySelector("#content");
		divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
			let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = e => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					setTimeout(() => {
						modal.style.display="none"
						divEle.innerHTML = deleteCode(num);
						loadPart()
					}, 2000);
				} 
			}
		}
		xhr.open("GET", "/momstudy/user/delparticipant.do?parcancell="+select)
		xhr.send();		
	}
}
