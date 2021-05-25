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
   
  </DIV>
  
   <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style="width: 20%;"/>
      <col style='width: 30%;'/>

    </colgroup>
   
    <thead>  
    <TR>
       <c:choose>
    <c:when test="${sessionScope.adminid != null}">
      <TH class="th_bs">설문조사 번호</TH>
      <TH class="th_bs">질분번호</TH>
      <TH class="th_bs">답변</TH>
    </c:when>
       <c:otherwise>
       <th style='text-align: center;'>투표 결과</TH>
       </c:otherwise>
          </c:choose>
    </TR>
    </thead>
    
    <tbody>
    
    
    
    <c:forEach var="questionVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="questionno" value="${questionVO.questionno}" />
      <TR>
      
       <c:choose>
        <c:when test="${sessionScope.adminid != null}">
        <TD class="td_bs">${questionVO.surveyno }</TD>
        <TD class="td_bs">${questionVO.questionno }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?questionno=${questionno }&surveyno=${param.surveyno}"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?questionno=${questionno }&surveyno=${param.surveyno}"><span class="glyphicon glyphicon-trash"></span></A>
                </td>
                </c:when>
                  <c:otherwise>
                          <td style="text-align: center;heigth:100px;">${questionVO.questionlist }(${questionVO.questioncnt })표</TD>
                   </c:otherwise>
                  </c:choose>
          
      </TR>
    </c:forEach>
    </tbody>
   
  </TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 