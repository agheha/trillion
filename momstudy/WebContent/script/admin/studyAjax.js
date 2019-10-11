function studyAjax(num) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let study = JSON.parse(xhr.responseText);
 console.log(study)
				make(study);
			}
		}
	}
	xhr.open("GET", "reportoneStudy.do?num=" +num, true);
	xhr.send();
}

function make(study) {

	let s_title = document.getElementById("s_title");
	let s_type = document.getElementById("s_type");
	let s_cap = document.getElementById("s_cap");
	let s_email = document.getElementById("s_email");
	let con1 = document.getElementById("con1");
	let b_content = document.getElementById("b_content");
	
	
	s_title.innerHTML = ` ${study.studyTitle}`;
	s_type.innerHTML = ` ${study.categoryName}`;
	s_cap.innerHTML = `
		<div>스터디 장</div>
		<div id="s_cap" onclick="mopen1(),userDtailAjax('${study.cap}')">${study.cap}</div>
	 `;
	s_email.innerHTML = ` 
		<div>신고자</div>
		<div id="s_email" onclick="mopen1(),userDtailAjax('${study.email}')">${study.email}</div>
	`;
	con1.innerHTML = ` ${study.reseaon}`;
	b_content.innerHTML = `내용<br/>${study.content}`;
	
}