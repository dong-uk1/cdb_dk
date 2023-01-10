<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/menuCss.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


</head>
<body>
<h3>댓글 목록</h3>

<table class="table">
	<tr>
		<td>작성자</td>
		<td>내용</td>
		<td>게시물 번호</td>
	</tr>
	<c:forEach items="${list}" var="vo">
	<tr>
		<td>${vo.member_id}</td>
		<td>${vo.reply_contents}</td>
		<td>${vo.bbs_Id}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
