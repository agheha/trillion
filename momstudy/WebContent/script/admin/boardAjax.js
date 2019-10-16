function boardAjax(num) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let board = JSON.parse(xhr.responseText);
 console.log(board)
				make(board);
			}
		}
	}
	xhr.open("GET", "reportoneboard.do?num=" +num, true);
	xhr.send();
}

function make(board) {

	let btitle = document.getElementById("board_title");
	let btype = document.getElementById("board_type");
	let bemail = document.getElementById("re_email");
	let con1 = document.getElementById("con1");
	let bcontent = document.getElementById("b_content");
	
	btitle.innerHTML = `${board.boardTitle}`
		
	if(board.boardType == 'free' && board.studyNum == 0) {
		btype.innerHTML = ` 자유게시판`;
	}
	else if(board.boardType == 'free' && board.studyNum != 0) {
		btype.innerHTML = ` 스터디게시판`;
	}
	else if(board.boardType == 'recruit' ) {
		btype.innerHTML = ` 스터디 모집게시판`;
	}
	else if(board.boardType == 'review' ) {
		btype.innerHTML = ` 스터디 리뷰게시판`;
	}
	bemail.innerHTML = `
		<div>신고자</div>
		<div id="board_email" onclick="mopen1(),userDtailAjax('${board.email}')"> ${board.email}</div>
	 `;
	con1.innerHTML = `  ${board.reseaon}`;
	bcontent.innerHTML = `내용<br/>${board.content}`;
	
	
	btitle.addEventListener('click',(e) => {
        
		if(board.boardType == 'free' && board.studyNum == 0) {
			
			location.href = `/momstudy/boardfree/freedetail.do?no=${board.boardNum}`
				return;
		}else if(board.boardType == 'free' && board.studyNum != 0) {
		
			location.href = `/momstudy/board/detail.do?no=${board.boardNum}`
				return;
		}
		else if(board.boardType == 'recruit' ) {
			
			location.href = `/momstudy/study/studyrecruitmentdetail.do?num=${board.boardNum}`
				return;
		}
		else if(board.boardType == 'review' ) {
			
			location.href = `/momstudy/review/detail.do?num=${board.boardNum}`
				return;
		}
		

      })  

}

