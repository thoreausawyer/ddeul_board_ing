<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOON'S TO DREAM LIST</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="jumbotron text-center">
		<h1>HOON'S TO DREAM LIST</h1>
		<p>inspiring hearts!</p>
	</div>
	
	<div class="container">
		
		<h4>오늘은 어떤 꿈들을 이루실 건가요?</h4>
		</br>

		<ul class="list-group" id="dreams">
			
		</ul>
		
		<div class="form-group">
			<input type="text" class="form-control" id="dream">	
		</div>
	
	</div>
	
</body>

	<script type="text/javascript">
	
		$("#dream").keydown(function(e){
			var dreamText = $("#dream").val();
			if(e.keyCode == 13){
				
				$("#dreams").append("<li class='list-group-item'>" + dreamText + "</li></br>");
				
				$("#dream").val('');
				
			}
		});	
		
		/* 이벤트 위임은 부모 요소에 이벤트를 바인딩하여 해당 이벤트가 발생한 자식 요소를 감지하는 방식 */
		$("#dreams").on("click",".list-group-item", function(){
			
		    /* console.log("kkk"); */
		    $(this).fadeOut(500,function(){
		    	// 클릭된 요소의 다음 형제 요소인 줄바꿈 태그를 함께 제거합니다.
		    	$(this).next('br').remove();
		    	
			    this.remove();
		    });
		});
		
		
	
	</script>
	
</html>