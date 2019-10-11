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
	
	
	btitle.innerHTML = ` ${board.boardTitle}`;
	btype.innerHTML = ` ${board.boardType}`;
	bemail.innerHTML = `
		<div>신고자</div>
		<div id="board_email" onclick="mopen1(),userDtailAjax('${board.email}')"> ${board.email}</div>
	 `;
	con1.innerHTML = `  ${board.reseaon}`;
	bcontent.innerHTML = `내용<br/>${board.content}`;
	

}