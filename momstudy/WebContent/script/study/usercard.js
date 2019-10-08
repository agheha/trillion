		let sbtn = document.querySelector("#sbtn");
		
		sbtn.addEventListener("click",sendStar);
		
	function sendStar(){
		let score = document.scoreForm.score.value;
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					document.querySelector("#inputscore").innerText = xhr.responseText;
					loading(email);
				}
			}
		}
		console.log(email);
	
		xhr.open("GET",`/momstudy/study/inputscore.do?score=${score}&email=${email}`,true);
	  	xhr.send();
	}
	
	function chkStar(){
		let score = document.scoreForm.score.value;
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = ()=>{
			if(xhr.readyState === 4){
				if(xhr.status === 200){
					if(xhr.responseText) document.querySelector("#inputscore").innerText = xhr.responseText;
				}
			}
		}
		console.log(email);
		
		xhr.open("GET",`/momstudy/study/checkscore.do?score=${score}&email=${email}`,true);
		xhr.send();
	}
	
	
	
	