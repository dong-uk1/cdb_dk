<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/menuCss.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>


</head>
<body>
	<table class="table">
		<tr>
			<td>제목 : ${vo.bbs_title}</td>
		</tr>

		<tr>
			<td>작성자 :${vo.member_id}</td>
		</tr>
		<tr>
			<td>내용</td>
		</tr>
		<tr>
			<td>${vo.bbs_contents}</td>
			<td>${vo.bbs_img}</td>
		</tr>

	</table>
</body>
</html>