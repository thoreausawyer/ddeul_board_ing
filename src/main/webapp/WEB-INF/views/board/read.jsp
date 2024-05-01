<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- jstl 태그라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더 -->
<%@include file="../includes/header.jsp" %>
	
	<!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">게시판</h1>

      <!-- DataTales Example -->
      <div class="card shadow mb-4">
          <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">게시글 조회</h6>
          </div>
          <div class="card-body">
	          	<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">번호</span>
				  </div>
				  <input type="text" class="form-control" value="<c:out value="${vo.bno}"/>" readonly>
				</div>
				
	          	<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">제목</span>
				  </div>
				  <input type="text" class="form-control" value="<c:out value="${vo.title}"/>" readonly>
				</div>
				
	          	<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">내용</span>
				  </div>
				  <input type="text" class="form-control" value="<c:out value="${vo.content}"/>" readonly>
				</div>
				
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">작성자</span>
				  </div>
				  <input type="text" class="form-control" value="<c:out value="${vo.writer}"/>" readonly>
				</div>
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">작성일시</span>
				  </div>
				  <input type="text" class="form-control" value="<c:out value="${vo.writeDate}"/>" readonly>
				</div>
				<div class="input-group input-group-lg">
					<button type="submit" class="btn btn-info" id="btnList">목록</button>
					<button type="submit" class="btn btn-warning" id="btnModify">수정</button>
					<button type="submit" class="btn btn-success" id="btnRegister">등록</button>
				</div>
				
          </div>
      </div>
         


<!-- 푸터 -->
<%@include file="../includes/footer.jsp" %>

<!-- 자바스크립트 -->
<script type="text/javascript">

	document.querySelector("#btnList").addEventListener("click",(e) =>{
		window.location="/board/list";
	}, false);
	
	document.querySelector("#btnModify").addEventListener("click",(e) =>{
		window.location="/board/modify/${vo.bno}";
	}, false);

	document.querySelector("#btnRegister").addEventListener("click",(e) =>{
		window.location="/board/register";
	}, false);


</script>

<!-- 자바스크립트를 편하게 작성하기 위한 end includes -->
<%@include file="../includes/end.jsp" %> 