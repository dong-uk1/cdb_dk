<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원 가입된 정보입니다<br><!-- EL(Expression Language)표현용 언어 -->
1. id : ${vo.member_id}<br>
2. pw : ${vo.member_pw}<br>
3. name : ${vo.member_name}<br>
4. home : ${vo.member_home}<br>
5. birth : ${vo.member_birth}<br>
6. gen : ${vo.member_gen}<br>
7. tel : ${vo.member_tel}<br>
회원가입이 완료되었습니다<br>

</body>
</html>