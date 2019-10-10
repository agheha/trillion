<<<<<<< HEAD
let f = document.fForm
let myimg= document.querySelector("#myimg");
file.addEventListener("change", e => {
	f.submit();
=======
let file = document.querySelector("#file")
let myimg = document.querySelector("#myimg")
file.addEventListener("change", e => {
	let fileName = file.value.substr(lastIndexOf("."))
	
	console.log(fileName)
>>>>>>> master
})