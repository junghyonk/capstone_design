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
    
    


 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>Survey</DIV>
 
  
   <div style='width: 100%;'>
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>


  </colgroup>
  <%-- table 컬럼 --%>
  <thead>  
  <TR>

    <TH class="th_bs">Topic</TH>
    <TH class="th_bs">Date</TH>


  </TR>
  </thead>
  
        <%-- table 내용 --%>
  <tbody>
  <c:forEach var="surveyVO" items="${list}">
    <c:set var="surveyno" value="${surveyVO.surveyno }" />
    <TR>
      <TD class="td_bs"><A href="../question/list.do?surveyno=${surveyno }">${surveyVO.title }</A></TD>
      <TD class="td_bs">${surveyVO.rdate.substring(0, 10) }</TD>

   
    </TR>   
  </c:forEach> 
</tbody>
    </table>
    <DIV class='bottom_menu'>${paging }</DIV>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>

 
 
 