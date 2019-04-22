<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("button").click(function(){
    $.getJSON("product.json", function(result){
      $.each(result, function(i, field){
        $("div").text(result[i].name + " ");
      });
    });
  });
});
</script>
</head>
<body>

<button>Get JSON data</button>

<div></div>

</body>
</html>
