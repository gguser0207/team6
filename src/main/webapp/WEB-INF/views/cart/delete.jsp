<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.movie.MovieVO" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>mypage_cart</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
</script>

</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false'/>


        <div class="title_line_cart">삭제되었습니다.</div>
<A href="../../">
        <div class="cart_total"><button class="colorgreen_size28">홈페이지로 이동하기</button></div>

</A>





<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

