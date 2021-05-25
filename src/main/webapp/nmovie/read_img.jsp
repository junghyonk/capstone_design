<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 글 + 이미지 조회하는 경우 참고  --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>movie</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<c:set var="nos" value="${nmovieVO.nos }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    ${nmovieVO.titles}
  </DIV>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do'>목록</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="nos" value="${nos}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${nmovieVO.titles}</span>
             <DIV style="width: 40%; height:20%;float: left; margin-right: 10px">개봉일:${nmovieVO.odates}</DIV>
          </li>
          <li class="li_none">
            <c:set var="file1" value="${nmovieVO.file1.toLowerCase() }" />
            <c:if test="${file1.endsWith('jpg') || file1.endsWith('png') || file1.endsWith('gif')}">
              <DIV style="width: 30%; height:20%;float: left; margin-right: 10px;">
                <IMG src="./storage/main_images/${nmovieVO.file1 }" style="width: 100%;">
              </DIV> 
            </c:if> 

            <DIV style="width: 40%; height:20%;float: left; margin-right: 10px;">
            줄거리1:<br>
              ${nmovieVO.infos }
              </DIV>

         
          </li>
          <li class="li_none">
          
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

