<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 글 + 이미지 조회하는 경우 참고  --%>

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
  // 첨부 이미지 출력, dir: ../attachfile/storage/, ./storage/main_images/
  function panel_img(dir, file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">"; // 이미지 감추기
    tag += "  <IMG src='" + dir + file + "' style='width: 100%;'>";
    tag += "</A>";

    $('#attachfile_panel').html(tag);  // 문자열을 태그로 적용
    $('#attachfile_panel').show();      // 패널 출력
  }

</script>

<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_delete_youtube').on('click', youtube_delete_send); 
    // $('#btn_delete_mp3').on('click', mp3_delete_send);
    // $('#btn_delete_mp4').on('click', mp4_delete_send);
  });

  function youtube_delete_modal() {
    $('#modal_panel_youtube').modal();              // 다이얼로그 출력
  }
  
  // jQuery ajax 요청
  function youtube_delete_send () {
    // alert('삭제 진행');
    // return;
    
    var frm = $('#frm_youtube');  // Youtube 삭제 폼
    var contentsno = $('#contentsno', frm).val();
    var passwd = $('#passwd', frm).val();
    
    var params = 'contentsno=' + contentsno + '&passwd=' + passwd;
    var msg = '';
  
    $.ajax({
      url: './passwd.do',
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
          
        if (rdata.cnt > 0) { // 패스워드 일치
          frm.submit();
        } else {  // 패스워드 불일치
          msg = "패스워드가 일치하지 않습니다.";
          
          $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
          $('#modal_title').html('패스워드 에러'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
  }

</script>
</head>

<body>
<c:set var="genreno" value="${genreVO.genreno}" />
<c:set var="contentsno" value="${contentsVO.contentsno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <!-- Modal Youtube 삭제 요청 시작 -->
  <div class="modal fade" id="modal_panel_youtube" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">Youtube 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p>
            <form name='frm_youtube' id='frm_youtube' action='./youtube_delete.do'
                      method='POST'>
              <input type='hidden' name='genreno' id='genreno' value='${genreno }'>                      
              <input type='hidden' name='contentsno' id='contentsno' value='${contentsno }'>
              삭제된 Youtube 영상 관련 정보는 복구 할 수 없습니다.<br>
              <input type='password' class="form-control" name='passwd' id='passwd' value='' placeholder="패스워드" style='width: 20%;'>
            </form>
          </p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" id="btn_delete_youtube" class="btn btn-danger" data-dismiss="modal">삭제</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal Youtube 삭제 요청  종료 -->

  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
    
  <DIV class="title_line">
    ${contentsVO.title}
  </DIV>
  <ASIDE class="aside_left">

  </ASIDE>
  <ASIDE class="aside_right">
    <A href="./create.do">글 등록</A>
    <c:choose>
      <c:when test="${contentsVO.file1.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='./img_update.do?genreno=${genreno }&contentsno=${contentsno}'>메인 이미지 변경/삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./img_create.do?genreno=${genreno }&contentsno=${contentsno}'>메인 이미지 등록</A>     
      </c:otherwise>
    </c:choose>    
    <span class='menu_divide' > | </span>
    <A href='../attachfile/create.do?contentsno=${contentsno }&genreno=${genreno }'>첨부 파일 등록</A>
    <span class='menu_divide' > | </span>
    <A href='../attachfile/list_by_contentsno.do?contentsno=${contentsno }&genreno=${genreno }'>첨부 파일 삭제</A>

    <span class='menu_divide' > | </span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?genreno=${genreno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?genreno=${genreno }&contentsno=${contentsno}'>수정</A>
    
     
    <c:choose>
      <c:when test="${contentsVO.youtube.trim().length() > 0 }">
        <span class='menu_divide' > | </span> 
        <A href='javascript:youtube_delete_modal()'>Youtube 삭제</A>     
      </c:when>
      <c:otherwise>
        <span class='menu_divide' > | </span> 
        <A href='./youtube_create.do?genreno=${genreno }&contentsno=${contentsno}'>Youtube 등록</A>     
      </c:otherwise>
    </c:choose>    
    
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?genreno=${genreno }&contentsno=${contentsno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="contentsno" value="${contentsno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${contentsVO.title}</span>
            (<span>${contentsVO.recom}</span>)
            <span>${contentsVO.rdate.substring(0, 16)}</span>
          </li>
          
          <%-- ********** 첨부 파일 이미지 목록 출력 시작 ********** --%>
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 70%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;' >
            <c:set var="file1" value="${contentsVO.file1.toLowerCase() }" />
            <c:if test="${file1.endsWith('jpg') || file1.endsWith('png') || file1.endsWith('gif')}">
              <A href="javascript:panel_img('./storage/main_images/', '${contentsVO.file1 }')"><IMG src='./storage/main_images/${contentsVO.thumb1 }' style='margin-top: 2px; width: 120px; height: 80px;'></A>
            </c:if>
            
            <c:forEach var="attachfileVO" items="${attachfile_list }">
              <c:set var="thumb" value="${attachfileVO.thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('../attachfile/storage/', '${attachfileVO.fname }')"><IMG src='../attachfile/storage/${attachfileVO.thumb }' style='margin-top: 2px; width: 120px; height: 80px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          <%-- ********** 첨부 파일 이미지 목록 출력 종료 ********** --%>
                    
          <li class="li_none">
            <DIV>${contentsVO.content }</DIV>
          </li>
          <li class="li_none">
            ${contentsVO.web }
          </li>

 
          

            <li class='li_none' style='clear: both;'>
              <DIV style='width:30%; height:30%;  text-align: center;'>
               ${contentsVO.youtube}
              </DIV>
            </li>
        
                    
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              검색어(키워드): ${contentsVO.word }
            </DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>