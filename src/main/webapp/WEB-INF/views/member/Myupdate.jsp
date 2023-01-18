<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
수정된 내 정보입니다<br>
1. id : ${vo.member_id}<br>
2. pw : ${vo.member_pw}<br>
3. name : ${vo.member_name}<br>
4. home : ${vo.member_home}<br>
5. birth : ${vo.member_birth}<br>
6. gen : ${vo.member_gen}<br>
7. tel : ${vo.member_tel}<br>
회원 정보 수정 완료
<a href="MyPage.jsp"><button style="background: #3498DB; color: white;">마이페이지로 돌아가기</button></a>
</body>
</html>