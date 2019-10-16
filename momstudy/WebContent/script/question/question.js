let formMain = document.querySelector("#form-main");
window.onclick = function(e) {
    if (e.target == formMain) {formMain.style.display = "none";}
}
let wrtbtn = document.querySelector("#wrtbtn");
wrtbtn.addEventListener("click", e=> {
	formMain.style.display = "block";
	let title = document.querySelector("#email").value;
	let content = document.querySelector("#comment").value;
	title="";
	content="";
})
let btnblue = document.querySelector("#button-blue");

		btnblue.addEventListener("click", () =>{
			let title = document.querySelector("#email").value;
			let content = document.querySelector("#comment").value;
			let formd = document.querySelector("#form-div");
			let xhr = new XMLHttpRequest()
			xhr.onreadystatechange = () => {
				if (xhr.readyState === 4){
					if (xhr.status === 200) {
						formd.innerHTML = "<div class='feedback' style='color:white'>글이 정상적으로 등록되었습니다.</div>"
						setTimeout(() => {
							location.href="/momstudy/question/questionform.do"
						}, 1000);
					}
				}
			}
			xhr.open("GET",  `/momstudy/question/questionwrite.do?title=${title}&content=${content}`)
			xhr.send();
			
		})

//$(document).ready(function() {
//
//    var table = $('#table');
//
//    // Table bordered
//    $('#table-bordered').change(function() {
//        var value = $( this ).val();
//        table.removeClass('table-bordered').addClass(value);
//    });
//
//    // Table striped
//    $('#table-striped').change(function() {
//        var value = $( this ).val();
//        table.removeClass('table-striped').addClass(value);
//    });
//  
//    // Table hover
//    $('#table-hover').change(function() {
//        var value = $( this ).val();
//        table.removeClass('table-hover').addClass(value);
//    });
//
//    // Table color
//    $('#table-color').change(function() {
//        var value = $(this).val();
//        table.removeClass(/^table-mc-/).addClass(value);
//    });
//});

//(function(removeClass) {
//
//	jQuery.fn.removeClass = function( value ) {
//		if ( value && typeof value.test === "function" ) {
//			for ( var i = 0, l = this.length; i < l; i++ ) {
//				var elem = this[i];
//				if ( elem.nodeType === 1 && elem.className ) {
//					var classNames = elem.className.split( /\s+/ );
//
//					for ( var n = classNames.length; n--; ) {
//						if ( value.test(classNames[n]) ) {
//							classNames.splice(n, 1);
//						}
//					}
//					elem.className = jQuery.trim( classNames.join(" ") );
//				}
//			}
//		} else {
//			removeClass.call(this, value);
//		}
//		return this;
//	}
//
//})(jQuery.fn.removeClass);