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
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='questionno' id='questionno' value="${questionVO.questionno }">
      <input type='hidden' name='surveyno' id='surveyno' value="${questionVO.surveyno }">
      
      <label> 설문조사 번호</label>:${questionVO.questionno }&nbsp;
      <label>질문 번호</label>: ${questionVO.surveyno }" &nbsp;
      <label>질문 답변</label>: ${questionVO.questionlist } &nbsp;

      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="history.back()">취소</button>
    </FORM>
  </DIV>
  
   <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style="width: 20%;"/>
      <col style='width: 30%;'/>

    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">설문조사 번호</TH>
      <TH class="th_bs">질문번호</TH>
      <TH class="th_bs">답변</TH>

    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="questionVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="questionno" value="${questionVO.questionno}" />
      <TR>
        <TD class="td_bs">${questionVO.surveyno }</TD>
        <TD class="td_bs">${questionVO.questionno }</TD>
        <TD class="td_bs_left">${questionVO.questionlist }</TD>

        <TD class="td_bs">
          <A href="./read_update.do?questionno=${questionno }&surveyno=${surveyno}"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?questionno=${questionno }&surveyno=${surveyno}"><span class="glyphicon glyphicon-trash"></span></A>
  
        </TD>             
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 