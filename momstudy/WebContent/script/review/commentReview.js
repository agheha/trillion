// 댓글 목록 가져오는 Ajax
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
				
				let cmtUpBtn = document.querySelectorAll(".cmtUpBtn");
				
				for (let i = 0; i < cmtUpBtn.length; i++) {
					cmtUpBtn[i].addEventListener("click", (e) => {
						let commentWrap = document.querySelectorAll(".commentWrap");
						let textAreaWrap = document.querySelectorAll(".textAreaWrap");
						
						if (commentWrap[i].style.display == "block") {
							commentWrap[i].style.display = "none";
							textAreaWrap[i].style.display = "block";
							
						} else {
							
							commentWrap[i].style.display = "block";
							textAreaWrap[i].style.display = "none";
						}
						
					})
				}

			}
		}
	}
	xhr.open("GET", "commentList.do?num="+num, true);
	xhr.send();
}
commentListAjax();

// 댓글 뿌려주는 html 영역
function makeCommentList(list) {
	let user = document.getElementById("user");
	let commentList = document.getElementById("commentList");
	let html = "<div>";
	let cnt = 0;
	for (let i = 0; i < list.length; i++) {
		let comment = list[i];
		
		if (`${comment.email}` == user.value) {
			html += `
			<div>
				<div class="commentInfo">
					<span>작성자 : ${comment.email}</span>
					<span>작성일 : ${comment.regDate}</span>
					댓글 번호 : ${comment.num}
					<div>
						<button type="button" class="cmtUpBtn" index="${cnt++}">수정</button>				
						<button type="button" onclick="commentDeleteAjax(${comment.num}, ${comment.commentGroupCode})">삭제</button>
					</div>
				</div>
				<div class="commentWrap" id="commentWrap${cnt}">
					${comment.content}
				</div>
				<div class="textAreaWrap" id="textAreaWrap${cnt}">
					
					<form name="cmtForm" method="post" action="commentUpdate.do" >
						<textarea class="cmtContent" index="${cnt}">${comment.content}</textarea>
						<button class="cmtBtn" type="button" onclick="commentUpdateAjax(${comment.num}, ${comment.commentGroupCode})">등록</button>
					</form>
					
				</div>
			</div>
			`;
			continue;
		} else {
			html += `
			<div>
				<div class="commentInfo">
					<span>작성자 : ${comment.email}</span>
					<span>작성일 : ${comment.regDate}</span>		
				</div>
				<div class = "commentWrap">
					${comment.content}
				</div>
			</div>
			`;
		}
			
	}

	html += "</div>";
	commentList.innerHTML = html;
}

//댓글 수정
function commentUpdateAjax(commentNum, commentGroupCode) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = (e) => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	}
	xhr.open("POST", "commentUpdate.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	let values = document.querySelectorAll(".cmtContent");
	let cmtBtn = document.querySelectorAll(".cmtBtn");

	for (let i = 0; i < values.length; i++) {
		cmtBtn[i].addEventListener("click", (e) => {
			xhr.send(`commentNum=${commentNum}&commentGroupCode=${commentGroupCode}&content=${values[i].value}`);
		})
	}
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
