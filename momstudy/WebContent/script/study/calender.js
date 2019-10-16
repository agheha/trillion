let yearEle = document.querySelector(".year");
let monthEle = document.querySelector(".month");
let prevbtn = document.querySelector("#prevbtn");
let nextbtn = document.querySelector("#nextbtn");
let ctmenu = document.querySelector(".ctmenu");
let sdmenu = document.querySelector(".sdmenu");
let createSd = document.querySelector("#createSd");
let deleteSd = document.querySelector("#deleteSd");
let modifySd = document.querySelector("#modifySd");
let mindate = document.querySelector(".day:first-child");
let maxdate = document.querySelector(".day:last-of-type");
let daysEle = document.querySelector(".days");
daysEle.style.gridTemplateRows = `88px 88px 88px 88px 88px 88px`;
let daysPx = [88, 88, 88, 88, 88, 88];
let sdEle;
for (let i = 0; i < 7; i++) {
	let row = document.querySelectorAll(`.day:nth-child(7n+${i})`)
	row.forEach((ele) => {
		ele.style.gridColumn = i;
		if (i === 0) ele.style.gridColumn = 7;
		if (i === 1) ele.style.color = 'red';
	})
}

for (let i = 1; i < 7; i++) {
	let row = document.querySelectorAll(`.day:nth-child(n + ${i * 7 - 6}):nth-child(-n+ ${i * 7})`)
	row.forEach((ele) => {
		ele.style.gridRow = i;
	})
}



prevbtn.addEventListener("click", prev);
nextbtn.addEventListener("click", next);
submitbtn.addEventListener("click", () => {
	sendSd(1)
});

// 우클릭이벤트
document.querySelector(".bigcal").addEventListener('contextmenu', function (e) {
	if (e.target.className === "schedule") {
		sdEle = e.target;
		ctmenu.classList.remove("rightclick");
		sdmenu.classList.remove("rightclick");
		sdmenu.classList.add("rightclick");
		sdmenu.style.top = e.pageY + "px";
		sdmenu.style.left = e.pageX + "px";
		deleteSd.onclick = deleteCalender;
		//수정창 띄우기
		modifySd.onclick = () => {
			sdmenu.classList.remove("rightclick");
			promise1().then((result) => {
				if (result === '1') {
					submitbtn.style.display = "none";
					let msubmitbtn = document.querySelector("#msubmitbtn")
					msubmitbtn.style.display = "block";
					msubmitbtn.addEventListener('click', () => {
						sendSd(2);
					});
					selectResultForUpdate();
					onClickModalforCreate(e);
				} else {
					alert("작성자만 수정할 수 있습니다.")
				}
			})
		}
		e.preventDefault();
	} else {
		sdmenu.classList.remove("rightclick");
		ctmenu.classList.remove("rightclick");
		ctmenu.classList.add("rightclick");
		ctmenu.style.top = e.pageY + "px";
		ctmenu.style.left = e.pageX + "px";
		e.preventDefault();
	}
})
// 우클릭이벤트 우클릭후 다른곳 좌클릭
document.querySelector(".bigcal").addEventListener('click', function (e) {
	ctmenu.classList.remove("rightclick");
	sdmenu.classList.remove("rightclick");
})
// 등록창 띄우기
createSd.addEventListener("click", () => {
	document.querySelector("#msubmitbtn").style.display = "none";
	submitbtn.style.display = "block";
	onClickModalforCreate();
});

