<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="mno" value="${movieVO.mno }" />
<c:set var="title" value="${movieVO.title }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>movie</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<%-- <DIV class='title_line'>
  <A href="../categrp/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="../cate/list_by_categrpno.do?categrpno=${categrpVO.categrpno }" class='title_link'>${categrpVO.name }</A> >
  <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }" class='title_link'>${cateVO.name }</A>
</DIV> --%>

<DIV class='content_body_movie_update_file'>
<%--   <ASIDE class="aside_right">
    <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?mno=${mno}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?mno=${mno}">파일 수정</A>  
  </ASIDE> --%>
  
<%--     <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='cateno' value='${cateVO.cateno }'>
      <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
   --%>

    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:set var="file1saved" value="${movieVO.file1saved.toLowerCase() }" />
          <c:set var="thumb1" value="${movieVO.thumb1 }" />
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/movie/images/${file1saved }" style='width: 50%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 없음 -->
               <IMG src="/movie/images/none1.png" style="width: 50%;"> 
            </c:otherwise>
          </c:choose>
          
        </DIV>

        <DIV style='text-align: left; width: 47%; float: right;'>
          <span style='font-size: 1.5em;'>영화 제목: ${title}</span>
          <br>
          <FORM name='frm' method='POST' action='./update_file.do' 
              enctype="multipart/form-data">
            <input type="hidden" name="mno" value="${mno }">
            <input type="hidden" name="now_page" value="${param.now_page }">
            <br><br> 
            변경 이미지 선택<br>  
            <input type='file' name='file1MF' id='file1MF' value='' placeholder="파일 선택"><br>
            패스워드<br>
            <input type='password' name='passwd' value='' required="required" style='width: 30%;'>
            <br>
            <div style='margin-top: 20px; clear: both;'>  
              <button type="submit" class="btn btn-primary" style='width:200px;'>파일 변경 처리</button>
              <button type="button" onclick="history.back();" class="btn btn-primary" style='width:150px;'>취소</button>
            </div>  
          </FORM>
        </DIV>
      </li>
      <li class="li_none">

      </li>   
    </ul>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
 