function selectResultForUpdate(){
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = ()=>{
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				let cal = JSON.parse(xhr.responseText);
				startdate.value = cal.startDate.substr(0,4) + "-" + cal.startDate.substr(4,2)  + "-" + cal.startDate.substr(6,2) 
				limitdate.value = cal.endDate.substr(0,4) + "-" + cal.endDate.substr(4,2)  + "-" + cal.endDate.substr(6,2) 
				caltitle.value = cal.title;     
				calcontent.value = cal.content; 
				barcolor.value = cal.barColor;
				fontcolor.value = cal.fontColor;
				if(cal.type === 1){
					document.querySelector("#study").checked					
				} else{
					document.querySelector("#normal").checked										
				}
			}
		}
	}
	xhr.open("GET",`/momstudy/study/selectsoneschedule.do?num=${sdEle.getAttribute("num")}`,true);
	xhr.send();
}

