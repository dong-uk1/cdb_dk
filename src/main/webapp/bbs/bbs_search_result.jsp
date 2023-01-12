<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		//alert('test...')
		$.ajax({
			url : "bbs_search_title", //views/bbsList.jsp가 결과!
			success : function(result) { //결과가 담겨진 table부분코드
				$('#d1').html(result)
			},
			error : function() {
				alert('실패.@@@')
			}
		})
		
	})
</script>
</head>
<body>

<div id = "d1"></div>
</body>
</html>