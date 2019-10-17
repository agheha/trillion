let pttable = document.querySelector("#pttable");
const ptButton = document.getElementById("participant"); 
const ptHeightAuto = document.querySelector(".partlistModal"); 
const ptOverlay = document.querySelector(".partlist_sub"); 
const ptOpenModal = () => { 
	loadPartList()
	ptHeightAuto.classList.remove("hidden");
} 
const ptCloseModal = () => { 
	ptHeightAuto.classList.add("hidden"); 
} 
ptOverlay.addEventListener("click", ptCloseModal); 
ptButton.addEventListener("click", ptOpenModal); 

function loadPartList() {
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
							<th>신청일</th>
							<th>진행상태</th>
							<th>철회</th>
						</tr>`
				if(list.length === 0){
					html +=
					`						
					<tr>
						<td colspan="5" style="text-align: center">신청한 스터디가 존재하지 않습니다</td>
					</tr>
					`
				} else{
					list.forEach(parlist => {
						html += `
								<tr>
									<td>${parlist.name}</td>
									<td>${parlist.email}</td>
									<td>${parlist.partDate}</td>
									<td>신청중</td>
									<td>
										<button name="parcancell" type="button" value="${parlist.num}">철회</button>
									</td>
								</tr>`
					})
				}
				pttable.innerHTML = html;
				btnAction(2)
			}
		}
	}
	xhr.open("GET",  `/momstudy/user/delparticipantform.do`)
	xhr.send();
}