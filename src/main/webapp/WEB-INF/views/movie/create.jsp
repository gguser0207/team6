<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>영화  > 등록</DIV>
 
<DIV class='content_body'>
  <!-- 
  http://localhost:9091/movie/create.do
  action='./create.do' -> ./: http://localhost:9091/movie 현재 폴더
  -->
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <div class="form-group">
       <label class="control-label col-md-4">영화제목</label>
       <div class="col-md-8">
         <input type='text' name='title' value='' required="required" placeholder="제목"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>

    <div class="form-group">
       <label class="control-label col-md-4">감독, 연출</label>
       <div class="col-md-8">
         <input type='text' name='director' value='' required="required" placeholder="감독"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-4">출연진</label>
       <div class="col-md-8">
         <input type='text' name='act' value='' required="required" placeholder="출연"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-4">줄거리</label>
       <div class="col-md-8">
         <input type='text' name='plot' value='' required="required" placeholder="줄거리"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>

    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
 
 
 