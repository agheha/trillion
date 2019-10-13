// 현재 로그인 한 유저 이메일 정보 넘어오는지 테스트
alert(user.value);
// 댓글 작성한 유저의 이메일 정보가 넘어오는지 테스트
alert(writer.value);
// 두개 넘어오면 이걸로 여기서 확인해서 댓글을 뿌려줄때 수정, 삭제버튼 생기도록 기능 추가해야됨.

// 댓글 목록 가져오는 Ajax
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	}
	xhr.open("GET", "commentList.do?num="+num, true);
	xhr.send();
}
commentListAjax();

// 댓글 뿌려주는 html 영역
function makeCommentList(list) {
	let commentList = document.getElementById("commentList");
	let html = "<div>";
	for (let i = 0; i < list.length; i++) {
		let comment = list[i];
		
		if (`${comment.commentGroup}` == 1) {
			html += `
			<div>
				<div>
					<span>${comment.email}</span>
					<span>${comment.regDate}</span>
					댓글 번호 : ${comment.num}
					<div>
						<button type="button">수정</button>				
						<button type="button" onclick="commentDeleteAjax(${comment.num}, ${comment.commentGroupCode})">삭제</button>
						<button type="button">답글</button>
					</div>
				</div>
				<div>
					${comment.content}
				</div>
			</div>
			`;
			continue;
		} else {
			html += `
			<div>
				<div>
					<span>${comment.email}</span>
					<span>${comment.regDate}</span>		
					<div>
						<button type="button">답글</button>
					</div>
				</div>
				<div>
					${comment.content}
				</div>
			</div>
			`;
		}
			
	}

	html += "</div>";
	commentList.innerHTML = html;
}


// 댓글 삭제
function commentDeleteAjax(commentNum, commentGroupCode) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	}
	xhr.open("GET", `commentDelete.do?num=${commentNum}&commentGroupCode=${commentGroupCode}`, true);
	xhr.send();
}


// 댓글 등록
function commentRegistAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = (e) => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	}
	xhr.open("POST", "commentWrite.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	let f = document.crForm;
	xhr.send(`num=${num}&email=${f.email.value}&content=${f.content.value}`);
	
	f.email.value="";
	f.content.value="";
	
	return false;
}
