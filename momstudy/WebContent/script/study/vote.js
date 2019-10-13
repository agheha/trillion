
		function add_tr() {
			var str = "" 
			str = `<td class="poll-option"><input type="text" name="aricle`+ count++ +`"placeholder="항목을 입력해주세요.">
						<div class="poll-option-bar"></div>
					</td>
					<td><button type="button" class="vote-btn-remove"
						onclick="remove_tr(this)">삭제</button>
					</td>`;

			var tr = document.createElement('tr');
			tr.className = "vote-row";
			tr.innerHTML = str;
			document.getElementById('aricle').appendChild(tr);
			he = document.querySelector("body").offsetHeight;
			
			this.resizeTo(530,he+80);
		}
		
		function dchk(){
			let inputs = document.querySelectorAll("input[type='text']");
			let limitdate = document.querySelector("#limitdate");
			for(let i = 1; i < inputs.length; i++){
				for(let j = i + 1; j < inputs.length; j++){
					if(inputs[i].value === inputs[j].value){
						alert("중복된 항목이 있습니다.")
						return;
					}
				}
				if(isempty(inputs[i],"항목을 입력해주세요.")) return;
			}

			let titleEle = document.querySelector("#votetitle");
			if(isempty(titleEle,"제목을 입력해주세요.")) return; 
			if(isempty(limitdate ,"마감날짜를 입력해주세요.")) return; 
			
			document.vform.submit();
			
		} 
		let btn = document.querySelector("#submitbtn");
		btn.addEventListener("click",dchk);
		

		function remove_tr(obj) {
			if (document.getElementsByTagName("tr").length > 5) {
				document.getElementById('aricle').removeChild(
						obj.parentNode.parentNode);
				he = document.querySelector("body").offsetHeight;
				
				this.resizeTo(530,he+80);
			} else {
				alert("항목은 2개 이상 입력해야합니다.")
			}
			
		}

		function isempty(ele, msg) {
			if (ele.value === "") {
				alert(msg);
				return true;
			}
			return false;

		}
		
		let he = document.querySelector("body").offsetHeight;
		
		this.resizeTo(530,he+80);
	