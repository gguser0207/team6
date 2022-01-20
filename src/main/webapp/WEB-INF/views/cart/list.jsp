<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.movie.MovieVO" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />


<div class="container c-white">
    <div class="row">
        <div class="col-12">나의 장바구니</div>
        <c:forEach var="vo" items="${list}">
            ${vo.cartno} /  / ${vo.director} <br>
        <div class="col-3">
            <div class="row mt-4 mb-4">
                <div class="col-3">
                    <div class="col-9 border">
                        <IMG src="/movie/images/${thumb1 }" style="width: 150px; height: 200px;" class="img-fluid">
                        <div class="border">${vo.title}</div>
                        <button type="button" class="btn-primary">평생 소장</button>
                        <button type="button" class="btn-success">대여하기</button>
                        <button
                                type="button"
                                class="btn-danger"
                                data-bs-toggle="modal"
                                data-bs-target="#myModal"
                        >
                            제거
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>

<button class="btn-primary mt-5">전체 구매하러 가기</button>
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

