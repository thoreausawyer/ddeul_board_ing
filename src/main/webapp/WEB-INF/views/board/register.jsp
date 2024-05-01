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
              <h6 class="m-0 font-weight-bold text-primary">게시글 등록</h6>
          </div>
          <div class="card-body">
          	<form action="/board/register" method="post">
          	
	          	<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">제목</span>
				  </div>
				  <input type="text" name="title" class="form-control">
				</div>
				
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">내용</span>
				  </div>
				  <input type="text" name="content" class="form-control">
				</div>
				
				<div class="input-group input-group-lg">
				  <div class="input-group-prepend">
				    <span class="input-group-text">작성자</span>
				  </div>
				  <input type="text" name="writer" class="form-control">
				</div>
				
			  	<button type="submit" class="btn btn-primary">등록</button>
          	
          	</form>
          </div>
      </div>
                        


<!-- 푸터 -->
<%@include file="../includes/footer.jsp" %>

<!-- 자바스크립트 -->
<script type="text/javascript">


</script>

<!-- 자바스크립트를 편하게 작성하기 위한 end includes -->
<%@include file="../includes/end.jsp" %>