loading(email);
let xindex = 0;
let sForm = document.sForm;
let numput = document.querySelector("#numput")

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

let forslide = document.querySelector(".forslide");
forslide.style.width = cardEle.length * 270 + 'px';

document.querySelector("#prevBtn").addEventListener("click",slidePrev);
document.querySelector("#nextBtn").addEventListener("click",slideNext);
if(document.querySelector("#smallcon") !== false){
	document.querySelector("#prevBtn").remove();
	document.querySelector("#nextBtn").remove();
}

let cardEle = document.querySelectorAll(".studycard");

cardEle.forEach((card)=>{
	card.addEventListener("click",()=>{
		numput.value = parseInt(card.getAttribute("num"));
		sForm.submit();
	})
})

slidePrev();