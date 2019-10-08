  function loading(email){
    let avgEle = document.querySelector("#avg");
    let total = document.querySelector("#total");
  	let xhr = new XMLHttpRequest();
  	xhr.onreadystatechange = () =>{
    	if(xhr.readyState == 4){
      		if(xhr.status == 200){
        	let obj = JSON.parse(xhr.responseText);
       			if(obj.length !== 0){
              let avg = obj[0].avg.toFixed(1);
        			avgEle.innerText = avg;
        			total.innerHTML = '<i class="icon-user"></i> ' + obj[0].total +  ' total';
        			let bars = document.querySelectorAll(".bar");
        			bars.forEach(bar => {
          				obj.forEach(scores =>{
            			let cnt = bar.lastElementChild;
            				if(scores.score === parseInt(cnt.getAttribute("index"))){
              					bar.style.width = scores.percent+"%";
              					cnt.innerText = scores.cnt;
              					
            				}	
          				})			
        			});
              let starpoint = (avg * 2).toFixed(0);
              let stars = document.querySelectorAll(".stars");
              stars.forEach(star =>{
                let starc = star.lastElementChild;
                
                if(starpoint >= 2){
                  starc.className="active icon-star";
                  
                } else if (starpoint >= 1){
                  starc.className="active icon-star-half-empty ";
                }
                starpoint = starpoint - 2; 
              })
              
        		}
      		}
    	}
  	}
  	
  	
  	xhr.open("GET","/momstudy/study/userinfo.do?email="+email,true);
  	xhr.send();
  }

  function loadingreset(){
	    document.querySelector("#avg").innerText = '0.0';
	    document.querySelector("#total").innerHTML = '<i class="icon-user"></i> 0 total';
	    let bars = document.querySelectorAll(".bar");
	    bars.forEach(bar => {
	    	bar.style.width = 0;
	        let cnt = bar.lastElementChild;
	        cnt.innerText = 0;		
	    })			
	    let stars = document.querySelectorAll(".stars");
	        			
	    stars.forEach(star =>{
	      let starc = star.lastElementChild;
	      starc.className="active icon-star";
	    })
	    
	    document.querySelector("#inputscore").innerHTML = `<form action="" name="scoreForm">
			<span>별점주기 </span> <select name="score" id="scoresle">
			<option value="1">1점</option>
			<option value="2">2점</option>
			<option value="3">3점</option>
			<option value="4">4점</option>
			<option value="5">5점</option>
		</select>
		<button type="button" id="sbtn">전송</button>
	</form>`;
	
	let sbtn = document.querySelector("#sbtn");
		
		sbtn.addEventListener("click",sendStar);
		
	    
  }
	  	