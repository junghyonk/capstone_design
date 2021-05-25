<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Movie</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

 <!-- Fotorama -->
<link href="./menu/fotorama.css" rel="stylesheet">
<script src="./menu/fotorama.js"></script>

 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  
<div class="fotorama" data-width="500" align="center"data-autoplay="3000" >
  
    <IMG src='./menu/images/a.jpg' style='width: 100%; height: 50%;'>
    <IMG src='./menu/images/b.jpg' style='width: 100%;height: 50%;'>
    <IMG src='./menu/images/c.jpg' style='width: 100%;height: 50%;'>
    <IMG src='./menu/images/d.jpg' style='width: 100%;height: 50%;'>


  </DIV>
  
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
 
</body>
</html>