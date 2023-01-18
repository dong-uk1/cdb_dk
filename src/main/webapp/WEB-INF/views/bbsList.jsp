<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table">
	<tr>
		<td>id</td>
		<td>제목</td>
		<td>사용자</td>
		<td>추천수</td>
	</tr>
	<c:forEach items="${list}" var="one">
	<tr>
		<td>${one.bbs_id}</td>
		<td><a href = "bbsOne?bbs_id=${one.bbs_id}">${one.bbs_title}</a></td>
		<td width = "100">${one.member_id}</td>
		<td width = "100">${one.c}</td>
	</tr>
	</c:forEach>
</table>
