function userAjax(no) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let user = JSON.parse(xhr.responseText);
// console.log(user)
				make(user);
			}
		}
	}
	xhr.open("GET", "reportuser.do?no=" +no, true);
	xhr.send();
}

function make(user) {

	let popUp = document.getElementById("prpop_content");

	let html = 
		`<div id="b_main">
        <div class="b_content" onclick="mopen1(),userDtailAjax('${user.reportTarget}')">
        <div >아이디</div>
        <div> ${user.reportTarget}</div>
    </div>
    <div class="b_content" onclick="mopen1(),userDtailAjax('${user.email}')">
        <div>신고자</div>
        <div> ${user.email}</div>
    </div>
    <div class="b_content">
        <div>신고사유</div>
        <div id="con1">${user.reseaon}</div>
    </div >
    <div id="b_content">내용<br/>${user.content}</div>
</div>
<div id="prpoplayer" onclick="mclose()"></div>`;
	
	console.log(html);
	popUp.innerHTML = html;

}