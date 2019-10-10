let yearEle = document.querySelector(".year");
let monthEle = document.querySelector(".month");
let prevbtn = document.querySelector("#prevbtn");
let nextbtn = document.querySelector("#nextbtn");
prevbtn.addEventListener("click",prev);
nextbtn.addEventListener("click",next);


function loading(month,year){
  	let xhr = new XMLHttpRequest();
  	xhr.onreadystatechange = () =>{
    	if(xhr.readyState == 4){
      		if(xhr.status == 200){
			let obj = JSON.parse(xhr.responseText);
			let days=document.querySelectorAll(".day");
			days.forEach((day,i) => {
				day.innerText = obj[i]; 
			});
			}
    	}
  	}
  	
  	
  	xhr.open("GET",`/momstudy/study/calender.do?year=${year}&month=${month}`,true);
  	xhr.send();
}

function prev(){
	let month = parseInt(monthEle.innerText);
	let year = parseInt(yearEle.innerText);
	if(month != 1){
		month = month - 1;
		monthEle.innerText = month + "월"
	} else {
		month = 12;
		monthEle.innerText = month + "월"
		year = year - 1;				
		yearEle.innerText = year + "년";
	}
	loading(month, year);
}

function next(){
	let month = parseInt(monthEle.innerText);
	let year = parseInt(yearEle.innerText);
	if(month != 12){
		month = month + 1;
		monthEle.innerText = month + "월"
	} else {
		month = 1;
		year = year + 1;
		monthEle.innerText = month + "월"				
		yearEle.innerText = year + "년";
	}
	loading(month, year);
}

function first(){
	let month = parseInt(monthEle.innerText);
	let year = parseInt(yearEle.innerText);
	loading(month, year);
}

first();
