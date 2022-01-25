<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="mno" value="${movieVO.mno }" />
<c:set var="title" value="${movieVO.title }" />        
<c:set var="price" value="${movieVO.price }" />
<c:set var="file1" value="${movieVO.file1 }" />
<c:set var="thumb1" value="${movieVO.thumb1 }" />
<c:set var="file1saved" value="${movieVO.file1saved }" />
<c:set var="plot" value="${movieVO.plot }" />
<c:set var="word" value="${movieVO.word }" />
<c:set var="size1_label" value="${movieVO.size1_label }" />
 
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
    $('#btn_recom').on("click", function() { update_recom_ajax(${mno}); });
    $('#btn_login').on('click', login_ajax);
    $('#btn_loadDefault').on('click', loadDefault);
  });

  function update_recom_ajax(mno) {
    // console.log('-> mno:' + mno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'mno=' + mno; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/contents/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          // console.log('-> rdata: '+ rdata);
          var str = '';
          if (rdata.cnt == 1) {
            // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
            // console.log('-> btn_recom: ' + $('#btn_recom').html());
            $('#btn_recom').html('♥('+rdata.recom+')');
            $('#span_animation').hide();
          } else {
            $('#span_animation').html("지금은 추천을 할 수 없습니다.");
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }

  function loadDefault() {
    $('#id').val('user1');
    $('#passwd').val('1234');
  } 
  
  <%-- 로그인 --%>
  function login_ajax() {
    var params = "";
    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // params += '&${ _csrf.parameterName }=${ _csrf.token }';
    // console.log(params);
    // return;
    
    $.ajax(
      {
        url: '/member/login_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
          
          if (rdata.cnt == 1) {
            $('#div_login').hide();
            // alert('로그인 성공');
            // 쇼핑카트에 insert 처리 Ajax 호출
            $('#login_yn').val("YES");
            cart_ajax_post();            
            
          } else {
            alert('로그인에 실패했습니다.<br>잠시후 다시 시도해주세요.');
            
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }
  
  <%-- 쇼핑 카트에 상품 추가 --%>
  function cart_ajax(mno) {
    var f = $('#frm_login');
    $('#mno', f).val(mno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
    
    console.log('-> mno: ' + $('#mno', f).val()); 
    
    // console.log('-> id:' + '${sessionScope.id}');
    if ('${sessionScope.id}' != '' || $('#login_yn').val() == "YES") {  // 로그인이 안되어 있다면
        cart_ajax_post();   // 쇼핑카트에 insert 처리 Ajax 호출 
      
    } else {  // 로그인 안한 경우
      
      $('#div_login').show();
    }

  }

  <%-- 쇼핑카트 상품 등록 --%>
  function cart_ajax_post() {
    var f = $('#frm_login');
    var mno = $('#mno', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
    
    var params = "";
    // params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params += 'mno=' + mno;
    params += '&${ _csrf.parameterName }=${ _csrf.token }';
    console.log('-> cart_ajax_post: ' + params);
    // return;
    
    $.ajax(
      {
        url: '/cart/create.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 쇼핑카트 등록 성공
          if (rdata.cnt == 1) {
            var sw = confirm('선택한 상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?');
            if (sw == true) {
              // 쇼핑카트로 이동
              location.href='/cart/list.do';
            }           
          } else {
            alert('선택한 상품을 장바구니에 담지못했습니다.\n잠시후 다시 시도해주세요.');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 


          
<DIV class='content_body_read'>
  <ASIDE class="aside_right">
    <A href="./create.do?mno=${mno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_search_paging.do?mno=${mno }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <form id=read_btn>
    <button type='button' id='btn_cart' class="btn btn-info" onclick="cart_ajax(${mno })">장바 구니</button>
    <span class='menu_divide' >│</span>
    <button type='button' onclick="" class="btn btn-info">관심 상품</button>
    <span class='menu_divide' >│</span>
	<button type='button' id='btn_ordering' class="btn btn-info" onclick="cart_ajax(${mno })">바로 구매</button>  
    <span id="span_animation"></span>
    </form>
  </ASIDE> 
  
<%--   <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <input type='hidden' name='cateno' value='${cateno }'>
      <c:choose>
        <c:when test="${param.word != '' }"> 검색하는 경우
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> 검색하지 않는 경우
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search.do?cateno=${cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV> --%>
  
  <DIV class='menu_line'></DIV>
  <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
  <DIV id='div_login' style='width: 80%; margin: 0px auto; display: none;'>
    <FORM name='frm_login' id='frm_login' method='POST' action='/member/login_ajax.do' class="form-horizontal">
      <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
      <input type="hidden" name="mno" id="mno" value="mno">
      <input type="hidden" name="login_yn" id="login_yn" value="NO">
      
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
        <div class="col-md-8">
          <input type='text' class="form-control" name='id' id='id' 
                     value='${ck_id }' required="required" 
                     style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          <Label>   
            <input type='checkbox' name='id_save' value='Y' 
                      ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>                   
        </div>
   
      </div>   
   
      <div class="form-group">
        <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
        <div class="col-md-8">
          <input type='password' class="form-control" name='passwd' id='passwd' 
                    value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
          <Label>
            <input type='checkbox' name='passwd_save' value='Y' 
                      ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
          </Label>
        </div>
      </div>   
   
      <div class="form-group">
        <div class="col-md-offset-4 col-md-8">
          <button type="button" id='btn_login' class="btn btn-primary btn-md">로그인</button>
          <button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-md">회원가입</button>
          <button type='button' id='btn_loadDefault' class="btn btn-primary btn-md">테스트 계정</button>
          <button type='button' id='btn_cancel' class="btn btn-primary btn-md"
                      onclick="$('#div_login').hide();">취소</button>
        </div>
      </div>   
      
    </FORM>
  </DIV>
  <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>

    <div class="read_contents">
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV style="width: 50%;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <IMG src="/movie/images/${file1saved }" style="width: 40%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/movie/images/none1.png" style="width: 40%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        
        <DIV style="width: 48%; height: 300px; float: left; margin-bottom: 60px;">
          <span style="font-size: 2em; font-weight: bold;">${title }</span><br>
          <DIV style='margin-bottom: 0px;'>${plot }</DIV>
          <DIV style='text-decoration: none;'>검색어(키워드): ${word }</DIV>
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/contents/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
          </c:if>
          <del><fmt:formatNumber value="${price}" pattern="#,###" /> 원</del><br>
        </DIV> 
      <div class="read_words">

      </div>
      <div class="li_none">
        <DIV>

        </DIV>
      </div>   
    </div>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>