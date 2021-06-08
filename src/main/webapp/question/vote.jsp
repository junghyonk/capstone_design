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
 

       <ASIDE class="aside_right">
    <A href="./create.do?surveyno=${surveyVO.surveyno }">Create new List</A>
    </ASIDE>
    
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'> 
    <FORM name='frm' method='GET' action='./voted.do' class="form-horizontal">
   
      <input type="hidden" name="surveyno" value="${surveyVO.surveyno}">
    
    <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 40%;'/>
      <col style="width: 50%;"/>

    </colgroup>
   
    <thead>  
    <TR>
    
       <TH class="th_bs">Choice</TH>
     
    </TR>
    </thead>
    
    
    
    
    
    
    
    <c:forEach var="questionVO" items="${list }">  <!-- request 객체에 접근 -->
      <c:set var="questionno" value="${questionVO.questionno}" />
      <TR>
            <c:choose>
        <c:when test="${sessionScope.id_admin == null}">
       <TD class="td_bs"><input type="radio" name=questionno value='${questionVO.questionno}' >${questionVO.questionlist }</TD>
        </c:when>
        <c:otherwise>
           <TD class="td_bs"><input type="radio" name=questionno value='${questionVO.questionno}' >${questionVO.questionlist }</TD>
         <TD class="td_bs">
          <A href="./read_update.do?questionno=${questionno }&surveyno=${param.surveyno}"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?questionno=${questionno }&surveyno=${param.surveyno}"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>
        </c:otherwise>
      </c:choose>

     
           
           
           
        </c:forEach>
 

          </tbody>
   
  </TABLE>
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="history.back()">취소</button>
    </FORM>
  </DIV>
  


 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 