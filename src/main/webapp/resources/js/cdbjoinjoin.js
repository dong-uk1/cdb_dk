	// javascript start
	// 가입 조건 확인용 전역변수 설정
	idc = 0; // 아이디 양식 확인
	pwc = 0; // 비밀번호 확인
	pwi = 0; // 비밀번호 양식 확인
	idd = 0; // 아이디 중복 확인
	// 아이디 양식 확인
	function idcheck() {
		id = document.getElementById("id").value;
		if (id.length >= 4) {
			resultid = '4글자 이상입니다. 유효합니다';
			idc = 1; // 아이디 확인이 되고 유효하면 1로 설정
		} else {
			resultid = '4글자 미만입니다. 재입력 해주세요';
			idc = 0;
		}
		idinput.innerHTML = resultid;
	}
	// 비밀번호 일치 확인
	function pwcheck2() {
		pw = document.getElementById("pw").value;
		//pwc = 0;
		pwcheck = document.getElementById("pwcheck").value;
		if (pw == pwcheck) {
			resultpw = '비밀번호가 일치 합니다.';
			pwc = 1; // 비밀번호 일치하면 1로 설정해줌
		} else {
			resultpw = '비밀번호가 불일치 합니다. 비밀번호를 확인해 주세요';
			pwc = 0;
		}
		pwdcheck.innerHTML = resultpw;
	}
	// 비밀번호 입력 확인
	function pwic(){
		pw = document.getElementById("pw").value;
		if(pw.length >= 4){
			resultpwi = '비밀번호 입력 완료';
			pwi = 1; // 비밀번호가 4자리 이상이면 1로 설정해줌
		} else{
			resultpwi = '비밀번호가 너무 짧습니다. 4자 이상으로 입력 해주세요';
			pwi = 0; // 비밀번호가 너무 짧으므로 0으로 설정함
		}
		pwdinput.innerHTML = resultpwi;
	}
	// 가입 조건 확인
	function joincomplete2(){
		if(idc == 1 && pwc == 1 && pwi == 1 && idd == 1){//가입 조건 모두 and 조건으로 맞아야 함
			document.getElementById('memjoin').submit();  // form의 검색버튼 누른 효과
		} else{
			alert('필수 확인 정보를 다시 확인하세요');
		}
	}
	// API 이용 도로명 주소 검색
	function address() {
    	new daum.Postcode({
        	oncomplete: function(data) {
        		var roadAddr = data.roadAddress;
                document.getElementById('roadaddr').value = roadAddr;
                if(roadAddr !== ''){
                    document.getElementById("roadaddr").value = roadAddr;
                }
        	}
    	}).open();
    }
	// 도로명 + 상세 주소 합쳐서 입력
	function addrinput(){
		addr1 = document.getElementById("roadaddr").value;
		addr2 = document.getElementById("detailaddr").value;
		addr = addr1 + ' ' + addr2;
		document.getElementById("home").value = addr;
	}
	// javascript end