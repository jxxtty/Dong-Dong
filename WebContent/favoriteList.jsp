<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심목록</title>
</head>
<body>
<h1>관심목록</h1>

<jsp:include page="common/top.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
<hr>
<jsp:include page="favorite/favoriteList.jsp" flush="true"></jsp:include>

</body>
</html>