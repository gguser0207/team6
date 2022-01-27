<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.movie.MovieVO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width"/>
    <title>mypage_cart</title>

    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://js.tosspayments.com/v1"></script>

    <script type="text/javascript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
    </script>

</head>

<body>
<jsp:include page="../menu/top.jsp" flush='false'/>


<div class="title_line_cart">대여하였습니다.</div>
<A href="./buylist.do">
    <div class="cart_total">
        <button class="colorgreen_size28">구매목록으로 이동하기</button>
    </div>
</A>


<jsp:include page="../menu/bottom.jsp"/>
</body>

</html>

