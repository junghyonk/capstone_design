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
 
  <DIV class='title_line'>Survey</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>

        
      <label>제목</label>
      <input type='text' name='title' value='' required="required" style='width: 25%;'>
 
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
  
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
      <TD class="td_bs"><A href="../cate/list.do?surveyno=${surveyno }">${surveyVO.title }</A></TD>
      <TD class="td_bs">${surveyVO.rdate.substring(0, 10) }</TD>
        <td style='text-align: center;'>
        <A href="./read_update.do?surveyno=${surveyno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?surveyno=${surveyno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
         </td>
      
 
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 <DIV class='bottom_menu'>${paging }</DIV>
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 