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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<div id="d1"></div>

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


	<div id="d2"><h3>댓글</h3></div>
	
	<form action="reply_insert">

		<span class="input-group-text">작성자</span> <input type="text"
			class="form-control input-sm" name="member_id"><br> <span
			class="input-group-text">내용</span> <input type="text"
			class="form-control" name="reply_contents"><br><input type="hidden"
			class="form-control" name="bbs_Id" value = "${vo.bbs_Id}"><br>

		<button type="submit" class="btn btn-secondary">댓글 작성</button>
	</form>
	
	<table class="table">
	<tr>
		<td>작성자</td>
		<td>내용</td>
		<td>댓글 삭제</td>
		
	
	</tr>
	<c:forEach items="${list}" var="vo2">
	<tr>
		<td>${vo2.member_id}</td>
		<td>${vo2.reply_contents}</td>	
		<td><a href="${path}/cdb/bbs/reply_del?reply_id=${vo2.reply_id}" ><button>삭제</button></a></td>	
	</tr>
	</c:forEach>
	</table>






	<form action="reply_del">
		<span class="input-group-text">삭제할 댓글 번호</span> <input type="text"
			class="form-control" name="reply_id"><br>
		<button>댓글 삭제</button>
	</form>

	<a href="/cdb/bbs/bbs_main.jsp"><button>목록으로</button></a>
</body>
</html>