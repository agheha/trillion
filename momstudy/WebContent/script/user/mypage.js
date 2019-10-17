loading(email);
let xindex = 0;
let sForm = document.sForm;
let numput = document.querySelector("#numput")

if(document.querySelector("#forslide") !== null){
	let forslide = document.querySelector(".forslide");
	let cardEle = document.querySelectorAll(".studycard");
	forslide.style.width = cardEle.length * 270 + 'px';	
	cardEle.forEach((card)=>{
		card.addEventListener("click",()=>{
			numput.value = parseInt(card.getAttribute("num"));
			sForm.submit();
		})
	})
	
	function slidePrev(){
		xindex = xindex + 270;
		forslide.style.left = xindex + 'px';
		if(xindex >= 270) {
			setTimeout(()=>{
				xindex = xindex - 270;
				forslide.style.left = xindex + 'px';
			}, 100);
			return;
		}
	}

	function slideNext(){
		xindex = xindex - 270;
		forslide.style.left = xindex + 'px';
		if(xindex < parseInt(forslide.style.width) * -1 + 270 * 4) {
	        setTimeout(()=>{
	        	xindex = xindex + 270;
	        	forslide.style.left = xindex + 'px';
	        }, 100);
	        return;
	    }
	}
	
	slidePrev();

}

document.querySelector("#prevBtn").addEventListener("click",slidePrev);
document.querySelector("#nextBtn").addEventListener("click",slideNext);

if(document.querySelector(".smallcon") !== null){
	document.querySelector("#prevBtn").remove();
	document.querySelector("#nextBtn").remove();
}


