<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title" value="${movieVO.title }" />
<c:set var="director" value="${movieVO.director }" />
<c:set var="word" value="${movieVO.word }" />
<c:set var="price" value="${movieVO.price }" />
<c:set var="actor" value="${movieVO.actor }" />
<c:set var="plot" value="${movieVO.plot }" />
<c:set var="file1" value="${movieVO.file1 }" />
<c:set var="file1saved" value="${movieVO.file1saved }" />
<c:set var="thumb1" value="${movieVO.thumb1 }" />
<c:set var="size2" value="${movieVO.size2 }" />
<c:set var="mno" value="${movieVO.mno }" />
         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>영화</title>
 
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
 

<DIV class='content_body_movie_update_text'>
<%--     <ASIDE class="aside_right">
      <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
      <span class='menu_divide' >│</span>
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span>
      <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
      <span class='menu_divide' >│</span>
      <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?mno=${mno}&now_page=${param.now_page}">수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?mno=${mno}&now_page=${param.now_page}">파일 수정</A>  
      <span class='menu_divide' >│</span>
      <A href="./delete.do?mno=${mno}&now_page=${param.now_page}">삭제</A>  
    </ASIDE>  --%>
  
    <%-- <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search.do'>
      <input type='hidden' name='cateno' value='${cateVO.cateno }'>
      <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search_paging.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV> --%>
  
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='mno' value='${mno }'>
    <input type='hidden' name='now_page' value='${param.now_page }'>
    
    <div class="form-group">
       <label class="movie_title">영화제목</label>
       <div class="text_box">
         <input type='text' name='title' value='${title }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">줄거리 수정</label>
       <div class="text_box">
         <textarea name='plot' required="required" class="form-control" rows="4" style='width: 100%;'>${plot }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">검색어</label>
       <div class="text_box">
         <input type='text' name='word' value='${word }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-2">가격</label>
       <div class="text_box">
         <input type='text' name='price' value='${price }' required="required" autofocus="autofocus"
                    min="0" max="10000000" step="100" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>   
    
    <div class="form-group">
       <label class="control-label col-md-2">감독</label>
       <div class="text_box">
         <input type='text' name='director' value='${director }' required="required"
                    min="0" max="10000000" step="100" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>    
    
    <div class="form-group">
       <label class="control-label col-md-2">출연진</label>
       <div class="text_box">
         <input type='text' name='actor' value='${actor }' required="required"
                    min="0" max="100" step="1" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div> 
     
<%--     <div class="form-group">
       <label class="control-label col-md-2">평점</label>
       <div class="col-md-10">
         <input type='number' name='score' value='${score }' required="required"
                    class="form-control" style='width: 100%;'>
       </div>
    </div>  --%>       
        <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="text_box">
         <input type='password' name='passwd' value='' required="required" class="form-control" style='width: 100%;'>
       </div>
    </div>
     <div style='margin-top: 20px; clear: both;'>  
       <button type="submit" class="btn btn-primary" style='width:150px;'>수정하기</button>
       <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
     </div>  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>