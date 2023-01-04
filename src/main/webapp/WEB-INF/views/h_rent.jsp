<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청  다  방</title>
</head>
<body>
<jsp:include page="header.jsp" />
<img src="../resources/img/map2.png" width=500 height=700> <br>
<c:forEach var="vo" items="${list}">
${vo.br_pbid} <br>
${vo.br_housesn} <br>
${vo.br_suplyhoco} <br>
${vo.br_suplyint} <br>
${vo.br_recrude } <br>
${vo.br_winannde} <br>
${vo.br_url } <br>
${vo.br_fulladdr} <br>
${vo.br_totalhshold } <br>
${vo.br_sumsuplyco } <br>
${vo.br_rentgtn } <br>
${vo.br_entity } <br>
${vo.br_prtpay } <br>
${vo.br_surlus } <br>
${vo.br_monthrent } <br>
${vo.br_beginde } <br>
${vo.br_end }<br>
${vo.br_refrnc } <br>
${vo.br_brtc } <br>
${vo.br_signgu } <br>
<hr>
</c:forEach>
<jsp:include page="footer.jsp" />
</body>
</html>