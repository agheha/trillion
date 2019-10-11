function allCheck() {
	let f = document.mform;
	let dleNo = f.dleNo

	if (dleNo.length) {
		if (document.querySelector("#all").checked == true) {
			for (let i = 0; i < dleNo.length; i++) {
				dleNo[i].checked = true;
			}
		} else {
			for (let i = 0; i < dleNo.length; i++) {
				dleNo[i].checked = false;
			}
		}
	} else {
		if (document.querySelector("#all").checked == true) {
			dleNo.checked = true;
		} else {
			dleNo.checked = false;
		}
	}
}