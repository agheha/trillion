let select = document.querySelectorAll('input[name="userAddr"]')
		function show(index) {
			
			let ulEle = document.querySelectorAll("#showArea > ul");
			
			ulEle.forEach((ele) => {
				ele.style.display="none"
			})
			
			let area = document.querySelector("#baddr"+ index).getAttribute("value")
			ulEle.forEach((ele)=> {
				if(area === ele.id) {
					ele.style.display="block";
				}
			})
		}
		
		select.forEach((ele) => {
			ele.addEventListener("click",showText);
		})
		select.forEach((ele) => {
			ele.addEventListener("click",del);
		})

		function showText(e) {

			let textArea = document.querySelector("#selArea");
			if (e.target.checked){
				let spanEle = document.createElement("span");
				spanEle.id = 'show'+e.target.value;
				spanEle.innerText =  e.target.getAttribute("sAdd");
				textArea.append(spanEle);
				return
			}
		}

		function del(e){
			let textArea = document.querySelector("#selArea");
			if (e.target.checked === false){
			document.querySelector('#show' + e.target.value).remove();
			return 	
			}
		}