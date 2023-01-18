<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 된 리스트 불러올 jsp파일</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
			$.ajax({
				 url:"recruitList",
				data:{pageNum: 1},
				success: function(result) {
					$('#d1').html(result)
				} 
				
			})		
	})
</script>
</head>
<body>
<h3>임시메인</h3>
<!-- 	<a href="recruitList?pageNum=1">구직 리스트 보기</a> -->
	<a href="/">구직 리스트 보기</a>











</body>
</html>