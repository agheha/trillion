let userCategory = document.querySelectorAll('input[name="category"]')

userCategory.forEach(cate => {			
	selectCate.forEach(categoryCode => {
		if (categoryCode === parseInt(cate.value)) {
			cate.checked = true
		}		
	})
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

function del(e) {
	let textArea = document.querySelector("#selArea");
	if (e.target.checked === false ){
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