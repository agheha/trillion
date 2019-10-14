let	submitbtn = document.querySelector("#submitbtn");
let	closeCreatebtn = document.querySelector("#closeCreatebtn");
let startdate = document.querySelector("#startdate");
let limitdate = document.querySelector("#limitdate");
let caltitle = document.querySelector("#caltitle");
let calcontent = document.querySelector("#calcontent");
let barcolor = document.querySelector("#barcolor");
let fontcolor = document.querySelector("#fontcolor");
		startdate.addEventListener("change",ld);
		
		closeCreatebtn.addEventListener("click",closeModalForCreate);
		
		function closeModalForCreate(){
			var modal = document.getElementById("myModalForCreate");
			modal.style.display = "none";
		}
		//종료일자 유효성
		function ld(){
			let sdValue = startdate.value;
			if(limitdate.value === false || limitdate.value < sdValue) limitdate.value = sdValue;
			limitdate.setAttribute("min",sdValue);	
		}
		
		function nullchk(){
			if(isempty(caltitle,"제목을 입력해주세요.")) return false;
			if(isempty(calcontent,"내용을 입력해주세요.")) return false;
			if(isempty(startdate,"시작일을 선택해주세요.")) return false; 
			if(isempty(limitdate,"종료일을 선택해주세요.")) return false; 
		}
		
		
		function isempty(ele, msg) {
			if (ele.value === "") {
				alert(msg);
				return true;
			}
			return false;
		}
		
		function onClickModalforCreate(e) {
			var modal = document.getElementById("myModalForCreate");
			
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
			modal.style.display = "block";
			ctmenu.classList.remove("rightclick");
		}
		
		
		