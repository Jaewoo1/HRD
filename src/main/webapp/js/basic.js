function inputCheck(){
	
	let fr=document.mInform;
	console.log(fr.custname.value);
	// let custname=document.querySelector('[name=custname]').value;
	if(fr.custno.value==''){
		// custno 데이터가 없으면
		alert("회원번호가 입력되지 않았습니다.");
		fr.custno.focus();
		return false;
	}
	if(fr.custname.value==''){
		// custname 데이터가 없으면
		alert("회원이름이 입력되지 않았습니다.");
		fr.custname.focus();
		return false;
	}
	if(fr.phone.value==''){
		// phone 데이터가 없으면
		alert("회원전화가 입력되지 않았습니다.");
		fr.phone.focus();
		return false;
	}
	if(fr.address.value==''){
		// address 데이터가 없으면
		alert("회원주소가 입력되지 않았습니다.");
		fr.address.focus();
		return false;
	}
	if(fr.joindate.value==''){
		// joindate 데이터가 없으면
		alert("가입일자가 입력되지 않았습니다.");
		fr.joindate.focus();
		return false;
	}
	if(fr.custname.value==''){
		// custno 데이터가 없으면
		alert("회원이름이 입력되지 않았습니다.");
		fr.custname.focus();
		return false;
	}
	if(fr.city.value==''){
		// city 데이터가 없으면
		alert("도시코드가 입력되지 않았습니다.");
		fr.city.focus();
		return false;
	}
	
	alert('회원등록이 완료되었습니다.');
	return true;
}

function search(){
	window.location.href="listSelectUpdate.jsp";
}