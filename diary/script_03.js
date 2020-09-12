var content1 = document.getElementById("content1");
var content2 = document.getElementById("content2");
var content2_5 = document.getElementById("modal_content2");
var content2_6 = document.getElementById("todocon");
var btn1 = document.getElementById("btn1");
var btn2 = document.getElementById("btn2");

content2_5.style.display='none';
content2_6.style.transform = "translateX(1500px)";
content1.style.transform = "translateX(0)";

function openMENU1(){
	content1.style.transform = "translateX(0)";
	btn1.style.color = "#4897b1";
	content2.style.transform = "translateX(1500px)";
	content2_6.style.transform = "translateX(1500px)";
	content2_5.style.display='none';
	btn2.style.color = "#000";
}
function openMENU2(){
	content1.style.transform = "translateX(1500PX)";
	btn1.style.color = "#000";
	content2.style.transform = "translateX(0)";
	content2_6.style.transform = "translateX(0)";
	content2_5.style.display='block';
	btn2.style.color = "#4897b1";
}

function isSame() {
    var pw = document.ifw.password.value;
    var confirmPW = document.ifw.password2.value;
    if (pw.length < 4 || pw.length > 12) {
        window.alert('비밀번호는 4글자 이상, 12글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value=document.getElementById('pwc').value='';
        document.getElementById('same').innerHTML='';
    }
    if(document.getElementById('pw').value!='' && document.getElementById('pwc').value!='') {
        if(document.getElementById('pw').value==document.getElementById('pwc').value) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='blue';
            document.getElementById('same').style.fontSize = "10px";
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
            document.getElementById('same').style.fontSize = "10px";
        }
    }
}



