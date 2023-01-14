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
<h3>전체 게시물</h3>

<table class="table">
	<tr>

		<td>제목</td>
		<td>작성자</td>
		<td>내용</td>
		<td>이미지</td>
	</tr>
	<c:forEach items="${list}" var="vo">
	<tr>

		<td><a href="${path}/cdb/bbs/bbs_contents?bbs_Id=${vo.bbs_Id}"> ${vo.bbs_title} </a></td>
		<td>${vo.member_id}</td>
		<td>${vo.bbs_contents}</td>
		<td>${vo.bbs_img}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
