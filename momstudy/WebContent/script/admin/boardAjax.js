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
	let bemail = document.getElementById("board_email");
	let con1 = document.getElementById("con1");
	let bcontent = document.getElementById("b_content");
	
	
	btitle.innerHTML = ` ${board.boardTitle}`;
	btype.innerHTML = ` ${board.boardType}`;
	bemail.innerHTML = ` ${board.email}`;
	con1.innerHTML = ` ${board.reseaon}`;
	bcontent.innerHTML = `내용<br/>${board.content}`;
	
	console.log(html);
	popUp.innerHTML = html;

}