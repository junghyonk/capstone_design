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
 

<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);


function drawChart(surveyno) {
  var params = 'surveyno='+${param.surveyno};
  var msg = '';
  $.ajax({
    url: './pie.do', // spring execute
    type: 'get',  // post, get
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if(rdata.list!=null){
      
        drawChartTemp(rdata);
      }
    }
  , 
  // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른 경우
  error: function(request, status, error) {
    var msg = 'EEROR\n';
    msg += 'request.status: ' + request.status + '\n';
    msg += 'message: ' + error;
    console.log(msg);
  }
});
}


function drawChartTemp(rdata){

 var arrLength=rdata.list.length;

         var chart_data = new Array();
         for(var i=0;i<arrLength;i++){
           if(rdata.list[i] != null){
             chart_data.push([rdata.list[i].questionlist, rdata.list[i].questioncnt]);
           }
         }

         console.log(chart_data);
         var data = new google.visualization.DataTable();
         data.addColumn('string', 'Task');
         data.addColumn('number', 'Hours per Day');
         for ( i = 0; i < chart_data.length; i++) {
           data.addRow(chart_data[i]);
         }
                 
    var  options = {
      title: 'RESULTS'
    };
   var  chart = new google.visualization.PieChart(document.getElementById('piechart'));
    
    chart.draw(data, options);
  
    }

</script>
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
    <div id="piechart"  style="width: 900px; height: 500px;margin:auto;"></div>
<DIV class='message'>

           <button type='button' onclick="history.back()"  class="btn btn-primary">다시 돌아가기</button>
          <button type='button' onclick="location.href='./result.do?&surveyno=${param.surveyno }'" class="btn btn-primary">투표 결과 보기</button>
          <button type='button' onclick="location.href='../survey/list.do?'"   class="btn btn-primary">설문조사 목록</button>
          </DIV>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>