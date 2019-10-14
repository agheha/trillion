let	resultTitle = document.querySelector("#resultTitle");
let	resultContent = document.querySelector("#resultContent");
let resultstart = document.querySelector("#resultstart");
let resultend = document.querySelector("#resultend");
let resulttype = document.querySelector("#resulttype");
let closeDetailBtn = document.querySelector("#closeDetailBtn");
let resultEmail = document.querySelector("#resultEmail")

closeDetailBtn.addEventListener("click",closeModalForDetail);
//결과페이지 데이터조회
function selectResult(num){
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				let cal = JSON.parse(xhr.responseText);
				resultEmail.innerText = cal.email;
				resultTitle.innerText = cal.title;
				resultContent.innerText = cal.content;
				resultstart.innerText = cal.startDate;
				resultend.innerText = cal.endDate;
				resulttype.innerText =  cal.type === 1 ? "스터디 모임" : "일정"; 
			}
		}
	}
	xhr.open("GET",`/momstudy/study/selectsoneschedule.do?num=${num}`,true);
	xhr.send();
}

function onClickModalforDetail(e) {
	var modal = document.getElementById("myModalForDetail");

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	modal.style.display = "block";
	ctmenu.classList.remove("rightclick");
}

function closeModalForDetail(){
	var modal = document.getElementById("myModalForDetail");
	modal.style.display = "none";
}



