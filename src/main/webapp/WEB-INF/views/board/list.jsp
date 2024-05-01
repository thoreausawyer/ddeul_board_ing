<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더 -->
<%@include file="../includes/header.jsp" %>
<!-- Begin Page Content -->
                <div class="container-fluid">

                   <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">게시판</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	
                            	<form id="actionForm" method="get" action="/board/list">
                            		<input type="hidden" name="pageNum" value="${pn.pageNum}">
                            		<input type="hidden" name="amount" value="${pn.amount}">
                            		<c:if test="${pn.types != null && pn.keyword != null }">
                            			<c:forEach var="type" items="${pn.types }">
											<input type="hidden" name="types" value="${type}">
                            			</c:forEach>
                            			<input type="hidden" name="keyword" value="<c:out value="${pn.keyword}"/>">
                            		</c:if>
                            	</form>
                            
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Bno</th>
                                            <th>Title</th>
                                            <th>Writer</th>
                                            <th>RegDate</th>
                                            <th>UpdateDate</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">
                                         <c:forEach var="board" items="${list}">
                                        <tr data-parkdonghoonzzang="${board.bno}"> <!-- dataset 변수명은 전부 소문자로만 되어야한다. -->
                                            <td><c:out value="${board.bno}"/></td>
                                            <td><c:out value="${board.title}"/></td>
                                            <td><c:out value="${board.writer}"/></td>
                                            <td><c:out value="${board.writeDate}"/></td>
                                            <td><c:out value="${board.updateDate}"/></td>
                                        </tr>
                                    </c:forEach>
                                     </tbody>
                                   </table>
                                 </div>
                            </div>
                      </div>
                      
                      <nav aria-label="...">
						  <ul class="pagination">
						  
						  	<c:if test="${pageMaker.prev }">
						    <li class="page-item">
						      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
						    </li>
						    </c:if>
						    
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
						    <li class="page-item ${pn.pageNum == num ? 'active' : '' }">
						      <a class="page-link" href="${num }">${num }</a>
						    </li>
						    </c:forEach>
						    
						    <c:if test="${pageMaker.next }">
						    <li class="page-item">
						      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
						    </li>
						    </c:if>
						    
						  </ul>
						</nav>
                      
                      <!-- Modal -->
					<div id="myModal" class="modal" tabindex="-1">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">게시글 등록 모달</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <p>게시글 등록 성공</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary">저장</button>
					      </div>
					    </div>
					  </div>
					</div>
<!-- 푸터 -->
<%@include file="../includes/footer.jsp" %>

<script type="text/javascript">

	const result = '${result}';
	
	const myModal = new bootstrap.Modal(document.getElementById('myModal'));
	
	if(result){
		myModal.show();
	}
	
	const actionForm = document.querySelector("#actionForm");
	
	document.querySelector("#tbody").addEventListener("click",(e) => {
		const target = e.target.closest("tr");
		const bno = target.dataset.parkdonghoonzzang;
		
		// 추가되는 form태그 삭제 작업
		const before = document.querySelector("#clonedActionForm")
		
		if(before){
			before.remove();
		}			
			
		
		//console.log(bno);
		//console.log(`/board/read/\${bno}`); /* JSP EL이랑 겹쳐서 JS의 백틱을 쓸 때는 |를 해줘야하고, 단순한 문자열로 취급할 수도 있기 때문이다 -> 문자열 결합으로 해결할 수도 있지만, 코드가 지저분해지기 때문에 백틱을 쓴다. */
		//window.location=`/board/read/\${bno}`;
		// 위 방법보다 아래 방법이 더 가독성이 좋음 -> 나중에 검색이 이벤트가 붙었을 때
		
		const clonedActionForm = actionForm.cloneNode(true);
		clonedActionForm.setAttribute("action",`/board/read/\${bno}`);
		clonedActionForm.setAttribute("id",'clonedActionForm');
		console.log(clonedActionForm);
		
		document.body.appendChild(clonedActionForm); // 뒤로가기하면 form태그가 쌓임 -> 삭제 해주는 작업 해야됨
		
		clonedActionForm.submit(); // 원래 있는 애를 바꿔도 되는데 뒤로가기 했을때 원래의 것이 유지가 된다.
		
	}, false); /* 캡처링 false */
	
	/* 페이징 버튼 이벤트 */
	
	document.querySelector(".pagination").addEventListener("click", (e)=>{
		e.preventDefault();
		const target = e.target;
		//console.log(target);
		
		const targetPage = target.getAttribute("href");
		
		//console.log(targetPage);
		
		actionForm.setAttribute("action","/board/list")
		actionForm.querySelector("input[name='pageNum']").value = targetPage;
		actionForm.submit();
		
	}, false)

</script>

<%@include file="../includes/end.jsp" %>