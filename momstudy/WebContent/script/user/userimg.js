let btnUpload = document.querySelector("#btn-upload")
let file = document.querySelector("#file")
btnUpload.addEventListener("click", e => {
	file.addEventListener("click", () => {
		alert("클릭")
	})
})