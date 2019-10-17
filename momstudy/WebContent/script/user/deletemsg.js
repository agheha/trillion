const delButton = document.getElementById("signup"); 
const msgmodal = document.querySelector(".msgmodal"); 
const closecell = document.querySelector("#closecell"); 
const delOpenModal = () => { 
	msgmodal.classList.remove("hidden");
} 
const delCloseModal = () => { 
	msgmodal.classList.add("hidden"); 
} 
closecell.addEventListener("click", delCloseModal); 
delButton.addEventListener("click", delOpenModal); 