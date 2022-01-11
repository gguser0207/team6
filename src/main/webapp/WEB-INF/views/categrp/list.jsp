<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Tranning</title>
 <link href="/css/style.css" rel="Stylesheet" type="text/css">
  <script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  $(function() {
      });
  $('#submit_delete').on('click',function(){alert("${categrp_name}")})

</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV><span class='title_line'>카테고리 그룹</span></DIV>

<DIV class='content_body'>
    
  <div class="list">
    <div>  
        <div class="thead">
          <div class="th_bs">순서</div>
          <div class="th_bs">이름</div>
          <div class="th_bs">그룹 생성일</div>
          <div class="th_bs">출력 모드</div>
          <div class="th_bs">순서 변경</div>
          <div class="th_bs">수정 삭제</div>
        </div>
    </div>
<div>    
    
    <c:forEach var="categrpVO" items="${list}">
      <c:set var="categrp_no" value="${categrpVO.categrp_no }" />
      <c:set var="seqno" value="${categrpVO.seqno }" />
      <c:set var="categrp_name" value="${categrpVO.categrp_name }" />
      <c:set var="rdate" value="${categrpVO.rdate.substring(0, 10) }" />
      <c:set var="visible" value="${categrpVO.visible }" />
    <div class="tdata">
        <div class="td_bs">${seqno }</div>
        <div class="td_bs_left"><A href="../categrp/list_by_categrp_no.do?categrp_no=${categrp_no }">${categrp_name }</A></div>
        <div class="td_bs">${rdate}</div>
        <div class="td_bs">
          <c:choose>
            <c:when test="${visible == 'Y'}">
              <A href="./update_visible.do?categrp_no=${categrp_no }&visible=${visible }"><IMG src="/images/open.png" style='width: 18px;'></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?categrp_no=${categrp_no }&visible=${visible }"><IMG src="/images/close.png" style='width: 18px;'></A>
            </c:otherwise>
          </c:choose>
        </div>   
        
        <div class="td_bs">
          <%-- <A href="./read_update.do?categrpno=${categrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A> --%>
          <%-- Ajax 기반 수정폼--%>   
          <%-- <A href="./read_delete.do?categrpno=${categrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A> --%>
          <%-- Ajax 기반 Delete폼--%>     
          <A href="./update_seqno_up.do?categrp_no=${categrp_no }" title="우선순위 상향">▲</A>
          <A href="./update_seqno_down.do?categrp_no=${categrp_no }" title="우선순위 하향">▼</A>       
          </div>  
          <div class="td_bs">
          <FORM name='frm_delete' id='frm_delete' method='POST' action='/categrp/delete.do'>
           <input type='hidden' name='categrp_no' id='categrp_no' value='${categrpVO.categrp_no }'>
           <input type='hidden' name='categrp_no' id='categrp_no' value='${categrpVO.categrp_name }'>
          <button class="btn_ud" type="submit" id='submit_delete'>삭제</button>
        </FORM>
          <a href="./update.do?categrp_no=${categrp_no }" class="btn_ud">수정</a>
        </div>
        
      </div>   
    </c:forEach> 
    
</div>   
  </div>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>

</html>
 