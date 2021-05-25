<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
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
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>Genre  > ${genreVO.name } 조회(수정)</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='genreno' id='genreno' value='${genreVO.genreno }'>
        
      <label> Genre</label>
      <input type='text' name='name' value="${genreVO.name }" required="required" style='width: 25%;'>
 
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' ${genreVO.visible == 'Y' ? "selected='selected'":"" }>Y</option>
        <option value='N' ${genreVO.visible == 'N' ? "selected='selected'":""}>N</option>
      </select>
       
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">Genre</TH>
      <TH class="th_bs">Date</TH>
      <TH class="th_bs">Print</TH>
      <TH class="th_bs">Etc</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="genreVO" items="${list}">
      <c:set var="genreno" value="${genreVO.genreno }" />
      <TR>
        <TD class="td_bs_left"><A href="../cate/list.do?genreno=${genreno }">${genreVO.name }</A></TD>
        <TD class="td_bs">${genreVO.rdate.substring(0, 10) }</TD>
        
        <TD class="td_bs">
          <c:choose>
            <c:when test="${genreVO.visible == 'Y'}">
              <A href="./update_visible.do?genreno=${genreno }&visible=${genreVO.visible }"><IMG src="./images/open.png" style='width: 18px;'></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?genreno=${genreno }&visible=${genreVO.visible }"><IMG src="./images/close.png" style='width: 18px;'></A>
            </c:otherwise>
          </c:choose>
        </TD>   
      
      <TD class="td_bs">
        <A href="./read_update.do?genreno=${genreno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?genreno=${genreno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
      </TD>   
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 