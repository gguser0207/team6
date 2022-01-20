<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="mno" value="${movieVO.mno }" />
<c:set var="title" value="${movieVO.title }" />
<c:set var="director" value="${movieVO.director }" />
<c:set var="actor" value="${movieVO.actor }" />
<c:set var="plot" value="${movieVO.plot }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>영화 > ${title } 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">영화를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='mno' id='mno' value='${mno }'>
        
      <label>영화 이름</label>: ${title }  
      <label>감독, 연출</label>: ${director }   
      <label>출연</label>: ${actor }  
       
      <button type="submit" id='submit' class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">삭제</button>
      <button type="button" onclick="location.href='./list.do'" class='btn btn-primary btn-xs' style="height: 22px; margin-bottom: 3px;">취소</button>
    </FORM>
  </DIV>
   
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 30%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>    
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
    <c:forEach var="movieVO" items="${list}">
      <c:set var="mno" value="${movieVO.mno }" />
      <c:set var="title" value="${movieVO.title }" />
      <c:set var="director" value="${movieVO.director }" />
      <c:set var="actor" value="${movieVO.actor }" />
      <c:set var="plot" value="${movieVO.plot }" />
      <TR>
        <TD class="td_bs">${mno }</TD>
        <TD class="td_bs_left"><A href="../movie/read.do?mno=${mno }">${title }</A></TD>
        <TD class="td_bs">${director}</TD>
        <TD class="td_bs">${actor}</TD>
        <TD class="td_bs">${plot}</TD>  
        
        <TD class="td_bs">
          <A href="./read_update.do?categrpno=${categrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?categrpno=${categrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>        
         </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV> 

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

