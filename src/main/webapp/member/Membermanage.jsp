<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 관리 페이지</title>
<link rel="stylesheet" href="../resources/css/cdbmanage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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
	// 아이디 검색
	function idsearch(){
		id = prompt("검색할 아이디를 입력하세요");
		//db로 id값을 sql문에 넣어서 보내기 - mapper sql 작성 완료 - dao에 메서드통해 컨트롤러로 전송
		//db에서 다시 결과 갖고오고 내용을 팝업창을 띄운 후 리스트로 출력
		//팝업창에서 id 클릭시 id 및 해당 정보들을 input창에 가져오기
		//수정하면 내용 수정후 수정 버튼 눌러 수정 과정 마무리
		//삭제는 id만 가져오면 됨
		//계획은 function idsearch는 아이디를 리스트로 가져오고 선택할 수 있게만 만들고
		//ajax로 input창에 가져오게끔 구현하고 싶음
		
	}
	//javascript end
	//jquery start
	$(function(){
		$('#search1').click(function(){
			url : 'idsearch',
			idValue = prompt("검색할 아이디를 입력하세요")
			data : {
				member_id : idValue
			},
			success : function(x){
				$('#id').html(x),
				$('#pw').html(x),
				$('#name').html(x),
				$('#home').html(x),
				$('#birth').html(x),
				$('#gen').html(x),
				$('#tel').html(x)
			}
			idValue = $('#id').val()
		})//search1 end
	})//function end
	// jquery end
</script>
</head>
<body>
	<div class="header">
		<h2>청다방 회원 관리 - 관리자</h2>
	</div>
	<div class="main">
		<form id="memupdate" action="memupdate">
			<table>
				<tr align="center" style="font-size: 30px">
					<td colspan="2">회원 정보 수정 하기</td>
				</tr>
				<tr>
					<td>수정할 회원의 id</td>
					<td>: <input type="text" name="member_id" id="id">&nbsp;<button type="button" id="search1">아이디 검색</button></td>
				</tr>
				<tr>
					<td>pw</td>
					<td>: <input type="text" name="member_pw" id="pw"></td>
				</tr>
				<tr>
					<td>name</td>
					<td>: <input type="text" name="member_name" id="name"></td>
				</tr>
				<tr> 
					<td><button type ="button" onclick="address()">주소 검색하기</button></td>
					<td>&nbsp;&nbsp;<input type="text" id="roadaddr" name="roadaddress" placeholder="도로명 주소(수정시 주소 검색하기 사용)" readonly></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;&nbsp;<input type="text" id="detailaddr" name="detailedaddress" placeholder="상세 주소(수정시 이곳에 직접 입력)"></td>
				</tr>
				<tr>
					<td>home</td>
					<td>: <input type="text" id="home" name="member_home" placeholder="주소 입력 버튼으로 주소를 입력하세요" readonly>&nbsp;<button type ="button" onclick="addrinput()">주소 입력</button></td>
				</tr>
				<tr>
					<td>birth</td>
					<td>: <input type="date" name="member_birth" id="birth"></td>
				</tr>
				<tr>
					<td>gen</td>
					<td>: <select id="gen" name="member_gen">
							<option value="남자">남자
							<option value="여자">여자
					</select>
					</td>
				</tr>
				<tr>
					<td>tel</td>
					<td>: <input type="text" name="member_tel" id="tel"></td>
				</tr>
			</table>
			<br>
			<div class="CRUD">
				<button class="button_CRUD" id="update_member" onclick="mem_update()">정보 수정</button>
			</div>
		</form>
		<br>
		<form id="memdelete" action="memdelete">
			<div class="delete">
				<table>
					<tr align="center" style="font-size: 30px">
						<td colspan="2">회원 삭제 하기</td>
					</tr>
					<tr>
						<td>삭제할 회원의 id</td>
						<td>: <input type="text" name="member_id" id="delete_id"> <button type="button" id="search2">아이디 검색</button></td>
					</tr>
				</table>
				<br>
				<div class="CRUD">
					<button class="button_CRUD" id="delete_member" onclick="mem_delete()">회원 삭제</button>
				</div>
			</div>
		</form>
		<br>
		사용 방법 : 아이디 검색하기 버튼을 이용해서 아이디를 창에 입력하고 수정이나 삭제 버튼을 눌러 사용합니다
	</div>
</body>
</html>