<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table">
	<tr>
		<td>id</td>
		<td>제목</td>
		<td>카테고리</td>
		<td>등록일</td>
	</tr>
	<c:forEach items="${list}" var="one">
		<tr>
			<td>${one.no}</td>
			<td><a href="newsOne?news=${one.no}">${one.title}</a></td>
			<td width="100">${one.category}</td>
			<td width="100"><fmt:formatDate value="${one.pubdate}" pattern="yyyy-MM-dd" /></td>
			
		</tr>
	</c:forEach>
</table>