// 화면 갱신
function loading(month, year) {
	removeSd();
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				let obj = JSON.parse(xhr.responseText);
				let days = document.querySelectorAll(".day");
				//일자 넣기
				days.forEach((day, i) => {
					day.style.background = "#fff";
					let dates = obj.dates[i]
					if(parseInt(dates.substr(4, 2)) !== month){
						day.style.background = "#f6f6f6";
					}
					let date = dates.substr(6, 2);
					day.innerText = date;
					day.setAttribute("dates", dates);
				});
				mindateVal = mindate.getAttribute("dates");
				maxdateVal = maxdate.getAttribute("dates");
				let gridArea;
				let srow, scol, erow, ecol;
				let locations = new Array;
				obj.list.forEach(cal => {
					// 시작과 끝이 달력을 넘어갈 때 정해줌
					if (cal.startDate < mindateVal) {
						gridArea = mindate.style.gridArea.substr(0, 5).replace("/", "").replace(" ", "").split(" ")
						srow = gridArea[0];
						scol = gridArea[1];
					}

					if (cal.endDate > maxdateVal) {
						gridArea = maxdate.style.gridArea.substr(0, 5).replace("/", "").replace(" ", "").split(" ")
						erow = gridArea[0];
						ecol = gridArea[1];
					}

					// 그게 아니면 시작과 끝을 돌면서 시작과 끝을 정함
					days.forEach((day, i) => {
						let dayDateVal = day.getAttribute("dates");

						if (cal.startDate === dayDateVal) {
							gridArea = day.style.gridArea.substr(0, 5).replace("/", "").replace(" ", "").split(" ")
							srow = gridArea[0];
							scol = gridArea[1];
						}

						if (cal.endDate === dayDateVal) {
							gridArea = day.style.gridArea.substr(0, 5).replace("/", "").replace(" ", "").split(" ")
							erow = gridArea[0];
							ecol = gridArea[1];
						}
					});

					// 속성 설정
					let backgroundCode = cal.barColor;
					let fontCode = cal.fontColor;
					let sdlist = new Array;
					let location = new Array;
					let layers = new Array;
					// 다 정했으면 컬럼과 로우를 가지고 세션을 만들고 세션의 속성에 넣어줌
					for (let i = parseInt(srow); i <= erow; i++) {
						let thisrow = i;
						// 초기값 설정
						let setscol = 1;
						let setecol = 8;
						// 자리 지정
						if (i === parseInt(srow)) setscol = parseInt(scol);
						if (i === parseInt(erow)) setecol = parseInt(ecol) + 1;

						// 요소 생성 및 속성 지정
						let sd = document.createElement("section");
						sd.style.gridArea = `${i} / ${setscol} / auto / ${setecol}`;
						sd.style.background = backgroundCode;
						sd.style.color = fontCode;
						sd.classList.add("schedule");
						sd.innerText = cal.title;
						sdlist.push(sd);
						sd.setAttribute("num", cal.num);
						sd.addEventListener("click", (e) => {
							selectResult(e.target.getAttribute("num"));
							onClickModalforDetail();
						});

						// 높이 구하기
						// 각 섹션의 위치 정보가 담긴 객체가 담긴 하나의 작업에 대한 위치 정보인 locations에 각 섹션의 위치와 높이를 꺼내서
						// 같은 행이면 그 섹션의 레이어를 중복검사 하고 레이어 배열에 넣는다.

						for (let i = 0; i < locations.length; i++) {
							locations[i][0].forEach((ele) => {
								let prevScol = ele.setscol;
								let prevEcol = ele.setecol;
								let prevRow = ele.thisrow;
								if (prevRow === thisrow && !(setscol >= prevEcol || setecol <= prevScol)) {
									console.log(layers.includes(locations[i][1]));
									if (layers.includes(locations[i][1]) === false) {
										layers.push(locations[i][1]);
									}
								}
							})
						}
						// 위치값 저장
						location.push({ thisrow, setscol, setecol });
					}

					//레이어 배열의 길이가 0이면 중복된 레이어가 없으므로 정렬을 하지 않는다.
					if (layers.length > 0) {
						layers.sort(function (a, b) {
							return a - b;
						});
					}

					//기본 레이어를 1로 설정한다
					let layer = 1;

					//레이어 배열을 반복하면서 기본 레이어와 비교 빈자리를 찾는다. 빈 자리가 없을 시엔 레이어의 값이 최대값 보다 1 증가한다. 
					layers.forEach((ele) => {
						if (layer === ele) layer++;
					})

					locations.push([location, layer]);


					// 높이값을 설정하면서 만약 레이어가 3개가 초과하면 행의 높이를 늘린다
					sdlist.forEach((ele) => {
						daysEle.append(ele);
						let i = ele.style.gridArea.substr(0, 1);
						ele.style.top = layer * 22 + "px";

						if (layer * 22 > 66 && daysPx[i - 1] < (layer + 1) * 22) {
							let gtr = "";
							daysPx[i - 1] = (layer + 1) * 22;
							for (let i = 0; i < daysPx.length; i++) {
								gtr += daysPx[i] + "px" + " ";
							}
							daysEle.style.gridTemplateRows = gtr;
						}
					})

				})
			}
		}
	}

	xhr.open("GET", `/momstudy/study/calender.do?year=${year}&month=${month}`, true);
	xhr.send();
}
// 전달로 갱신
function prev() {
	let month = parseInt(monthEle.innerText);
	let year = parseInt(yearEle.innerText);
	if (month != 1) {
		month = month - 1;
		monthEle.innerText = month + "월"
	} else {
		month = 12;
		monthEle.innerText = month + "월"
		year = year - 1;
		yearEle.innerText = year + "년";
	}
	loading(month, year);
}
// 다음달로 갱신
function next() {
	let month = parseInt(monthEle.innerText);
	let year = parseInt(yearEle.innerText);
	if (month != 12) {
		month = month + 1;
		monthEle.innerText = month + "월"
	} else {
		month = 1;
		year = year + 1;
		monthEle.innerText = month + "월"
		yearEle.innerText = year + "년";
	}
	loading(month, year);
}
// 첫 로딩
function first() {
	let month = parseInt(monthEle.innerText);
	let year = parseInt(yearEle.innerText);
	loading(month, year);
}

