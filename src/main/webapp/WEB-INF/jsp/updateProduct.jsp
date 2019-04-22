<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function(){
	  $.getJSON("http://localhost:8080/RESTAssignment/product/" + ${"#productId"}.val() + ".json",function(myJSON){
		$("#name").val(myJSON.name);
		$("#price").val(myJSON.price);
		$("#inventory").val(myJSON.inventory);
		});
	});	

</script>	
<form:form modelAttribute="product">
	<!--<input type= "hidden" name = "_method" value="put"-->

	<table>
		<tr>
			<%-- <td>Enter product id:</td>
			<td><form:input path="id"/></td> --%>
		</tr>	
		<tr>
			<td>Enter product name:</td>
			<td><form:input id="name" path="name" /></td>
		</tr>
		<tr>
			<td>Enter product price:</td>
			<td><form:input id="price" path="price"/></td>
		</tr>
		<tr>
			<td>Enter product inventory:</td>
			<td><form:input  id ="inventory" path="inventory"/>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Enter Product Details"/>
			</td>	
		</tr>
		</table>
		
<p hidden="true" id= "productId"> ${productId}</p>		
</form:form>
</body>
</html>
