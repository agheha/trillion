


let modal = document.getElementById('myModal');
let passBtn = document.getElementById("passUpdate");
let span = document.getElementsByClassName("close")[0];                                          

passBtn.onclick = function() {modal.style.display = "block";}
span.onclick = function() {modal.style.display = "none";}
window.onclick = function(e) {
    if (e.target == modal) {modal.style.display = "none";}
} // 모달창 구현

let userCategory = document.querySelectorAll('input[name="category"]')

userCategory.forEach(cate => {			
	selectCate.forEach(categoryCode => {
		if (categoryCode === parseInt(cate.value)) {
			cate.checked = true
		}		
	})
})
// 모달창에서 클릭시 넘어오는 페이지
let pass = document.querySelector("#passchk")

let btn = document.querySelector("#btn")
btn.addEventListener("click", e => {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = e => {
		if (xhr.readyState === 4) {
			if (xhr.status == 200) {
				console.log(xhr.responseText);
				if (parseInt(xhr.responseText) === 1) {
					location.href = "/momstudy"+"/jsp/user/updatepass.jsp"
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			} 
		}
	}
	xhr.open("POST", "passchk.do", true)
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("pass="+pass.value);
})

let select = document.querySelectorAll('input[name="userAddr"]')
let textArea = document.querySelector("#selArea");
select.forEach(selectAreaCode => {
	userAddrCode.forEach(areaCode => {
		if (areaCode === parseInt(selectAreaCode.value)){
			selectAreaCode.checked = true
			let spanEle = document.createElement("span");
			spanEle.id = 'show'+selectAreaCode.value;
			spanEle.innerText =  selectAreaCode.getAttribute("sAdd");
			textArea.append(spanEle);
		}
	})
})

select.forEach((ele) => {
	ele.addEventListener("click",showText);
})
select.forEach((ele) => {
	ele.addEventListener("click",del);
})



function showText(e) {
	
	if (e.target.checked){
		let spanEle = document.createElement("span");
		spanEle.id = 'show'+e.target.value;
		spanEle.innerText =  e.target.getAttribute("sAdd");
		textArea.append(spanEle);
		return
	}
}

function del(e){
	let textArea = document.querySelector("#selArea");
	if (e.target.checked === false){
	document.querySelector('#show' + e.target.value).remove();	
	return 	
	}
}

function doAction() {
	alert("수정이 완료되었습니다.")
}

function show(index) {
	
	let ulEle = document.querySelectorAll("#showArea > ul");
	
	ulEle.forEach((ele) => {
		ele.style.display="none"
	})
	
	let area = document.querySelector("#baddr"+ index).getAttribute("value")
	ulEle.forEach((ele)=> {
		if(area === ele.id) {
			ele.style.display="block";
		}
	})
}