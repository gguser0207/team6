<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.cart.CartVO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width"/>
    <title>mypage_cart</title>

    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://js.tosspayments.com/v1"></script>
    <script type="text/javascript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
        function toss_pay() {
            var clientKey = "test_ck_OEP59LybZ8BwZG6g12Y36GYo7pRe";
            var tossPayments = TossPayments(clientKey);

            var button = document.getElementById("payment-button"); // 결제하기 버튼

            button.addEventListener("click", function () {
                tossPayments.requestPayment("카드", {
                    amount: 15000,
                    orderId: "OpvvFtup5-M5Uk70UQRvO",
                    orderName: "영화",
                    customerName: "team6",
                    successUrl: "http://localhost:9091/success",
                    failUrl: "http://localhost:9091/fail",
                });
            });
        }
    </script>

</head>

<body>
<jsp:include page="../menu/top.jsp" flush='false'/>

<div class="container_main_cart">
    <div class="title_line_cart">장바구니</div>
    <c:forEach var="vo" items="${list}" varStatus="status">
        <c:set var="mno" value="${vo.mno }"/>
        <c:set var="cartno" value="${vo.cartno }"/>
        <c:set var="title" value="${vo.title }"/>
        <c:set var="price" value="${vo.price }"/>
        <c:if test="${status.index % 4 == 0 && status.index != 0 }">

        </c:if>
        <div class="row" style="width:22%; float:left; margin:0.5%; padding:0.5%;
          background-color: #000000; text-align:center;">
            주문번호: ${vo.cartno} | 감독: ${vo.director} <br>
            <c:choose>
                <c:when test="${vo.thumb1.endsWith('jpg') || vo.thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                    <%-- /static/contents/storage/ --%>
                    <a href="../../movie/read.do?mno=${mno}"><IMG src="/movie/images/${vo.thumb1}"
                                                                  style="width: 150px; height: 200px;"></a>
                </c:when>
                <c:otherwise> <!-- 기본 이미지 출력 -->
                    <IMG src="/movie/images/none1.png" style="width: 150px; height: 200px;">
                </c:otherwise>
            </c:choose>
            <div class="border">${vo.title}</div>
            <button type="button" class="colorblue" id="payment-button" onclick="toss_pay()">평생 소장</button>
            <A href="./pay.do?cartno=${cartno}">
                <button type="button" class="colorgreen">대여하기</button>
            </A>
            <A href="./delete.do?cartno=${cartno}">
                <button
                        type="button"
                        class="colorred"
                >
                    제거
                </button>
            </A>
        </div>
    </c:forEach>
    <%--    <div class="cart_total">--%>
    <%--        <button class="colorgreen_size28">전체 구매하러 가기</button>--%>
    <%--    </div>--%>

</div>


<jsp:include page="../menu/bottom.jsp"/>
</body>

</html>

