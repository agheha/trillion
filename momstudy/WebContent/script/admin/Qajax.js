function Qajax(num) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let list = JSON.parse(xhr.responseText);
				
				make1(list);
			}
		}
	}
	xhr.open("GET", "adminoneinquiry.do?num=" +num, true);
	xhr.send();
}

function make1(list) {

	let Qemail2 = document.querySelector(".Qemail2"); // 상세 문의 아이디 (작성자) 
	let Qtitle2 = document.getElementById("Qtitle2"); //상세 문의 제목
	let Qtext = document.getElementById("Qtext"); //상세 문의 내용
	let comment = document.getElementById("comment"); // 테이블 답변한 관리자 아이디 띄워주는것
	let commentGroupCode = document.getElementById("commentGroupCode"); // 테이블 답변한 관리자 아이디 띄워주는것
	
	let Quest = list.Quest;
	let clist =list.clist;
	
	
	
	let html ="";
		for(let i = 0; i< list.length;i++) {
			
		html +=	`
		<tr>
			<td>${clist.email} 님이 답변함</td>
		</tr>
		`
		}
	
		
	console.log(html);
	
	Qemail2.innerHTML = `${Quest.email}`;
	Qtitle2.innerHTML = `${Quest.title}`;
	Qtext.innerHTML = `${Quest.content}`;
	commentGroupCode.value = `${Quest.commentGroupCode}`;
	comment.innerHTML = html;
	
}