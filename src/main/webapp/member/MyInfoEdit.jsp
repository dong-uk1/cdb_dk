<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정 화면</title>
<link rel="stylesheet" href="../resources/css/cdbmanage.css">
<style type="text/css">
#pwdcheck{
	font-size: 12px;
	color: red;
}
</style>
<script src="../resources/js/cdbedit.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	// 비밀 번호 변경
 	pwc = 0;
	function pwupdate(){
		if(document.getElementById('pw0').value == '${member_pw}'){
			if(pwc == 1){//가입 조건 모두 and 조건으로 맞아야 함
				document.getElementById('pweditedit').submit();
			} else{
				resultpwpw = '새 비밀번호로 변경 시 비밀번호 확인은 필수 입니다';
				pwdcheck.innerHTML = resultpwpw;
			}
		}else{
			resultpwpw = "기존의 패스워드와 일치하지 않습니다";
			pwdcheck.innerHTML = resultpwpw;
		}
	}
	function pwcheck2() {
		pw = document.getElementById("pw").value;
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
	
</script>
</head>
<body>
	<div class="header">
		<h2>내 정보 수정하기</h2>
	</div>
	<div class="main">
		<form id="memupdate" action="Myupdate">
		<input type="hidden" name="member_id" value="${member_id}">
			<table>
				<tr align="center" style="font-size: 30px">
					<td colspan="2">내 정보 수정하기 id = ${member_id}</td>
				</tr>
				<tr>
					<td>이름</td>
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
					<td>거주지</td>
					<td>: <input type="text" id="home" name="member_home" placeholder="주소 입력 버튼으로 주소를 입력하세요" readonly>&nbsp;<button type ="button" onclick="addrinput()">주소 입력</button></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>: <input type="date" name="member_birth" id="birth"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>: <select id="gen" name="member_gen">
							<option value="남자">남자
							<option value="여자">여자
					</select>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>: <input type="text" name="member_tel" id="tel"></td>
				</tr>
			</table>
			<br>
			<div class="CRUD">
				<button class="button_CRUD" id="update_member" onclick="mem_update()">정보 수정</button>
			</div>
		</form>
		<br>
		<form id="pweditedit" action="PwEdit">
		<input type="hidden" name="member_id" value="${member_id}">
		<table>
			<tr align="center" style="font-size: 30px">
				<td colspan="2">비밀번호 변경</td>
			</tr>
			<tr>
				<td>현재 비밀번호</td>
				<td>: <input type="text" name="member_pw0" id="pw0"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>: <input type="text" name="member_pw1" id="pw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td>: <input type="text" name="member_pw" id="pwcheck">&nbsp;<button type ="button" onclick="pwcheck2()">비밀번호 확인</button></td>
			</tr>
			<tr>
				<td colspan="2"><div id="pwdcheck">비밀번호 변경 시 재확인은 '필수' 입니다</div></td>
			</tr>
		</table>
			<div class="CRUD">
				<button type="button" class="button_CRUD" id="pwup" onclick="pwupdate()" style="width: 300px;">비밀번호 변경</button>
			</div>
		</form>
		<br>
		<form id="memdelete" action="Mydelete">
			<div class="delete">
				<table>
					<tr align="center" style="font-size: 30px">
						<td colspan="2">회원 탈퇴 하기 id = ${member_id}</td>
					</tr>
					<tr>
						<td><input type="hidden" name="member_id" value="${member_id}">
					</tr>
				</table>
				<br>
				<div class="CRUD">
					<button class="button_CRUD" id="delete_member" onclick="mem_delete()">회원 탈퇴</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>