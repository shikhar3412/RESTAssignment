<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	updateId = window.location.pathname.charAt(window.location.pathname.length-1);
	$.ajax({
      	type : "GET",
      	//contentType : 'application/json; charset=utf-8',
      	//dataType : 'json',
      	url : 'http://localhost:8080/RESTAssignment/product/' + updateId,
        //data : JSON.stringify(product)
        success: function(result) {$("#name").val(result.name); $("#price").val(result.price); $("#inventory").val(result.inventory);}
	});
});

   /*  Submit form using Ajax */
   //$('#submit').click(function() {
   function myfunction(){
     
      var pName = $("#name").val();
      var pPrice = $("#price").val();
      var pInventory = $("#inventory").val();
      var product = { "name" : pName.toString(),
      			"price" : pPrice.toString(),
      			"inventory" : pInventory.toString()
      		};
	var updateId = window.location.pathname.charAt(window.location.pathname.length-1);
      $.ajax({
      	type : "PUT",
      	contentType : 'application/json; charset=utf-8',
      	dataType : 'json',
      	url : 'http://localhost:8080/RESTAssignment/product/update/' + updateId,
         data : JSON.stringify(product)
         
              });
              window.setTimeout(function(){window.location.replace("http://localhost:8080/RESTAssignment/product/add")},1500);
               
            }
         

</script>

<form id="form" name = "productForm" >
	Product Name:<br>
  <input id="name" type="text" name="name"><br>
  	Price:<br>
  <input id="price" type="text" name="price"><br>
  	Inventory:<br>
  <input id="inventory" type="text" name="inventory"><br>
  <button id="submit" onclick="myfunction()" type="button" value="Submit">Submit</button>
</form>
</body>
</html>