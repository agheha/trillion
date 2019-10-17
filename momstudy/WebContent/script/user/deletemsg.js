const msgmodal = document.querySelector(".msgmodal"); 
const delButton = document.getElementById("signup"); 
const closecell = document.querySelector(".closer"); 
const delOpenModal = () => { 
	msgmodal.style.display = "block";
} 
const delCloseModal = () => { 
	msgmodal.style.display = "none"; 
} 
closecell.addEventListener("click", delCloseModal); 
delButton.addEventListener("click", delOpenModal); 
