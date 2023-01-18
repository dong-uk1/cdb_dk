	//javascript
	// 회원 정보 수정 버튼
	function mem_update(){
		document.getElementById('memupdate').submit();  // form의 수정 기능 효과
	}
	// 회원 삭제 버튼
	function mem_delete(){
		document.getElementById('memdelete').submit();  // form의 삭제 기능 효과
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