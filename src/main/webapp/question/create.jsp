<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Music world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'>질문등록</DIV>
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">

  <input type="hidden" name="surveyno"   id='surveyno'  value="${param.surveyno }">
  
  <div class="form-group">
     <label class="control-label col-md-3">질문답변항목</label>
     <div class="col-md-9">
       <input type='text' name='questionlist' value='' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 30%;'>
     </div>
  </div>
  

  <div class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
  </div>

</FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>