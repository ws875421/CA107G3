<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath()%>/Test/upImage.do" method="post"
		enctype="multipart/form-data">
		<input type="file" name = "file"> <input type="submit">
	</form>
</body>
</html>