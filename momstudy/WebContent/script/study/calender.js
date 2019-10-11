let yearEle = document.querySelector(".year");
let monthEle = document.querySelector(".month");
let prevbtn = document.querySelector("#prevbtn");
let nextbtn = document.querySelector("#nextbtn");
let ctmenu = document.querySelector(".ctmenu");
let sdmenu = document.querySelector(".sdmenu");
let createSd = document.querySelector("#createSd"); 
let deleteSd = document.querySelector("#deleteSd"); 
let modifySd = document.querySelector("#modifySd");
let mindate = document.querySelector(".day:first-child");
let maxdate = document.querySelector(".day:last-of-type");
let daysEle = document.querySelector(".days");
daysEle.style.gridTemplateRows = `88px 88px 88px 88px 88px 88px`;
let daysPx = [88,88,88,88,88,88];
let sdEle;
for(let i = 0; i < 7; i++){
let row = document.querySelectorAll(`.day:nth-child(7n+${i})`)
	row.forEach((ele) =>{
		ele.style.gridColumn = i; 
		if(i === 0)ele.style.gridColumn = 7;
		if(i === 1)ele.style.color = 'red';
	})
}

for(let i = 1; i < 7; i++){
let row = document.querySelectorAll(`.day:nth-child(n + ${i*7 - 6}):nth-child(-n+ ${i*7})`)
	row.forEach((ele) =>{
		ele.style.gridRow = i; 
	})
}



prevbtn.addEventListener("click",prev);
nextbtn.addEventListener("click",next);
submitbtn.addEventListener("click",sendSd);

//우클릭이벤트
document.querySelector(".bigcal").addEventListener('contextmenu', function(e) {
	if(e.target.className === "schedule") {
		sdEle = e.target;
		ctmenu.classList.remove("rightclick");
		sdmenu.classList.remove("rightclick");
		sdmenu.classList.add("rightclick");
		sdmenu.style.top = e.pageY + "px";	
		sdmenu.style.left = e.pageX + "px";
		deleteSd.addEventListener("click",deleteCalender);
		e.preventDefault();		
	}else{
		sdmenu.classList.remove("rightclick");
		ctmenu.classList.remove("rightclick");
		ctmenu.classList.add("rightclick");
		ctmenu.style.top = e.pageY + "px";	
		ctmenu.style.left = e.pageX + "px";
		e.preventDefault();		
	}
})
//우클릭이벤트 우클릭후 다른곳 좌클릭
document.querySelector(".bigcal").addEventListener('click', function(e) {
	ctmenu.classList.remove("rightclick");
	sdmenu.classList.remove("rightclick");
})

createSd.addEventListener("click",onClickModalforCreate);


