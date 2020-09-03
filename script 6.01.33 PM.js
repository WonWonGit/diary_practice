	
function check(){
	if(document.reg.id.value.length==0){
		alert("아이디를 써주세요");
		reg.id.focus();
		return;
	}
	if(document.reg.id.value.length<4){
		alert("아이디는 4글자 이상이여야 합니다.");
		reg.id.focus();
		return;
	}
	if(document.reg.password.value.length==0){
		alert("패스워드는 반드시 입력해야 합니다.");
		reg.password.focus();
		return;
	}
	if(document.reg.password.value != document.reg.passwordcheck.value){
		alert("패스워드가 일치하지 않습니다.");
		reg.password.focus();
		return;
	}
	if(document.reg.name.value.length==0){
		alert("이름을 써주세요");
		reg.name.focus();
		return;
	}
	document.reg.submit();
}
