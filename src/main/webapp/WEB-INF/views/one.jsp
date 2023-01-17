<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a{text-decoration: none;
color: #444;}
</style>
<title>Insert title here</title>
</head>
<body>
<c:forEach var="vo" items='${list}'>
구인인증번호: ${vo.job_wantedAuthNo}
<hr>
채용제목:${vo.job_title}<br>
회사명: ${ vo.job_company }<br>
<button>스크랩</button>
<hr>
채용제목:${vo.job_title}<br>
회사명: ${ vo.job_company }<br>
근무형태: ${ vo.job_holidayTpNm }<br>
임금형태: ${ vo.job_salTpNm }<br>
급여: ${ vo.job_sal }<br>
최소임금액: ${ vo.job_minSal }<br>
최대임금액: ${ vo.job_maxSal }<br>
근무지역: ${ vo.job_region }<br>
<hr>
경력: ${ vo.job_career }<br>
우대조건: ${ vo.job_prefCd }<br>
최소학력: ${ vo.job_minEdubg }<br>
등록일자: ${ vo.job_regDt }<br>
마감일자: ${ vo.job_closeDt }<br>
근무지 우편번호: ${ vo.job_zipCd }<br>
근무지 도로명주소: ${ vo.job_strtnmCd }<br>
근무지 기본주소: ${ vo.job_basicAddr }<br><br><br>
<button><a href="${ vo.job_wantedInfoUrl }">워크넷</a></button> 
<button><a href="${ vo.job_wantedMobileInfoUrl }">워크넷모바일</a></button><br>
</c:forEach>
</body>
</html>