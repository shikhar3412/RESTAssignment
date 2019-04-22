<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="product">
	<table>
		<tr>
			<td>Enter product id:</td>
			<td><form:input path="id"/>
		</tr>

		<tr>
			<td colspan="2">
				<input type="submit" value="Submit"/>
			</td>	
		</tr>
		</table>
</form:form>
</body>
</html>