function loading(month,year){
	removeSd();
  	let xhr = new XMLHttpRequest();
  	xhr.onreadystatechange = () =>{
    	if(xhr.readyState == 4){
      		if(xhr.status == 200){
			let obj = JSON.parse(xhr.responseText);
			let days=document.querySelectorAll(".day");
			days.forEach((day,i) => {
				let dates = obj.dates[i]
				let date = dates.substr(6,2);
				day.innerText = date; 
				day.setAttribute("dates",dates);
			});
			mindateVal = mindate.getAttribute("dates");
			maxdateVal = maxdate.getAttribute("dates");
			let gridArea;
			let srow, scol, erow, ecol;
			let location = new Array;
			obj.list.forEach(cal=>{
				//시작과 끝을 넘어갈 때 정해줌
				if(cal.startDate < mindateVal) {
					gridArea = mindate.style.gridArea.substr(0,5).replace("/","").replace(" ","").split(" ")
					srow = gridArea[0];
					scol = gridArea[1];
				}
				
				if(cal.endDate > maxdateVal) {
					gridArea = maxdate.style.gridArea.substr(0,5).replace("/","").replace(" ","").split(" ")
					erow = gridArea[0];
					ecol = gridArea[1];
				}
				
				//그게 아니면 시작과 끝을 돌면서 시작과 끝을 정함
				days.forEach((day,i) => {
					let dayDateVal = day.getAttribute("dates");
					
					if(cal.startDate === dayDateVal) {
						gridArea = day.style.gridArea.substr(0,5).replace("/","").replace(" ","").split(" ")
						srow = gridArea[0];
						scol = gridArea[1];
					}
					
					if(cal.endDate === dayDateVal) {
						gridArea = day.style.gridArea.substr(0,5).replace("/","").replace(" ","").split(" ")
						erow = gridArea[0];
						ecol = gridArea[1];
					}
				});
				
				//속성 설정
				let backgroundCode = cal.barColor;
				let fontCode = cal.fontColor;
				let sdlist = new Array;
				let oritop = 22;
				
				//다 정했으면 컬럼과 로우를 가지고 세션을 만들고 세션의 속성에 넣어줌
				for(let i = parseInt(srow); i <= erow; i++){
					let temptop = 22;
					//초기값 설정
					let setscol = 1;
					let setecol = 8;
					//자리 지정
					if( i === parseInt(srow)) setscol = parseInt(scol);
					if( i === parseInt(erow)) setecol = parseInt(ecol) + 1;
					//요소 생성 및 속성 지정
					let sd = document.createElement("section");
					sd.style.gridArea = `${i} / ${setscol} / auto / ${setecol}`;
					sd.style.background = backgroundCode;
					sd.style.color = fontCode;
					sd.classList.add("schedule");
					sd.innerText = cal.title;
					sdlist.push(sd);
					sd.setAttribute("num",cal.num);
					sd.addEventListener("click",(e)=>{
						selectResult(e.target.getAttribute("num"));
						onClickModalforDetail();
					});
					//높이 구하기
					location.forEach((ele)=>{
						let prevScol = ele.setscol;
						let prevEcol = ele.setEcol;
						let prevRow = ele.i;
						if(prevRow === i && !(setscol > prevEcol || setecol < prevScol)){
							temptop = temptop + 22; 
						}
					})
					if(oritop < temptop) oritop = temptop;

					//위치값 저장
					location.push({i,setscol,setecol});
				}

				//높이값을 설정하면서 만약 3개가 넘어가면 행의 크기 늘림
				sdlist.forEach((ele)=>{
					daysEle.append(ele);
					let i = ele.style.gridArea.substr(0,1);
					ele.style.top = oritop + "px";

					if(oritop > 66){
						let gtr = "";
						daysPx[i-1] = oritop + 22;
						for(let i = 0; i < daysPx.length; i++){
							gtr += daysPx[i] + "px" + " "; 
						}
						daysEle.style.gridTemplateRows = gtr;
					}
				})

			})
			
			
			

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

function sendSd(){
	if(nullchk() === false) return;
	let startdateVal = startdate.value; 
	let limitdateVal = limitdate.value;
	let caltitleVal  = caltitle.value;
	let calcontentVal  = calcontent.value;
	let barcolorVal = barcolor.value + "";
	let fontcolorVal = fontcolor.value + "";
	let caltype = 1;
	if(document.querySelector("#study").checked === false) caltype = 2;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				alert("등록되었습니다.");
				closeModalForCreate();
				startdate.value = null;     
				limitdate.value = null;     
				caltitle.value = null;      
				calcontent.value = null;  
				barcolor.value = null;  
				fontcolor.value = null;
				first();
			}
		}
	}
	xhr.open("POST",`/momstudy/study/insertschedual.do`,true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.send(`start=${startdateVal}&end=${limitdateVal}&title=${caltitleVal}&content=${calcontentVal}&caltype=${caltype}&barcolor=${barcolorVal}&fontcolor=${fontcolorVal}`);
}

function removeSd(){
	let sds = document.querySelectorAll(".schedule");
	sds.forEach((ele)=>{
		ele.remove();
	})
}

function deleteCalender(){
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				console.log(typeof(xhr.responseText));
				if(xhr.responseText.trim() === '1'){
					alert("삭제되었습니다.");
					first();
					sdmenu.classList.remove("rightclick");
				}else{					
					alert("작성자만 삭제할 수 있습니다.");
					sdmenu.classList.remove("rightclick");
				}
			}
		}
	}
	xhr.open("POST",`/momstudy/study/deleteschedule.do`,true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.send("num="+sdEle.getAttribute("num"));
}




