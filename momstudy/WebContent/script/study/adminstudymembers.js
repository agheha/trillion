		let banform = document.banform;
		let banbtn = document.querySelector(".stm_button");
		banbtn.addEventListener('click',()=>{
			banform.submit();
		})
		
		let leaderButton = document.querySelector(".leader_button");
		
		leaderButton.addEventListener("click",()=>{
			let chkboxEle =  document.querySelectorAll("input[type='checkbox']");
			let cnt = 0
			
			for(let i = 0; i < chkboxEle.length; i++){
				if(chkboxEle[i].checked === true) cnt++
				if(cnt > 1){
					alert("스터디 위임은 1명에게만 할 수 있습니다.");
					return;					
				}
			}
			console.log(banform);
			banform.action = 'passstudyleader.do';
			banform.submit();
		}); 