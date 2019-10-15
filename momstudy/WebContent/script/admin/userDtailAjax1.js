function userDtailAjax1(email) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let list = JSON.parse(xhr.responseText);
				console.log(list)
				make1(list);
			}
		}
	}
	xhr.open("GET", "userdtail.do?email=" +email, true);
	xhr.send();
}

function make1(list) {

	let popUp = document.getElementById("modal_content");

	let info = list.user;
	let openStudy =list.openStudy;
	let joinStudy =list.joinStudy;
	
	let html = 
		`
	  <div class="b1_main">

        <div id="b1_Profile" ></div>
        <div id="b1_Info">
            <div>ID : ${info.email} (<fmt:formatDate pattern="yyyy-MM-dd"
							value="${info.banDate}" />)까지</div>
            <div>이름 : ${info.name}</div>
            <div>생일 : <fmt:formatDate pattern="yyyy-MM-dd"
							value="${info.birth}" /></div>
            <div>성별 : ${info.gender}</div>
            <div>연락처 : ${info.phoneNum}</div>
            <div>개설 스터디 수 : ${info.openCnt}</div>
            <div>가입 스터디 수: ${info.joinCnt}</div>
            <div>신고된 횟수 : ${info.rpcount}</div>
        </div>
        <br>
        <div id="b1_Function">회원정지
            <div>
                   <div>
                    <form action="ban.do">
                     <input type="number" name="banDate" min="1" max="30" step="1">
                     <input type="hidden" name="email" value="${info.email}">
					 <input type="hidden" name="status" value="2">
                            <button>정지</button>
                    </form>
                </div>
				<div>
					<form action="banrelease.do">
					<input type="hidden" name="email" value="${info.email}">
							<button>정지해제</button>
					</form>
				</div>

                <div>
                    <button onclick="location.href='/momstudy/admin/admindeleteuser.do?email=${info.email}'">회원탈퇴</button>
                </div>

            </div>

        </div>
        
         <div id="b1_t1">개설</div>

        <table id="b1_table1">
            <thead>
                <th>스터디 분야</th>
                <th>스터디 명</th>
                <th>주소</th>
                <th>종료 날짜</th>
                <th>팀원 수</th>
            </thead>
            <tbody>
`;
	for (let i = 0; i < openStudy.length; i++) {
		let Study = openStudy[i];
	
	html +=`
		<tr>
         <td>${Study.categoryName}</td>
		<td>${Study.name}</td>
		<td>${Study.addressDetail} ${Study.addressDetail2}</td>
         <td>${Study.regDate}</td>
		<td>${Study.member}</td>
        </tr>
	`;
	}
	
	html +=` 
	 </tbody>
        </table>

        <div id="b1_t2">가입</div>

        <table id="b1_table2">
            <thead>
                <th>스터디 분야</th>
                <th>스터디 명</th>
                <th>방장 아이디</th>
                <th>종료 날짜</th>
                <th>팀원 수</th>
            </thead>
            <tbody>
	`;
	for (let i = 0; i < list.length; i++) {
		let Study = joinStudy[i];
		
		html +=`
			<tr>
			<td>${Study.categoryName}</td>
			<td>${Study.name}</td>
			<td>${Study.email}</td>
			<td>${Study.regDate}</td>
			<td>${Study.member}</td>
			</tr>
			`;
	}
	html +=`
	    </tbody>
        </table>
		</div>
		 <div id="modarlayer" onclick="mclose()"></div>
	`;

	console.log(html);
	popUp.innerHTML = html;

}