function reportAjax() {
	
    let categoryCode = document.querySelector(".categoryCode");
  
    if(categoryCode == null ) {
    	categoryCodeVal = undefined;
    }
    else{
    	 categoryCodeVal = categoryCode.value;
    }
    let type = document.querySelector(".type");
    if(type == null ) {
         typeVal = undefined;
    }
    else{
    	 typeVal = type.value;
    }
    let reportTarget = document.querySelector(".reportTarget");
    if(reportTarget == null ) {
         reportTargetVal = undefined;
    }
    else{
    	 reportTargetVal = reportTarget.value;
    }
    let boardNum = document.querySelector(".boardNum");
    if(boardNum == null ) {
         boardNumVal = undefined;
    }
    else{
    	 boardNumVal = boardNum.value;
    }
    let content = document.querySelector(".content");
    if(content == null ) {
         contentVal = undefined;
    }
    else{
    	 contentVal = content.value;
    }
    let code = document.querySelector('input[name = code]:checked');
    if(code == null ) {
         codeVal = undefined;
    }
    else{
    	 codeVal = code.value;
    }
    let email = document.querySelector(".email");
    if(email == null ) {
         emailVal = undefined;
    }
    else{
    	 emailVal = email.value;
    }
    let boardType = document.querySelector(".boardType");
    if(boardType == null ) {
         boardTypeVal = undefined;
    }
    else{
    	 boardTypeVal = boardType.value;
    }
    let studyNum = document.querySelector(".studyNum");
    if(studyNum == null ) {
         studyNumVal = undefined;
    }
    else{
    	 studyNumVal = studyNum.value;
    }
    console.log(categoryCode)
    console.log(type)
    console.log(reportTarget)
    console.log(boardNum)
    console.log(content)
    console.log(code)
    console.log(email)
    console.log(boardType)
    console.log(studyNum)
//	값
    console.log(categoryCodeVal)
    console.log(typeVal)
    console.log(reportTargetVal)
    console.log(boardNumVal)
    console.log(contentVal)
    console.log(codeVal)
    console.log(emailVal)
    console.log(boardTypeVal)
    console.log(studyNumVal)

    
    // POST 방식
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                if(xhr.responseText == 1){
                    alert("신고되었습니다.")
                    
                }
            }
        }
    }
    // post 방식의 요청일 경우 파라미터를 send 메소드의 매개변수에 설정
    // 헤더 설정 필요
    xhr.open("POST", "/momstudy/admin/report.do", true);

    // 설정이 없는 경우 파라미터가 전송되지 않는다
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.send(`categoryCode=${categoryCodeVal}&type=${typeVal}&reportTarget=${reportTargetVal}&boardNum=${boardNumVal}&content=${contentVal}&code=${codeVal}&email=${emailVal}&boardType=${boardTypeVal}&studyNum=${studyNumVal}`);
}