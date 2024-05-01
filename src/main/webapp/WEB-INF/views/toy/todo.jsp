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
		
		<h4>오늘 어떤 꿈들을 이루실 건가요?</h4>
		</br>

		<ul class="list-group" id="dreamList">
			
		</ul>
		
		<div class="form-group">
			<input type="text" class="form-control" id="dreamInput">	
		</div>
	
	</div>
	
</body>

	<script type="text/javascript">
	
		document.addEventListener("DOMContentLoaded", function() {
		    var dreamInput = document.getElementById("dreamInput"); //해당 id를 가진 태그의 정보를 var 변수에 저장
		    var dreamList = document.getElementById("dreamList"); //해당 id를 가진 태그의 정보를 var 변수에 저장
	
		    dreamInput.addEventListener("keydown", function(event) {
		        if (event.keyCode === 13) { // Enter key
		            var dreamText = dreamInput.value; // var 변수에 저장된 객체의 text value값을 추출해서 새로운 var 변수에 저장
		            var listItem = document.createElement("li"); // 추가하고 싶은 <태그>를 생성해서 var 변수에 저장
		            listItem.className = "list-group-item"; // 생성된 <태그>의 var 변수에 접근해서, 그곳에 '클래스' 저장
		            listItem.textContent = dreamText; // 마찬가지로 생성된 <태그>의 var 변수에 접근해서, text value를 출력되는 text로 저장 
		            dreamList.appendChild(listItem); // 최종 저장한 태그 객체를, 자식노드로 append함.
	
		            var lineBreak = document.createElement("br");
		            dreamList.appendChild(lineBreak); // <br> 추가
	
		            dreamInput.value = '';
		        }
		    });
	
		    dreamsList.addEventListener("click", function(e) {
		        // 클릭한 요소가 리스트 아이템인 경우에만 실행
		        if (e.target.classList.contains("list-group-item")) {
		            // 클릭된 리스트 아이템 요소 저장
		            var listItem = e.target;

		            // 페이드 아웃 효과 설정
		            listItem.style.transition = "opacity 0.5s";
		            listItem.style.opacity = 0;

		            // 클릭된 리스트 아이템의 다음 형제 요소인 <br> 태그 저장
		            var lineBreak = listItem.nextSibling;

		            // 페이드 아웃 애니메이션 후 요소 제거
		            setTimeout(function() {
		                listItem.parentNode.removeChild(listItem);

		                // 만약 다음 형제 요소인 <br> 태그가 있다면 제거
		                if (lineBreak) {
		                    lineBreak.parentNode.removeChild(lineBreak);
		                }
		            }, 500);
		        }
		    });

		});

	
	</script>
	
</html>