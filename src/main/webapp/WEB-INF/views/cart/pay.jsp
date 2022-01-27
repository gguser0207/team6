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

<section>
    <!-- ... -->
    <span>총 주문금액</span>
    <span>15,000 원</span>
    <button id="payment-button">15,000원 결제하기</button>
</section>
<script>
   var clientKey = "test_ck_OEP59LybZ8BwZG6g12Y36GYo7pRe";
   var tossPayments = TossPayments(clientKey);

   var button = document.getElementById("payment-button"); // 결제하기 버튼

   button.addEventListener("click", function () {
       tossPayments.requestPayment("카드", {
           amount: 15000,
           orderId: "OpvvFtup5-M5Uk70UQRvO",
           orderName: "영화 외 2건",
           customerName: "team6",
           successUrl: "http://localhost:9091/success",
           failUrl: "http://localhost:9091/fail",
       });
   });
</script>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

