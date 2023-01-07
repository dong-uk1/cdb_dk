<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script>
	$(function() {
		$.ajax({
			url : "YpList",
			success : function(table) {
				$("result").html(table);
			} // success
		}); // ajax
	})
</script>
</head>
<body>
	<a href="selectOne" >생활복지</a> 정책참여 주거금융 창업지원 취업지원 코로나19
	<hr>
	<div id="result"></div>
</body>
</html>