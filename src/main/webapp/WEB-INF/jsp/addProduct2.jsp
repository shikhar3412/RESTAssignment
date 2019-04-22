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
/*function myfunction(){*/ $.getJSON("http://localhost:8080/RESTAssignment/product.json",function(myJSON){
			 $.each(myJSON, function(i, item){
				 $("#id1").append('<tr><td>' + myJSON[i].id + '</td><td>' + myJSON[i].name +  '</td><td>' + myJSON[i].price + '</td><td>' + myJSON[i].inventory +  '</td><td> <a href="http://localhost:8080/RESTAssignment/product/update/' 
						   + myJSON[i].id + '">Update</a></td><td> <a href="http://localhost:8080/RESTAssignment/product/delete/' 
						   + myJSON[i].id + '">Delete</a></td></tr>');
				   });
			});
		});
	//});  

</script>

<script>

   /*  Submit form using Ajax */
   //$('#submit').click(function() {
   function myfunction(){
      //Prevent default submission of form
      //e.preventDefault();
      
      //Remove all errors
      //$('input').next().remove();
      
      var pName = $("#name").val();
      var pPrice = $("#price").val();
      var pInventory = $("#inventory").val();
      var product = { "name" : pName.toString(),
      			"price" : pPrice.toString(),
      			"inventory" : pInventory.toString()
      		};
      $.ajax({
      	type : "POST",
      	contentType : 'application/json; charset=utf-8',
      	dataType : 'json',
      	url : 'http://localhost:8080/RESTAssignment/product/add',
         data : JSON.stringify(product)
         //success : function(res) {
         
          //  if(res.validated){
               //Set response
           //    $('#resultContainer pre code').text(JSON.stringify(res.employee));
            //   $('#resultContainer').show();
            
          //  }else{
           //   //Set error messages
            //  $.each(res.errorMessages,function(key,value){
  	    //        $('input[name='+key+']').after('<span class="error">'+value+'</span>');
              });
              window.setTimeout(function(){location.reload()},1500);              
            //location.reload();
            //location.reload();
            //location.reload();
            //location.reload();
            //location.reload();  
            }
         //}
      //})
   //});

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


<table id="id1" border=1>
	<tr >
		<th>Product ID</th>
		<th>Product Name</th>
		<th>Product Price</th>
		<th>Product Inventory</th>
	</tr>
	
		
	
</table>

</body>
</html>
