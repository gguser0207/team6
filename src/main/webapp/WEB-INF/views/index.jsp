<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <title>team6</title>
  
  <script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
    $(function show_create(){
      // alert("스크립트 실행");
      $('#btn_create').on('click',function(){$('#create').show(); $('.controll').hide() });
    });
    $(function show_controller(){
        $('#btn_back').on('click',function(){$('#create').hide(); $('.controll').show() });
      });
    

    function recommend_movie(){
      var url = 'http://127.0.0.1:8000/recommend_movie/form1/';
      var win = window.open(url, 'AI 서비스', 'width=900px, height=560px');

      var x = (screen.width - 900) / 2;
      var y = (screen.height - 560) / 2;

      win.moveTo(x, y); // 화면 중앙으로 이동
    }
  </script>
  
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
  <!-- ajax categrp controll(CRUD) 시작 -->
  <div class="controll">
  <c:set var="grade" value="${sessionScope.grade}" />
          <c:choose>
          	<c:when test="${grade >= 1 and grade <= 10}">
			    <button class="btn_index" id="btn_create">등록 하기</button>
			    <button class="btn_index" id="btn_list" onclick="location.href='/categrp/list.do'">목록 확인</button>
       		</c:when>
       		
   		</c:choose>

  </div>
  <!-- ajax categrp controll(CRUD) 끝 -->

  <!-- 등록 폼 시작-->
  <div class="create" id="create">
      <form name='frm' method='POST' action='/categrp/create.do' class="create_form">

             <input type='text' name='categrp_name' value='영화/순위/로그인'
              required="required" placeholder="이름" autofocus="autofocus">


             <input type='number' name='seqno' value='출력 순서' required="required" 
                       placeholder="출력 순서" min="1" max="1000" step="1"> 

              <select name='visible' class="form-control" style='width: 20%;'>
                <option value='Y' selected="selected">Y</option>
                <option value='N'>N</option>
              </select>
      
        <div class="button" style="margin: 5px; display: flex; 
        float: right; width: 70%; ">
          <button type="submit" class="btn">등록</button>
          <button type="button" class= "btn" id="btn_back">취소</button>
        </div>
      </form>

  </div>
  <!-- 등록 폼 끝 -->
<c:choose>
  	<c:when test="${grade >= 1 and grade <= 10}">
  		<div class="slider" style= "top:9%;">
	</c:when>
	<c:otherwise>
		<div class="slider" style= "top:4%;">
	</c:otherwise>
</c:choose>

    <div class="slide" style="background-image: url(./images/1.jpg);"></div>
    <div class="slide" style="background-image: url(./images/2.jpg);"></div>
    <div class="slide" style="background-image: url(./images/3.jpg);"></div>
    <a class="prev" onclick="button_click(-1)">&#10094</a>
    <a class="next" onclick="button_click(1)">&#10095</a>
  </div>
  <div class="django">
  <A href="javascript: recommend_movie()">추천 시스템</A>
  </div>
  <DIV class='bottom'>
    이현수[PL]   임동규[DA]   송은호[AI]   유성용[WP] 
  </DIV>
  <script>
    let currSlide = 1;
    showSlide(currSlide);
    function button_click(num){
      showSlide((currSlide += num))
    }
    function showSlide(num){
      const slides = document.querySelectorAll(".slide");
      if(num>slides.length){
        currSlide=1;
      } if(num<1){
        currSlide = slides.length;
      }
      for(let i=0; i<slides.length; i++){
        slides[i].style.display="none";
      }slides[currSlide -1].style.display="block";
    }

  </script>
<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>
