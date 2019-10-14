function check() {
	let title = document.create.title;
	let content = document.create.content;
	
	if(title.value=="") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	} else if(content.value=="") {
			alert("내용을 입력해주세요.");
			content.focus();
			return false;
	}
}

function checkDisable(form) {
	if (form.type.checked == false)  {
		form.notice.disabled = true;
	} else {
		form.notice.disabled = false;
	}
}


