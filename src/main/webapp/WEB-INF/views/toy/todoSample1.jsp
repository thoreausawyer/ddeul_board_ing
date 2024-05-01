<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <title>HOON'S TO DO LIST</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>


<div class="jumbotron text-center">
  <h1>HOON'S TO DO LIST</h1>
  <p>inspiring hearts!</p> 
</div>

<div class="container">

	<h4>오늘, 어떤 꿈들을 이루실 건가요?</h4>
	
	<br/>
	
	<ul class="list-group" id="todo-list-group">
	
	</ul>
	
	<br/>
	
	<div class="form-group">
	  <input type="text" class="form-control" id="input-todo">
	</div>

</div>
	

</body>

<script type="text/javascript">
	
	$("#input-todo").keypress(function(e){
		  // action goes here!!
		  var todoText = $("#input-todo").val();
		  
		  if(e.keyCode == 13){
			  
			  $("#todo-list-group").append('<li class="list-group-item">'+ todoText + '</li><br/>');
			  
			  $("#input-todo").val('');
		  }
		});

	$("#todo-list-group").on("click", "li", function(){
		$(this).fadeOut(1000, function(){
            $(this).remove();
        });
	});

</script>

</html>