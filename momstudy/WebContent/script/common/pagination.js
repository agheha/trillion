let p = document.pForm;
let s = document.sForm;
let lis = document.querySelectorAll(".lis");
let checkedEle = document.querySelector("#checked");
checkedEle && checkedEle.classList.add("check");
let searchbtn = document.querySelector("#searchbtn");
searchbtn.addEventListener('click',(e)=>{
	s.submit();
})
lis.forEach((ele)=>{
	ele.addEventListener('click',(e)=>{
		document.querySelector("#pageNo").value = e.target.innerText;
		p.submit();
	})
})
