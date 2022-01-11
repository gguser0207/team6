<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <c:set var="categrp_no" value="${categrpVO.categrp_no }" />
<c:set var="seqno" value="${categrpVO.seqno }" />
<c:set var="categrp_name" value="${categrpVO.categrp_name }" />
<c:set var="rdate" value="${categrpVO.rdate.substring(0, 10) }" />
<c:set var="visible" value="${categrpVO.visible }" />
 
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
  </script>

</head>
<body>
<jsp:include page="../menu/top.jsp" />
  <div class="update" id="update">
      <form name='frm' method='POST' action='/categrp/update.do' class="update_form">
        <input type='hidden' name='categrp_no' id='categrp_no' value='${categrp_no }'>
        
             <input type='text' name='categrp_name' value='${categrp_name }'
              required="required" placeholder="이름" autofocus="autofocus">


             <input type='number' name='seqno' value='${seqno }' required="required" 
                       placeholder="출력 순서" min="1" max="1000" step="1"> 

              <select name='visible' class="form-control" style='width: 20%;'>
                <option value='Y' selected="selected">Y</option>
                <option value='N'>N</option>
              </select>
      
        <div class="button" style="margin: 5px; display: flex; 
        float: right; width: 70%; ">
          <button type="submit" class="btn">수정</button>
          <button type="button" onclick = "location.href = './list.do'" class= "btn" id="btn_back" >취소</button>
        </div>
      </form>
  </div>
<jsp:include page="../menu/bottom.jsp" />
</body>
</html>