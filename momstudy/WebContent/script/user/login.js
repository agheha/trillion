let msg = document.querySelector("#msg");
let blackmsg = document.querySelector("#blackmsg");

function login() {
	let email = document.querySelector("#id").value;
	let pass = document.querySelector("#pass").value;
    let xhr = new XMLHttpRequest();
    let f = document.lForm
    msg.style.opacity = 0;
    blackmsg.style.opacity = 0;
    xhr.onreadystatechange = e => {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let list = JSON.parse(xhr.responseText);
                if (list == null){
                    msg.style.opacity = 1;
                    return false
                }
                else if (parseInt(list.status) === 2) {
                    blackmsg.style.opacity = 1;
                    return false
                } 
                else {
                	location.href = "/momstudy/main.do"
                }	
                email="";
                pass="";
            }
        }
    }
    xhr.open("POST", "login.do");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send(`email=${email}&pass=${pass}`);
    
}

document.querySelector("#sbtn").addEventListener("click",login);
document.addEventListener("keydown",e => {
	  if(e.keyCode === 13){
		 login();
	  }
})