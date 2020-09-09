var content1 = document.getElementById("content1");
var content2 = document.getElementById("content2");
var content2_5 = document.getElementById("modal_content2");
var content2_6 = document.getElementById("todocon");
var content3 = document.getElementById("content3");
var btn1 = document.getElementById("btn1");
var btn2 = document.getElementById("btn2");
var btn3 = document.getElementById("btn3");

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
	content3.style.transform = "translateX(1500px)";
	btn3.style.color = "#000";
}
function openMENU2(){
	content1.style.transform = "translateX(1500PX)";
	btn1.style.color = "#000";
	content2.style.transform = "translateX(0)";
	content2_6.style.transform = "translateX(0)";
	content2_5.style.display='block';
	btn2.style.color = "#4897b1";
	content3.style.transform = "translateX(1500px)";
	btn3.style.color = "#000";
}
function openMENU3(){
	content1.style.transform = "translateX(1500PX)";
	btn1.style.color = "#000";
	content2.style.transform = "translateX(1500px)";
	content2_6.style.transform = "translateX(1500px)";
	btn2.style.color = "#000";
	content2_5.style.display='none'
	content3.style.transform = "translateX(0)";
	btn3.style.color = "#4897b1";
}


