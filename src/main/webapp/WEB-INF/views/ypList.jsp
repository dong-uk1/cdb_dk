<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table" border="3" width="1000" height="500">

	<tr>
		<c:forEach items="${list}" var="one" begin="0" end="3" step="1"
			varStatus="status">
			<td>${one.YP_NAME}${one.YP_VIEW} <a
				href="정책 변경값?YP_URL=${one.YP_URL}">이동하기</a>
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach items="${list}" var="one" begin="4" end="7" step="1"
			varStatus="status">
			<td>${one.YP_NAME}${one.YP_VIEW} <a
				href="정책 변경값?YP_URL=${one.YP_URL}">이동하기</a>
			</td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach items="${list}" var="one" begin="8" end="11" step="1"
			varStatus="status">
			<td>${one.YP_NAME}${one.YP_VIEW} 
			<a href="정책 변경값?YP_URL=${one.YP_URL}"
			style="font-weight: bold; align: right;">이동하기</a>
			</td>
		</c:forEach>
	</tr>
</table>
