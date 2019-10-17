function allCheck() {
	let f = document.mform;
	let categoryCode = f.categoryCode

	if (categoryCode.length) {
		if (document.querySelector("#all").checked == true) {
			for (let i = 0; i < categoryCode.length; i++) {
				categoryCode[i].checked = true;
			}
		} else {
			for (let i = 0; i < categoryCode.length; i++) {
				categoryCode[i].checked = false;
			}
		}
	} else {
		if (document.querySelector("#all").checked == true) {
			categoryCode.checked = true;
		} else {
			categoryCode.checked = false;
		}
	}
}