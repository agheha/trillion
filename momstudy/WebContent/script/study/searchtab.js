// 선택된 주소 코드가 들어올 배열을 미리 선언
let codeArr = new Array();

let li = document.querySelectorAll(".active01");

for (let i = 0; i < li.length; i++) {
	li[i].addEventListener("click", (e) => {
		let add1 = e.target.innerText;
		let add2 = document.querySelector(".address2");
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					let loc = JSON.parse(xhr.responseText);
					let html = '';
					loc.forEach(sAddr => {
						html += `<li class="loc" id="loc${sAddr.addressCode}">${sAddr.addressDetail2}</li>`
					});
					add2.innerHTML = html
					let li2 = document.querySelectorAll(".loc");
					for(let i = 0; i < li2.length; i++) {
						li2[i].addEventListener("click", detailAddress);
					}
				}
			}
		}
		xhr.open("GET", "address.do?baddr=" + add1, true);
		xhr.send();
		return false;
	});
}



let result = document.getElementById("select-box");

function detailAddress(e) {
	// 이벤트 객체 - 상세주소
	let ele = e.target;
	// 상세주소 태그의 id
	let eid = ele.id;
	// 주소 코드
	let code = eid.substring(3);
	
	// 재실행 확인 
	let cflag = ele.getAttribute("clicked");
//	console.log("클릭했는지?", cflag);
	if(cflag) {
		// 이전에 클릭한 적이 있으면 clicked속성 지워주고 생성되어있는 태그 없애준다.
		ele.removeAttribute("clicked");
		deleteRegion(code);
		return;
	}
	
	// 클릭한 적 없다면 클릭 속성 추가 (재실행 방지 플래그)
	ele.setAttribute("clicked", "clicked");
	let xhr = new XMLHttpRequest();
//		console.log("eid",eid)
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let loc = JSON.parse(xhr.responseText);
				let html = result.innerHTML;
				html += `<span class="selected-add" id="det${code}" onClick="deleteRegion(${code});">${loc.addressDetail} ${loc.addressDetail2}</span>`;
				result.innerHTML = html;
			}
		}
	}
	xhr.open("GET", "selectedaddress.do?num=" + code, true);
	xhr.send();
	return false;
}

// 생성된 지역 삭제
function deleteRegion(code) {
	console.log("code", code);
	
	let targetNode = document.getElementById("det" + code);
	
	console.log("targetNode", targetNode);
	
	targetNode.parentNode.removeChild(targetNode);
}


let sub = document.querySelector("#sbtn");
sub.addEventListener("click", (e) => {
	let res = document.querySelectorAll(".selected-add");
	for (let i = 0; i < res.length; i++) {
		codeArr.push(res[i].id.substring(3));
	}
	// 혹시 모를 중복값을 제거해준다(버그 수정)
	let reArr = removeDupArray(codeArr);
	let act = document.getElementById("results");
	act.value = reArr.join(",");
	let addressInput = document.sForm.addressCode;
	console.log(addressInput);
	addressInput.value = act.value;
	console.log(addressInput.value);
	document.sForm.submit();
})


// 배열의 중복값 제거 함수
function removeDupArray(arr) {
    let tempArr = [];
    for (let i = 0; i < arr.length; i++) {
        if (tempArr.length == 0) {
            tempArr.push(arr[i]);
        } else {
            let duplicatesFlag = true;
            for (let j = 0; j < tempArr.length; j++) {
                if (tempArr[j] == arr[i]) {
                    duplicatesFlag = false;
                    break;
                }
            }
            if (duplicatesFlag) {
                tempArr.push(arr[i]);
            }
        }
    }
    return tempArr;
}

function openCity(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" act", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " act";
	}
