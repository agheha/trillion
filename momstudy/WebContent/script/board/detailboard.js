let addbtn = document.querySelector("#addbtn");
addbtn.addEventListener("click",commentRegistAjax);


//댓글 목록 가져오는 Ajax
function commentListAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
				
				let cmtBtn = document.querySelectorAll(".cmtBtn");
				let cmtUpBtn = document.querySelectorAll(".cmtUpBtn");
				let commentWrapUp = document.querySelectorAll(".commentWrapUp");
				let textAreaWrap = document.querySelectorAll(".textAreaWrap");
				let commentList = document.getElementById("commentList");
				for (let i = 0; i < cmtUpBtn.length; i++) {
					
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
						commentListAjax()
					})
					
				}
			}
		}
	}
	xhr.open("GET", "freecommentlist.do?num=" + num, true);
	xhr.send();
}
commentListAjax();

//댓글 뿌려주는 html 영역
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
	                  <button type="button" onclick="commentDeleteAjax(${comment.num},${comment.commentGroupCode})">삭제</button>
                     </div>
					</div>
			
					<div class="commentWrapUp">
						${comment.content}
			    	</div>
			    	<div class="textAreaWrap">
			    	
			    		<form name="cmtForm" method="post" action="freecommentupdate.do" >
							<textarea class="cmtContent" num="${comment.num}">${comment.content}</textarea>
							<button class="cmtBtn" type="button" value="${comment.num},${comment.commentGroupCode}">등록</button>
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
function commentDeleteAjax(num, commentGroupCode) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {  // 데이터를 전부 받은상태
			if (xhr.status === 200) {// 요청성공
				makeCommentList(JSON.parse(xhr.responseText));
			} 
		} 
	};
	xhr.open("GET",`freecommentdelete.do?commentGroupCode=${commentGroupCode}&num=${num}`, true);
	xhr.send();
}

//댓글 등록
function commentRegistAjax() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = (e) => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
				let cmtUpBtn = document.querySelector0All(".cmtUpBtn");
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
	xhr.open("POST", "freecommentWrite.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	let f = document.crForm;
	xhr.send(`num=${num}&email=${f.email.value}&content=${f.content.value}`);
	
	f.email.value="";
	f.content.value="";
	
	return false;
}

// 댓글 수정
function commentUpdateAjax(i) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = (e) => {
		if(xhr.readyState === 4) {
			if(xhr.status === 200) {
				makeCommentList(JSON.parse(xhr.responseText));
			}
		}
	}
	xhr.open("POST", "freecommentupdate.do", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	let cmtBtn = document.querySelectorAll(".cmtBtn");
	let values = document.querySelectorAll(".cmtContent");
	let commentNum = cmtBtn[i].value.slice(0, cmtBtn[i].value.indexOf(","));
	let commentGroupCode = cmtBtn[i].value.slice(cmtBtn[i].value.indexOf(",")+1);
	xhr.send(`commentNum=${commentNum}&commentGroupCode=${commentGroupCode}&content=${values[i].value}`);
}

