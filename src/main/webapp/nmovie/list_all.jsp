<%@ page contentType="text/html; charset=UTF-8"%>
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
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">
    Now Playing
  </DIV>
  <ASIDE class="aside_left">
    TOP 1~30
  </ASIDE>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
  <div style='width:110%;margin 0 auto; '>
   
    <c:forEach var="nmovieVO" items="${list }" varStatus="status">
          <c:set var="nos" value="${nmovieVO.nos }" />
          <c:set var="file1" value="${nmovieVO.file1 }" />
          
      <%--하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 8 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 10%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #FFFFFF; '>
        <c:choose>
              <c:when test="${file1.endsWith('jpg') || file1.endsWith('png') || file1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?nos=${nos}">               
                  <IMG src="./storage/main_images/${file1 }" style='width: 100%; height: 100%;'>
                </a><br>
               <p> ${nmovieVO.titles}</p>
                개봉일:${nmovieVO.odates}
              </c:when>

          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?nmovieno=${nmovieno}">
              <img src='./images/none1.png' style='width: 100%; height: 150px;'>
            </a><br>
             ${nmovieVO.titles}       
             
          </c:otherwise>    
                        </c:choose>
      </DIV>  
    </c:forEach>
        

    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


