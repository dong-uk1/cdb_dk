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
<script type="text/javascript">
$(function() {
		//alert('test...')

		$('#b1').click(function() {
			$.ajax({
				url : "reply_list",
				success : function(result) {
					$('#d2').html(result)
				},
				error : function() {
					alert('실패')
				}
			})
		}) //b1
	})
</script>
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

	<form action="reply_list">
		<p>
		<input type="hidden" name="bbs_Id" value="${vo.bbs_Id}">
			<button id="b1">댓글 보기</button>
		</p>
	</form>
	<div id="d2"></div>
	
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



	<form action="reply_insert">

		<span class="input-group-text">작성자</span> <input type="text"
			class="form-control input-sm" name="member_id"><br> <span
			class="input-group-text">내용</span> <input type="text"
			class="form-control" name="reply_contents"><br> <span
			class="input-group-text">본 게시물</span> <input type="text"
			class="form-control" name="bbs_Id"><br>

		<button type="submit" class="btn btn-secondary">댓글 작성</button>
	</form>


	<form action="reply_del">
		<span class="input-group-text">삭제할 댓글 번호</span> <input type="text"
			class="form-control" name="reply_id"><br>
		<button>댓글 삭제</button>
	</form>

	<a href="/cdb/bbs/bbs_main.jsp"><button>목록으로</button></a>
</body>
</html>