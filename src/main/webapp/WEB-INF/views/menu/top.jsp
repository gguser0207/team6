<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="grade" value="${sessionScope.grade}" />
  <div class="container">
    <nav>
      <div class="logo">
        <a href="http://localhost:9091">PROJECT6</a>
      </div>
        <div class="list_main">
      <ul>
        <li><a href="http://localhost:9091" class="home_btn">HOME</a></li>
        <li><a href="/movie/list_by_search_paging.do">영화</a></li>
        <li><a href="/movie/rank_price_1.do">순위</a></li>
      <c:choose>
        <c:when test="${sessionScope.id eq null}"> <%-- 로그인 안 한 경 우 --%>
          <li><A class='menu_link'  href='/member/login.do' >로그인</A><span class='top_menu_sep'> </span></li>
          <li><a href="/member/create.do">회원가입</a></li>
        </c:when>

        <c:otherwise><!--${sessionScope.id }님 반갑습니다.  -->
          <li ><A href='/cart/buylist.do' >구매목록</A><span class='top_menu_sep'> </span></li>
          <li ><A href='/cart/list.do' >장바구니</A><span class='top_menu_sep'> </span></li>
          <c:choose>
          	<c:when test="${grade >= 1 and grade <= 10}">
          		<li><a href="/member/list.do">회원목록</a></li>
       		</c:when>
   		</c:choose>
          <li class='login_id'><A href='/member/logout.do' >로그아웃</A><span class='top_menu_sep'> </span></li>
        </c:otherwise>
      </c:choose>     
<!--         <li><a href="http://localhost:9091/member/login.do">로그인</a></li>
        <li><a href="http://localhost:9091/member/create.do">회원가입</a></li> -->
        <!-- <li><a href="http://localhost:9091/member/list.do">회원목록</a></li> -->
        <li style="margin-left: 15px;">
        <form id="search" name="search" method="get" action="/movie/list_by_search_paging.do">
        	<input type='hidden' name='categrp_no' value='8'></input>
          <input type="text" name='word' id='word' placeholder="영화/장르"></input>
          <input type="submit" value="검색"></input>
        </form></li>
      </ul>
      </div>
    </nav>
  </div>