let select;	
let cancells = document.querySelectorAll("button[name='cancell']");
cancells.forEach((ele) => {
	ele.addEventListener("click", e => {
		select = e.target.value
		modal.style.display="block";
	})
})
function agree() {
	let divEle =  document.querySelector("#content");
	divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				setTimeout(() => {
					modal.style.display="none"
					divEle.innerHTML =`
					<div id="que">스터디를 탈퇴하시겠습니까?</div>
						<br/>
						<button type="button" id="signup" onclick="agree()">확인</button>
						<button class="closer" onclick="return clean()">취소</button>`
				}, 2000);
			} 
		}
	}
	xhr.open("GET", "/momstudy/user/studydelete.do?cancell="+select)
	xhr.send();
}