<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reply_insert">

		<span class="input-group-text">작성자</span> <input type="text"
			class="form-control input-sm" name="member_id"><br> <span
			class="input-group-text">내용</span> <input type="text"
			class="form-control" name="reply_contents"><br> <span
			class="input-group-text">본 게시물</span> <input type="text"
			class="form-control" name="bbs_Id"><br> 

		<button type="submit" class="btn btn-secondary">댓글 작성</button>
	</form>

</body>
</html>