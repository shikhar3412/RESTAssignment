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
	  //$("#submit").click(function(){
/*function myfunction(){*/ $.getJSON("http://localhost:8080/RESTAssignment/product",function(myJSON){
			 $.each(myJSON, function(i, item){
				 $("#id1").append('<tr><td>' + myJSON[i].id + '</td><td>' + myJSON[i].name +
						  '</td><td>' + myJSON[i].price + '</td><td>' + myJSON[i].inventory +
						   '</td><td> <a href="http://localhost:8080/RESTAssignment/product/update/' 
						   + myJSON[i].id + '">Update</a></td><td> <a href="http://localhost:8080/RESTAssignment/product/delete/' 
						   + myJSON[i].id + '">Delete</a></td></tr>');
				   });
			});
		});
	//});  

</script>

<form:form modelAttribute="product">
	<table>
		<%-- <tr>
			<td>Enter product id:</td>
			<td><form:input path="id"/></td>
		</tr> --%>
		<tr>
			<td>Enter product name:</td>
			<td><form:input path="name"/></td>
		</tr>
		<tr>
			<td>Enter product price:</td>
			<td><form:input path="price"/></td>
		</tr>
		<tr>
			<td>Enter product inventory:</td>
			<td><form:input path="inventory"/>
		</tr>
		<tr>
			<td colspan="2">
				<input id="submit" type="submit"  value="Enter Product Details"/>
			</td>	
		</tr>
		</table>
</form:form>

<table id="id1">
	<tr >
		<th>Product ID</th>
		<th>Product Name</th>
		<th>Product Price</th>
		<th>Product Inventory</th>
	</tr>
	
		
	
</table>

</body>
</html>