<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "bbsList",
			success : function(result) {
				$('#d1').html(result)
			},
			error : function() {
				alert('실패')
			}
		})
		$.ajax({
			url : "newsList",
			success : function(result) {
				$('#d2').html(result)
			},
			error : function() {
				alert('실패')
			}
		})
		
		$.ajax({
			url : "ypList",
			success : function(result) {
				$('#d3').html(result)
			},
			error : function() {
				alert('실패')
			}
		})
	})
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">

			<form id="searchform">
				<div class="search-wrap">
					<input name="filtertext" type="text"> 
					<select name="filter">
						<option value="bbs">게시물</option>
						<option value="news">뉴스</option>
					</select>
				</div>
			</form>
			<button onclick="go_search()">검색</button>
			<script>
			function go_search() {
				var filtervar = $("select[name='filter'] option:selected").text();
				var url = ""
				console.log(filtervar);
				if (filtervar == "게시물") {
					url = "bbsfilter"
						console.log('test1');
				} else if (filtervar == "뉴스") {
					url = "newsfilter"
				}
				$("#searchform").attr("action", url).submit();
				
			}
			</script>
		</div>
		<div id="nav">
			
		</div>
		<div id="section">
			<hr>
			<div id="content_news">
				<div id="d1"></div>
				<hr>
				<div id="d2"></div>
			</div>
			<div id="content_calendar"></div>
		</div>
	</div>
<hr>
	<div id="content-policy">
	<div id="d3"></div>
	</div>
	<hr>
	<div id="footer">
	배너
	</div>
</body>


</html>