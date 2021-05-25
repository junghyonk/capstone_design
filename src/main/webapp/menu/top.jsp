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

  <div class="menu">
    <ul>
      <li><a class="active" href="${pageContext.request.contextPath}/index.do">Home</a></li>

       <li><a href="${pageContext.request.contextPath}/genre/list.do">Genre</a></li>
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
<!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>

    </div>
  <DIV class='container' style='width: 100%;'>  <!-- 상하좌우 공백 담는 컨테이너  -->
      




