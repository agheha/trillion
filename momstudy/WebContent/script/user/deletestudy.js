	let select;	
   		let cancells = document.querySelectorAll("button[name='cancell']");
   		cancells.forEach((ele) => {
   			ele.addEventListener("click", e => {
   				select = e.target.value
   				modal.style.display="block";
   			})
   		})
    	function agree() {
    		let divEle =  document.querySelector("#content");
    		divEle.innerHTML = "<div id='que'>탈퇴되었습니다</div>"
    		let xhr = new XMLHttpRequest();
    		xhr.onreadystatechange = e => {
    			if (xhr.readyState === 4) {
    				if (xhr.status === 200) {
    					setTimeout(() => {
    						location.href="/momstudy/user/studydeleteform.do"
    					}, 2000);
    				} 
    			}
    		}
    		xhr.open("GET", "/momstudy/user/studydelete.do?cancell="+select)
    		xhr.send();
  				
    	}