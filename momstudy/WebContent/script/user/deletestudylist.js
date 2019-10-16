let userinfo = document.querySelector("#userinfo");
	userinfo.addEventListener("click", e =>{
		location.href ="/momstudy/user/userinfo.do"
	})
const openButton = document.getElementById("myparticipant"); 
const heightAuto = document.querySelector(".heightAuto"); 
const overlay = document.querySelector(".right_top_cont"); 
const openModal = () => { 
	loadPart();
	heightAuto.classList.remove("hidden");
} 
const closeModal = () => { 
	heightAuto.classList.add("hidden"); 
} 
overlay.addEventListener("click", closeModal); 
openButton.addEventListener("click", openModal); 


function loadPart() {
	let partlist = document.querySelector(".rwd-table");
	let xhr = new XMLHttpRequest()
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4){
			if (xhr.status === 200) {
				let list = JSON.parse(xhr.responseText);
				let html = 
					`
						<tr>
							<th>스터디</th>
							<th>스터디장</th>
							<th>개설일</th>
							<th>상태</th>
							<th>탈퇴</th>
						</tr>`
				if(list.length === 0){
					html +=
					`						
					<tr>
						<td colspan="5" style="text-align: center">등록된 스터디가 존재하지 않습니다</td>
					</tr>`
				} else{
					list.forEach(parlist => {
						html += `
								<tr>
									<td>${parlist.name}</td>
									<td>${parlist.email}</td>
									<td></td>
									<td>가입중</td>
									<td>
										<button name="cancell" type="button" value="${parlist.num}">탈퇴</button>
									</td>
								</tr>`
					})
				}
				partlist.innerHTML = html;

			}
		}
	}
	xhr.open("GET",  `/momstudy/user/studydeleteform.do`)
	xhr.send();
}