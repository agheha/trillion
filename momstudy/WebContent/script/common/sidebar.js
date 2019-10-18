	
let bAdmin = document.querySelector("#admin");
let admin = document.querySelector(".admin");
let aForm = document.adminForm;
let adminEle = document.querySelectorAll(".adminele");

// 반목돌면서 관리자메뉴에 클릭이벤트를 걸어줌
adminEle.forEach((ele) =>{
	ele.addEventListener('click',()=>{
		aForm["action"] = ele.getAttribute("go");
		 aForm.submit();
	})
})
	
// 메인으로 감
function goMain(){
	let f = document.goForm;
	f.submit();
}

// 스터디 장일 떄에만 관리자메뉴를 보여줌
if(bAdmin !== undefined ){
	bAdmin.addEventListener('click',()=>{
		bAdmin.classList.toggle("clicked");
		admin.classList.toggle("admin")
	})		
}
// 모달을 위한 변수 설정
let updateStudyMd = document.querySelector(".updateStudyMd");
let studyUpdate = document.querySelector("#studyUpdate");
let clsmodbtn = document.querySelector("#clsmodbtn");
let backgroundMd = document.querySelector(".backgroundMd");
// 모달 닫기 함수
function clsStudyMd(){
	updateStudyMd.classList.add("mdhidden");
}
// 모달 열기 함수
studyUpdate.addEventListener("click",()=>{
	insertInfo();
	updateStudyMd.classList.remove("mdhidden");
	f.action = "studyupdate.do"
})

backgroundMd.addEventListener('click',clsStudyMd);


function insertInfo(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				let obj = JSON.parse(xhr.responseText);
				let f = document.querySelector("#studyWriteForm");
				document.querySelector("#sname").innerText = "스터디 수정";
				f.name.value = obj[0].name;
				f.num.value = obj[0].num;
				let categoryOpt = `<option>선택</option>`;
				obj[1].forEach((ele)=>{
					categoryOpt += `<option value=${ele.categoryCode}>${ele.categoryName}</option>`;
				})
				f.category.innerHTML = categoryOpt;
				
				let addrOpt = `<option>선택</option>`;
				obj[2].forEach((ele)=>{
					addrOpt += `<option>${ele.addressDetail}</option>`;
				})
				f.address1.innerHTML = addrOpt;
				
				
				addbutton();
				
				let studyWriteBtn = document.querySelector("#studyWriteBtn")
				studyWriteBtn.innerText = "수정";
				studyWriteBtn.type = "button";
				studyWriteBtn.addEventListener("click",()=>{
					if(chknull() === false) return;
					updateStudy();
				});
				//Y
				
				
				//Y

			}
		}
	}
	xhr.open("GET","studyupdateform.do",true);
	xhr.send();
}

function addbutton(){
	let sn = document.querySelector("#Ysn");
	let indelb = document.querySelector("#delsbtn")
	if(indelb == null){
	sn.innerHTML += `<button class="inbutton del" type="button" id="delsbtn" onclick="deleteStudy()">삭제</button>`;
	}
}

function updateStudy(){
	let f = document.querySelector("#studyWriteForm");
	let name = f.name.value;
	let categoryCode = f.category.value;
	let addressCode = f.address2.value;
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				clsStudyMd();
				alert("수정되었습니다.")
				f.action = 'studymain.do';
				f.submit();
			}
		}
	}
	xhr.open("POST","studyupdate.do");
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.send(`name=${name}&categoryCode=${categoryCode}&addressCode=${addressCode}`);
}

function deleteStudy() {
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				if(xhr.responseText.trim() === '1'){
					alert("스터디원이 존재합니다.");
				}else{
					alert("스터디가 삭제되었습니다.");
					location.href = "/momstudy/user/mypage.do";
				
				}
			}
		}
	}
	xhr.open("POST","studydelete.do");
	xhr.send();
}