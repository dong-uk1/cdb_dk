<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table">
	<tr>
		<td>검색결과</td>
	
	</tr>
	<c:forEach items="${list}" var="one">
	<tr>
		<td>${one.bbs_contents}</td>
		<td>${one.filtertext}</td>

	</tr>
	</c:forEach>
</table>
