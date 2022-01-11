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
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>영화</DIV>

<DIV class='content_body_movie_list'>
<div class="create_form_move"><a href="/movie/create.do">영 화 등 록</a></div> 
    
  <TABLE class='table table-striped' style="width:100%;">
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 30%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">번호</TH>
      <TH class="th_bs">영화명</TH>
      <TH class="th_bs">감독</TH>
      <TH class="th_bs">출연진</TH>
      <TH class="th_bs">줄거리</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    // Scriptlet
    // List<MovieVO> list = (List<MovieVO>)(request.getAttribute("list"));
    // for (MovieVO movieVO: list) {
    //    out.println(movieVO.getName() + "<br>");
    //  http://localhost:9091/movie/list.do
    // }
    %>
    <c:forEach var="movieVO" items="${list}">
      <c:set var="mno" value="${movieVO.mno }" />
      <c:set var="title" value="${movieVO.title }" />
      <c:set var="director" value="${movieVO.director }" />
      <c:set var="act" value="${movieVO.act }" />
      <c:set var="plot" value="${movieVO.plot }" />
      <TR>
        <TD class="td_bs">${mno }</TD>
        <TD class="td_bs_left"><A href="../movie/read.do?mno=${mno }">${title }</A></TD>
        <TD class="td_bs">${director}</TD>
        <TD class="td_bs">${act}</TD>
        <TD class="td_bs">${plot}</TD>  
        
        <TD class="td_bs">
          <A href="./read_update.do?mno=${mno }" title="수정"><span>수정</span></A>
          <A href="./read_delete.do?mno=${mno }" title="삭제"><span>삭제</span></A>         
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

