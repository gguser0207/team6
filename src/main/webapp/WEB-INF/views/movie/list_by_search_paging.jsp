<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dev.mvc.movie.MovieVO" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>영화</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>영화</DIV>

<DIV class='content_body_movie_list'>
  <c:set var="grade" value="${sessionScope.grade}" />
          <c:choose>
          	<c:when test="${grade >= 1 and grade <= 10}">
          		<div class="create_form_move"><a href="/movie/create.do">영 화 등 록</a></div> 
       		</c:when>
   		</c:choose>

  <TABLE class='table table-striped' style="width:100%;">
    <colgroup>
		<c:choose>
		  	<c:when test="${grade >= 1 and grade <= 10}">
		      <col style='width: 10%;'/>
		      <col style='width: 15%;'/>
		      <col style='width: 10%;'/>
		      <col style='width: 15%;'/>
		      <col style='width: 30%;'/>    
		      <col style='width: 10%;'/>
		      <col style='width: 10%;'/>
			</c:when>
			<c:otherwise>
		      <col style='width: 10%;'/>
		      <col style='width: 15%;'/>
		      <col style='width: 15%;'/>
		      <col style='width: 20%;'/>
		      <col style='width: 30%;'/>    
		      <col style='width: 10%;'/>
			</c:otherwise>
		</c:choose>
    </colgroup>
   
    <thead>  
	 <c:choose>
	  	<c:when test="${grade >= 1 and grade <= 10}">
	    <TR>
	      <TH class="th_bs">영화 이미지</TH>
	      <TH class="th_bs">영화명</TH>
	      <TH class="th_bs">감독</TH>
	      <TH class="th_bs">출연</TH>
	      <TH class="th_bs">줄거리</TH>
	      <TH class="th_bs">가격</TH>
	      <TH class="th_bs">기타</TH>
	    </TR>
		</c:when>
		<c:otherwise>
	    <TR>
	      <TH class="th_bs">영화 이미지</TH>
	      <TH class="th_bs">영화명</TH>
	      <TH class="th_bs">감독</TH>
	      <TH class="th_bs">출연</TH>
	      <TH class="th_bs">줄거리</TH>
	      <TH class="th_bs">가격</TH>
	    </TR>
		</c:otherwise>
	</c:choose>
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
      <c:forEach var="movieVO" items="${list }" varStatus="status">
        <c:set var="mno" value="${movieVO.mno }" />
        <c:set var="title" value="${movieVO.title }" />
        <c:set var="plot" value="${movieVO.plot }" />
        <c:set var="director" value="${movieVO.director }" />
        <c:set var="file1saved" value="${movieVO.file1saved }" />
        <c:set var="file1" value="${movieVO.file1 }" />
        <c:set var="thumb1" value="${movieVO.thumb1 }" />
        <c:set var="price" value="${movieVO.price }" />
        <c:set var="actor" value="${movieVO.actor }" />
        <c:set var="score" value="${movieVO.score }" />
        <c:set var="release" value="${movieVO.release }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <a href="./read.do?mno=${mno}&now_page=${param.now_page }"><IMG src="/movie/images/${thumb1 }" style="width: 150px; height: 200px;"></a> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/movie/images/none1.png" style="width: 150px; height: 200px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <a href="./read.do?mno=${mno}&now_page=${param.now_page }&word=${param.word}"><strong>${title}</strong></a> 
          	<div><p>평점(${score})</p></div>
          </td> 
          <td style='vertical-align: middle;'>
            ${director}</strong>
          </td> 
          <td style='vertical-align: middle;'>
            <strong>${actor}</strong>
          </td> 
          <td style='vertical-align: middle;'>
            <a href="./read.do?mno=${mno}&now_page=${param.now_page }&word=${param.word}"><strong>${plot}</strong></a> 
          </td> 
          <td style='vertical-align: middle;'>
            <del><fmt:formatNumber value="${price}" pattern="#,###" /> 원</del><br>
          </td> 
			 <c:choose>
			  	<c:when test="${grade >= 1 and grade <= 10}">
			          <td style='vertical-align: middle; text-align: center;'>
			            <A href="./read_update_text.do?mno=${mno}&now_page=${now_page }"><div class="btn_ud">텍스트수정</div></A><br>
			            <A href="./read_update_file.do?mno=${mno}&now_page=${now_page }"><div class="btn_ud">파일수정</div></A><br>
					    <FORM name='frm_delete' id='frm_delete' method='POST' 
					    onsubmit="return confirm('삭제시 복구되지 않습니다. 정말 삭제하시겠습니까?')" action='./delete.do'>
					      <input type='hidden' name='mno' id='mno' value='${mno }'>
					      <button type="submit" class="btn_ud" id='submit' onclick="btn_confirm()">삭제</button>
					    </FORM>
			          </td>
				</c:when>
			</c:choose>
        </tr>
      </c:forEach>
    </tbody>
   
  </TABLE>
</DIV>
<DIV class='bottom_paging'>${paging }</DIV> <%-- 페이지 리스트 --%>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

