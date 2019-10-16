
			let f = document.querySelector("#studyWriteForm");

			let selectb = f.address1;
			selectb.addEventListener("change",selectaddress)

		function chknull() {
			if (isempty(f.name, "스터디 이름을 입력해주세요."))
				return false;
			if (f.category.selectedIndex === 0) {
				alert("카테고리를 선택해주세요");
				return false;
			}
			if (f.address1.selectedIndex === 0
					|| f.address2.selectedIndex === 0) {
				alert("지역을 선택해주세요");
				return false;
			}
			return true;
		}

		function isempty(ele, msg) {
			if (ele.value === "") {
				alert(msg);
				return true;
			}
			return false;

		}

		function selectaddress(e){
			let bigAddr = e.target.value;
			let sAddrSle = f.address2;
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = ()=>{
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						let obj = JSON.parse(xhr.responseText)
						let html = "<option>선택</option>";
							obj.forEach(sAddr => {
								html += `<option value="${sAddr.addressCode}">${sAddr.addressDetail2}</option>`
							});							
						sAddrSle.innerHTML = html;
					}
				}
			}
			xhr.open("GET","address.do?baddr=" + bigAddr,true);
			xhr.send();
		}
