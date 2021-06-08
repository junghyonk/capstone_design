<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
// String root = request.getContextPath(); // /resort 
// ${pageContext.request.contextPath}
%>

<link href="css/style.css" rel="stylesheet" type="text/css">
<!--가로형 3단 드롭다운 메뉴-->

 <!-- 화면 상단 메뉴 -->
  <div id="header">
    <div class="first_header">
      <div class="first_header_inner">
        <ul class="etc">
        <!--  회원 로그인 섹션 -->
           <c:choose>
             <c:when test="${sessionScope.id == null}">
               <a href="${pageContext.request.contextPath}/member/create.do">Create Account  </a> /
               <a href="${pageContext.request.contextPath}/member/login.do">  Login </a>
             </c:when>
             <c:otherwise>
               ${sessionScope.id } <a href='${pageContext.request.contextPath}/member/logout.do' >Logout</a>
             </c:otherwise>
           </c:choose>      
           <!--  회원 로그인 섹션  종료-->
         </ul>
       </div>
     </div>
   </div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">MultiFlex</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/index.do">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Genre
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=1">Action</a></li>
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=2">Comedy</a></li>
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=3">Drama</a></li>
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=4">Fantasy</a></li>
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=5">Horror</a></li>
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=6">Mystery</a></li>
           <li><a href="${pageContext.request.contextPath}/contents/list.do?genreno=7">Romance</a></li>
        </ul>
      </li>
      <li><a href="${pageContext.request.contextPath}/contents/list_all.do">Movie</a></li>
       <li><a href="${pageContext.request.contextPath}/nmovie/list.do">Now Playing</a></li>
       <li><a href="${pageContext.request.contextPath}/survey/list.do">Survey</a></li>
       <!--  관리자 섹션 -->
      <c:choose>
        <c:when test="${sessionScope.id_admin == null}">
        
          <li > <A href='${pageContext.request.contextPath}/admin/login.do' >Admin Login</A></li>

        </c:when>
        <c:otherwise>
          <li>  <A href='${pageContext.request.contextPath}/admin/logout.do' >${sessionScope.id } Logout</A></li>
          <li> <A  href='${pageContext.request.contextPath}/member/list.do'>MemberList</A></li>
          <li> <A  href='${pageContext.request.contextPath}/reply/list.do'>Reply List</A></li>
        </c:otherwise>
      </c:choose>
        <!--  관리자 섹션 종료 -->
    </ul>
</div>

</nav>

       
       
       
       
   

<!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>

    </div>
  <DIV class='container' style='width: 100%;'>

      




