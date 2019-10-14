let msg = document.querySelector("#msg");
let blackmsg = document.querySelector("#blackmsg");

function login() {
	let email = document.querySelector("#id").value;
	let pass = document.querySelector("#pass").value;
    let xhr = new XMLHttpRequest();
    let f = document.lForm
    msg.style.display = "none";
    blackmsg.style.display = "none"
    xhr.onreadystatechange = e => {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let list = JSON.parse(xhr.responseText);
               
                if (list === null){
                    msg.style.display = "block";
                  console.log(list.type);
                  return;
                }
                else if (parseInt(list) === 0) {
                
                    blackmsg.style.display = "block";
                    return;
                 
                } /*else if(parseInt(list.type) === 2) {
                
                	location.href = "/momstudy/admin/reportuser.do"
                	return;
                }*/
                else {
                
                	location.href = "/momstudy/main.do"
                	return;
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