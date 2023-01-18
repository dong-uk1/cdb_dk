<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<hr>
<c:forEach var="vo" items="${list}">
검색한 id: ${vo.job_title} <br> <!-- el: expression language, 속성으로 지정한 것만 프린트! -->
<hr>
</c:forEach>
