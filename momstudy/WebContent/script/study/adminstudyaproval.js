		let aprovalform = document.aprovalForm;
		let aprovalbtn = document.querySelector(".stm_button");
		aprovalbtn.addEventListener('click',()=>{
			aprovalform.submit();
		})
		
		
			let name;
			let email;
			
			// add event listener
			// get elements
			let dataRows = document.getElementsByClassName('tr_row');

			// make func
			function onClickModal(e) {
				var modal = document.getElementById("myModal");
				loadingreset()
				// Get the <span> element that closes the modal
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
				modal.style.display = "block";
				name = e.target.parentNode.getAttribute("name");
				email = e.target.parentNode.getAttribute("email");
				
				// 클릭한 row 의 id 값 참조해서 데이터 주입하는 작업
				// ajax 사용하거나 이미 가져온 데이터 활용하거나 선택
				loading(email);
				document.querySelector("#username").innerText = name;
				chkStar();
				
			}

			// add event listener
			for (let i = 0; i < dataRows.length; i++) {
				let tdEles = dataRows[i].children;
				for(let i = 0; i < tdEles.length - 1; i++){
					tdEles[i].addEventListener('click',onClickModal);
				}
			}
			
			