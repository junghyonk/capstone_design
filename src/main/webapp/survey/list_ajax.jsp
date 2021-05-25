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

  var params = $('#frm').serialize(); 

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
        msg = "『" + $('#title').val() + "』 생성 완료."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + $('#title').val() + "』 Survey 등록에 실패했습니다."
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

function update_form(surveyno) {

  $("#btn_send").off("click");
  $('#btn_send').on('click', update_proc);
      

  var params = 'surveyno=' + surveyno;


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
      $('#surveyno', frm).val(rdata.surveyno);
      $('#title', frm).val(rdata.title);
      $('#rdate', frm).val(rdata.rdate);


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
  $('#surveyno', frm).val(0);
  $('#title', frm).val('');


  $('#btn_send').html('등록');

  $('#panel1').html('');
  $('#panel1').hide();
}

function update_proc() {

  var params = $('#frm').serialize();


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
        msg = "『" + $('#title').val() + "』 을 수정했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + $('#title').val() + "』 Survey 수정에 실패했습니다."
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

function delete_form(surveyno) {

      

  var params = 'surveyno=' + surveyno;


  var msg = '';
  $.ajax({
    url: './read_ajax.do', // spring execute
    type: 'get',  // post, get
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if (rdata.title.length > 0) {
        msg = "『" + rdata.title + "』 Survey을 삭제하시겠습니까?<br>";
        msg += "Survey을 삭제하면 복구 할 수 없습니다.";
        msg += " <button type=\"button\" onclick=\"delete_proc("+surveyno+", '"+rdata.title+"')\">삭제 진행</button>";
        msg += " <button type='button' onclick='cancel()'>취소</button>";
      } else {
        msg = "『" + rdata.title + "』 카테고리 정보가 없습니다.";
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

function delete_proc(surveyno, title) {

  var params = 'surveyno=' + surveyno;


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
        msg = "『" + title + "』 Survey을 삭제했습니다."
        msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
      } else {
        msg = "『" + title + "』 Survey 삭제에 실패했습니다."
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
 
  <DIV class='title_line'>Survey</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm' id='frm' method='POST' action="">

        <input type='hidden' name='surveyno' id='surveyno' value='0'>
            
            
      <label>제목</label>
      <input type='text' name='title' id='title' value='' required="required" style='width: 25%;'>
 
       
      <button type="button" id='btn_send'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
    
    
    
  </DIV>
  <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto; display: none;"></DIV> 
  
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
     <col style='width: 20%;'/>

  </colgroup>
  <%-- table 컬럼 --%>
  <thead>  
  <TR>
      <TH class="th_bs">번호</TH>
    <TH class="th_bs">제목</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">기타</TH>

  </TR>
  </thead>
  
        <%-- table 내용 --%>
  <tbody>
  <c:forEach var="surveyVO" items="${list}">
    <c:set var="surveyno" value="${surveyVO.surveyno }" />
    <TR>
      <TD class="td_bs">${surveyVO.surveyno }</TD>
      <TD class="td_bs"><A href="../question/vote.do?surveyno=${surveyno }">${surveyVO.title }</A></TD>
      <TD class="td_bs">${surveyVO.rdate.substring(0, 10) }</TD>
        <td style='text-align: center;'>
          <A href="javascript:update_form(${surveyno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="javascript:delete_form(${surveyno })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
         </td>
      
 
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 