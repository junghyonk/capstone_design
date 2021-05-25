<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Movie</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>



</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>
<DIV class='message'>


  <span class="span_success">${questionVO.questionlist}에 투표해주셨습니다 감사합니다.</span>
  <p>
          <button type='button' onclick="history.back()"  class="btn btn-primary">다시 돌아가기</button>
          <button type='button' onclick="location.href='./result.do?&surveyno=${param.surveyno }'" class="btn btn-primary">결과 보기</button>
          <button type='button' onclick="location.href='../survey/list.do?'"   class="btn btn-primary">설문조사 목록</button>
          <button type='button' onclick="location.href='./piechart.do?&surveyno=${param.surveyno }'" class="btn btn-primary">차트로 보기</button>
          
      


</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

