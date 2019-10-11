function userDtailAjax(email) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let list = JSON.parse(xhr.responseText);
				
				make1(list);
			}
		}
	}
	xhr.open("GET", "userdtail.do?email=" +email, true);
	xhr.send();
}

function make1(list) {

	let popUp = document.getElementById("modal_content1");

	let info = list.user;
	let openStudy =list.openStudy;
	let joinStudy =list.joinStudy;
	
	let html = 
		`
	  <div class="b1_main">

        <div id="b1_Profile" ></div>
        <div id="b1_Info">
            <div>ID : ${info.email}(정지 30일)</div>
            <div>이름 : ${info.name}</div>
            <div>생일 : ${info.birth}</div>
            <div>성별 : ${info.gender}</div>
            <div>연락처 : ${info.phoneNum}</div>
            <div>개설 스터디 수 : ${info.openCnt}</div>
            <div>가입 스터디 수: ${info.joinCnt}</div>
            <div>신고된 횟수 : ${info.cnt}</div>
        </div>
        <br>
        <div id="b1_Function">회원정지
            <div>
                <div>
                    <form action="">
                        <select name="stop" id="stop1">
                            <option value="">정지기간</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="30">30</option>
                        </select>
                    </form>
                </div>

                <div>
                    <button>회원탈퇴</button>
                </div>

                <div>
                    <button>쪽지 보내기</button>
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
		<td>${Study.cnt}</td>
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
			<td>${Study.cnt}</td>
			</tr>
			`;
	}
	html +=`
	    </tbody>
        </table>
		</div>
		 <div id="modarlayer1" onclick="mclose(),mclose1()"></div>
	`;
		
	console.log(html);
	popUp.innerHTML = html;

}