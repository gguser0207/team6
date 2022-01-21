<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.movie.MovieVO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>mypage_cart</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false'/>

<div class="container_main_cart">
        <div class="title_line_cart">구매목록</div>
        <c:forEach var="vo" items="${list}" varStatus="status">
	      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
	        <HR class='menu_line'>
	      </c:if>
	    <div class="row" style="width:22%; float:left; margin:0.5%; padding:0.5%;
          background-color: 000; text-align:center;">
				 주문번호: ${vo.cartno} | 감독: ${vo.director} <br>
             <c:choose>
                 <c:when test="${vo.thumb1.endsWith('jpg') || vo.thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                     <%-- /static/contents/storage/ --%>
                     <IMG src="/movie/images/${vo.thumb1}" style="width: 150px; height: 200px;">
                 </c:when>
                 <c:otherwise> <!-- 기본 이미지 출력 -->
                     <IMG src="/movie/images/none1.png" style="width: 150px; height: 200px;">
                 </c:otherwise>
             </c:choose>
             <div class="border">${vo.title}</div>
             <button
                     type="button"
                     class="colorred"
                     data-bs-toggle="modal"
                     data-bs-target="#myModal"
             >
                 제거
             </button>
        </div>
        </c:forEach>
        <div class="cart_total"><button class="colorgreen_size28">전체 삭제하기</button></div>
        
    </div>



<%--<div class="modal" id="myModal">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <!-- Modal Header -->--%>
<%--            <div class="modal-header">--%>
<%--                <h4 class="modal-title">영화 제거</h4>--%>
<%--                <button--%>
<%--                        type="button"--%>
<%--                        class="btn-close"--%>
<%--                        data-bs-dismiss="modal"--%>
<%--                ></button>--%>
<%--            </div>--%>

<%--            <!-- Modal body -->--%>
<%--            <div class="modal-body">장바구니에서 영화를 제거하시겠습니까?</div>--%>

<%--            <!-- Modal footer -->--%>
<%--            <div class="modal-footer">--%>
<%--                <button--%>
<%--                        type="button"--%>
<%--                        class="btn btn-danger"--%>
<%--                        data-bs-dismiss="modal"--%>
<%--                >--%>
<%--                    확인--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%-- --%>
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