first();

// 데이터 보내기
function sendSd(type) {
	if (nullchk() === false) return;
	let action;
	let num = "";
	if (type === 1) {
		action = 'insertschedual.do';
	} else {
		action = 'updateschedual.do';
		num = sdEle.getAttribute("num");
	}

	let startdateVal = startdate.value;
	let limitdateVal = limitdate.value;
	let caltitleVal = caltitle.value;
	let calcontentVal = calcontent.value;
	let barcolorVal = barcolor.value + "";
	let fontcolorVal = fontcolor.value + "";
	let caltype = 1;
	if (document.querySelector("#study").checked === false) caltype = 2;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				alert("등록되었습니다.");
				closeModalForCreate();
				startdate.value = null;
				limitdate.value = null;
				caltitle.value = null;
				calcontent.value = null;
				barcolor.value = '#000000';
				fontcolor.value = '#000000';
				first();
			}
		}
	}
	xhr.open("POST", `/momstudy/study/${action}`, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.send(`start=${startdateVal}&end=${limitdateVal}&title=${caltitleVal}&content=${calcontentVal}&caltype=${caltype}&barcolor=${barcolorVal}&fontcolor=${fontcolorVal}&num=${num}`);
}

// 스케쥴 초기화
function removeSd() {
	let sds = document.querySelectorAll(".schedule");
	sds.forEach((ele) => {
		ele.remove();
	})
	daysEle.style.gridTemplateRows = `88px 88px 88px 88px 88px 88px`;
}
// 스케쥴 삭제
function deleteCalender() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				console.log(typeof (xhr.responseText));
				if (xhr.responseText.trim() === '1') {
					alert("삭제되었습니다.");
					sdmenu.classList.remove("rightclick");
					first();
				} else {
					alert("작성자만 삭제할 수 있습니다.");
					sdmenu.classList.remove("rightclick");
				}
			}
		}
	}
	xhr.open("POST", `/momstudy/study/deleteschedule.do`, true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.send("num=" + sdEle.getAttribute("num"));
}

let promise1 = function () {
	return new Promise(function (resolve, reject) {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					resolve(xhr.responseText.trim());
				}
			}
		}
		xhr.open("POST", `/momstudy/study/checkschedule.do`, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		xhr.send("num=" + sdEle.getAttribute("num"));

	})
}





