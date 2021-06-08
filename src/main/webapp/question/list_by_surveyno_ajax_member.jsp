<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Movie</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function() {
  $('#btn_send').on('click', send);
}); 

function send() {
  // alert('send() execute.');
  // return;
  
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './create_ajax.do');
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  // var params = 'contentsno=' + ${param.contentsno};
  var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './create_ajax.do', // spring execute
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.cnt > 0) {
        msg = "『" + $('#questionlist').val() + "』 Question 를 등록했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + $('#questionlist').val() + "』 Question  등록에 실패했습니다."
      }
      $('#panel1').html(msg); // 메시지 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR\n';
      msg += 'request.status: '+request.status + '\n';
      msg += 'message: '+error;
      console.log(msg);
    }
  });
    
  // 처리중 출력
  var gif = '';
  gif +="<div style='margin: 0px auto; text-align: center;'>";
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function update_form(questionno) {
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './read_ajax.do');
  $("#btn_send").off("click");
  $('#btn_send').on('click', update_proc);
      
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = 'questionno=' + questionno;
  // var params = 'contentsno=' + ${param.contentsno};
  // var params = $('#frm_create').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './read_ajax.do', // spring execute
    type: 'get',  // post, get
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      var frm = $('#frm');
      $('#questionno', frm).val(rdata.questionno);
      $('#questionlist', frm).val(rdata.questionlist);



      $('#btn_send').html('수정');
      
      $('#panel1').hide(); // 숨기기    
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR\n';
      msg += 'request.status: '+request.status + '\n';
      msg += 'message: '+error;
      console.log(msg);
    }
  });
    
  // 처리중 출력
  var gif = '';
  gif +="<div style='margin: 0px auto; text-align: center;'>";
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function cancel() {
  $('#questionno', frm).val(0);
  $('#name', frm).val('');
  $('#visible', frm).val('Y');

  $('#btn_send').html('등록');

  $('#panel1').html('');
  $('#panel1').hide();
}

function update_proc() {
  // alert('update_proc() execute.');
  // return;
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './update_ajax.do');
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  // var params = 'contentsno=' + ${param.contentsno};
  var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './update_ajax.do', // spring execute
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.cnt > 0) {
        msg = "『" + $('#questionlist').val() + "』 장르 를 수정했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + $('#questionlist').val() + "』 장르  수정에 실패했습니다."
      }
      $('#panel1').html(msg); // 메시지 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR\n';
      msg += 'request.status: '+request.status + '\n';
      msg += 'message: '+error;
      console.log(msg);
    }
  });
    
  // 처리중 출력
  var gif = '';
  gif +="<div style='margin: 0px auto; text-align: center;'>";
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function delete_form(questionno) {
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './read_ajax.do');
      
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = 'questionno=' + questionno;
  // var params = 'contentsno=' + ${param.contentsno};
  // var params = $('#frm_create').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './read_ajax.do', // spring execute
    type: 'get',  // post, get
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.questionlist.length > 0) {
        msg = "『" + rdata.questionlist + "』 장르 를 삭제하시겠습니까?<br>";
        msg += "장르 를 삭제하면 복구 할 수 없습니다.";
        msg += " <button type=\"button\" onclick=\"delete_proc("+questionno+", '"+rdata.questionlist+"')\">삭제 진행</button>";
        msg += " <button type='button' onclick='cancel()'>취소</button>";
      } else {
        msg = "『" + rdata.questionlist + "』 장르 정보가 없습니다.";
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      }
      $('#panel1').html(msg); // 메시지 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR\n';
      msg += 'request.status: '+request.status + '\n';
      msg += 'message: '+error;
      console.log(msg);
    }
  });
    
  // 처리중 출력
  var gif = '';
  gif +="<div style='margin: 0px auto; text-align: center;'>";
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

function delete_proc(questionno, questionlist) {
  // alert('update_proc() execute.');
  // return;
  // $('#btn_close').attr("data-focus", "이동할 태그 지정");
  
  // var frm = $('#frm'); // id가 frm인 태그 검색
  // $('#frm').attr('action', './update_ajax.do');
  // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
  var params = 'questionno=' + questionno;
  // var params = 'questionno=' + ${param.questionno};
  // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
  // alert('params: ' + params);
  // return;

  var msg = '';
  $.ajax({
    url: './delete_ajax.do', // spring execute
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.cnt > 0) {
        msg = "『" + questionlist + "』 장르 를 삭제했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + questionlist + "』 장르  삭제에 실패했습니다."
      }
      $('#panel1').html(msg); // 메시지 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR\n';
      msg += 'request.status: '+request.status + '\n';
      msg += 'message: '+error;
      console.log(msg);
    }
  });
    
  // 처리중 출력
  var gif = '';
  gif +="<div style='margin: 0px auto; text-align: center;'>";
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
    
  $('#panel1').html(gif);
  $('#panel1').show(); // 출력 */    
}

</script>



 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />

      
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'> 
    <FORM name='frm' method='GET' action='./voted.do' class="form-horizontal">
   
      <input type="hidden" name="surveyno" value="${surveyVO.surveyno}">
    
    <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 90%;'/>

    </colgroup>
   
    <thead>  
    <TR>
    
       <TH class="th_bs">Choice</TH>
     
    </TR>
    </thead>
    
    <c:forEach var="questionVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="questionno" value="${questionVO.questionno}" />
      <TR>
          <TD class="td_bs">
<input type="radio" name=questionno value='${questionno}' >${questionVO.questionlist }</TD>
       </TR>
       
        </c:forEach>
 

          </tbody>
   
  </TABLE>
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="history.back();">취소</button>
    </FORM>
  </DIV>
  


 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 