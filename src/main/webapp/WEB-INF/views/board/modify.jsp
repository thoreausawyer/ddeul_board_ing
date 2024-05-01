<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl 태그라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더 -->
<%@include file="../includes/header.jsp" %>

	 <!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">게시글</h1>

      <!-- DataTales Example -->
      <div class="card shadow mb-4">
          <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">게시글 수정</h6>
          </div>
          <div class="card-body">
          	<form id="actionForm" action="/board/modify" method="post"> <!-- form action의 분기 연습 수정 vs 삭제 -->
          	
	          	<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">번호</span>
				  </div>
				  <input type="text" name="bno" value="<c:out value="${vo.bno }" />" class="form-control" readonly>
				</div>
	          	<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">제목</span>
				  </div>
				  <input type="text" name="title" value="<c:out value="${vo.title }" />" class="form-control">
				</div>
				
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">내용</span>
				  </div>
				  <input type="text" name="content" value="<c:out value="${vo.content }"/>" class="form-control">
				</div>
				
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">작성자</span>
				  </div>
				  <input type="text" value="<c:out value="${vo.writer }"/>" class="form-control" readonly>
				</div>
				
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">작성자</span>
				  </div>
				  <input type="text" value="<c:out value="${vo.writeDate }"/>" class="form-control" readonly>
				</div>
				
				<div class="input-group input-group-lg">
					<button type="button" class="btn btn-info" id="btnList">목록</button>
				  	<button type="submit" class="btn btn-warning" id="btnModify">수정</button>
				  	<button type="submit" class="btn btn-danger" id="btnRemove">삭제</button>
          		</div>
          	</form>
          </div>
      </div>
                        


<!-- 푸터 -->
<%@include file="../includes/footer.jsp" %>

<!-- 자바스크립트 -->
<script type="text/javascript">
	
	const bno = '${vo.bno}';
	// action form 컨트롤
	const actionForm = document.querySelector("#actionForm");

	/* 목록으로 가기 */
	document.querySelector("#btnList").addEventListener("click",(e) =>{
		window.location="/board/list";
	}, false);
	
	/* 수정하기 */
	document.querySelector("#btnModify").addEventListener("click",(e) =>{
		e.preventDefault(); // 모든 작업을 일단 차단
		e.stopPropagation(); // 더 안전하게 모은 이벤트에 대해서도 차단		
		
		actionForm.action = `/board/modify/\${bno}`;
		actionForm.method = 'post';
		actionForm.submit();
		
	}, false);
	
	/* 삭제하기 */
	document.querySelector("#btnRemove").addEventListener("click",(e) =>{
		e.preventDefault(); // 모든 작업을 일단 차단
		e.stopPropagation(); // 더 안전하게 모은 이벤트에 대해서도 차단		
		
		actionForm.action = `/board/remove/\${bno}`;
		actionForm.method = 'post';
		actionForm.submit();
		
	}, false);
	
	
	

</script>

<!-- 자바스크립트를 편하게 작성하기 위한 end includes -->
<%@include file="../includes/end.jsp" %>