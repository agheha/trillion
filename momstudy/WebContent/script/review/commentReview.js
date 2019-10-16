let addbtn = document.querySelector("#addbtn");
addbtn.addEventListener("click",commentRegistAjax);

commentListAjax();

function createUpdateBtn() {
	let cmtBtn = document.querySelectorAll(".cmtBtn");
	let cmtUpBtn = document.querySelectorAll(".cmtUpBtn");
	let commentWrapUp = document.querySelectorAll(".commentWrapUp");
	let textAreaWrap = document.querySelectorAll(".textAreaWrap");
	let commentList = document.getElementById("commentList");

	for (let i = 0; i < cmtUpBtn.length; i++) {
		
		// 수정버튼 클릭시 Textarea 수정할 수 있는 창이 생기는 버튼
		cmtUpBtn[i].addEventListener("click", (e) => {
			if (commentWrapUp[i].style.display == "none") {
				commentWrapUp[i].style.display = "block";
				textAreaWrap[i].style.display = "none";
				return
			}
			commentWrapUp[i].style.display = "none";
			textAreaWrap[i].style.display = "block";
		})
		
		cmtBtn[i].addEventListener("click", (e) => {
			commentUpdateAjax(i);
		})
	}
}

// 댓글 목록 가져오는 Ajax
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
				createUpdateBtn();
			}
		}
	}
	xhr.open("GET", "commentList.do?num="+num, true);
	xhr.send();
}


// 댓글 뿌려주는 html 영역
function makeCommentList(list) {
	let user = document.getElementById("user");
	let commentList = document.getElementById("commentList");
	let html = "<div>";
	for (let i = 0; i < list.length; i++) {
		let comment = list[i];
		if (`${comment.email}` == email) {
			html += `
			<div>
				<div class="commentInfo">
					<span>작성자 : ${comment.email}</span>
					<span>작성일 : ${comment.regDate}</span>
					<div>
						<button type="button" class="cmtUpBtn"">수정</button>				
						<button type="button" onclick="commentDeleteAjax(${comment.num}, ${comment.commentGroupCode})">삭제</button>
					</div>
				</div>
				
				<div class="commentWrapUp">
					${comment.content}
				</div>
				
				<div class="textAreaWrap">
				
					<form name="cmtForm">
						<textarea class="cmtContent" num="${comment.num}">${comment.content}</textarea>
						<button class="cmtBtn" value="${comment.num},${comment.commentGroupCode}" type="button">등록</button>
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
				createUpdateBtn();
			}
		}
	}
	xhr.open("POST", "commentWrite.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	let f = document.crForm;
	xhr.send(`num=${num}&email=${f.email.value}&content=${f.content.value}`);
	
	f.email.value="";
	f.content.value="";
}

//댓글 수정
function commentUpdateAjax(i) {
	let cmtBtn = document.querySelectorAll(".cmtBtn");
	let values = document.querySelectorAll(".cmtContent");
	let commentNum = cmtBtn[i].value.slice(0, cmtBtn[i].value.indexOf(","));
	let commentGroupCode = cmtBtn[i].value.slice(cmtBtn[i].value.indexOf(",")+1);
	
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
	xhr.send(`commentNum=${commentNum}&commentGroupCode=${commentGroupCode}&content=${values[i].value}`);
}
