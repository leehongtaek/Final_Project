<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<!-- JQuery UI -->
<script src="<c:url value='/resources/plugin/jquery-ui-1.11.4.custom/external/jquery/jquery.js' />" ></script>
<script src="<c:url value='/resources/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js' />"></script>

<!--  -->     
<link href="<c:url value='/resources/plugin/classycountdown/css/jquery.classycountdown.min.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/resources/plugin/classycountdown/js/jquery.knob.js' />"></script>
<script src="<c:url value='/resources/plugin/classycountdown/js/jquery.throttle.js' />"></script>
<script src="<c:url value='/resources/plugin/classycountdown/js/jquery.classycountdown.min.js' />"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<!--  -->
<script src="<c:url value='/resources/plugin/easy-pie-chart-master/dist/jquery.easypiechart.js' />"></script>


<script type="text/javascript" id="code">
$(function() {      
	      
var Limit_Time =( (new Date('2015-12-31').getTime()) - (new Date().getTime()) ) / 1000;
$('.countdown').ClassyCountdown({
	theme: "flat-colors-very-wide",                 
	end: ($.now()+Limit_Time) // 남은 시간 
});
			                 	
});  

$(function () {

    $(document).ready(function () {

        // Build the chart
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {  
                text: ''
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'TASK DONE',
                    y: 80.33
                }, {
                    name: 'TASK UNDONE',
                    y: 24.03,
                    sliced: true,
                    selected: true
                }]
            }]
        });
    });
});


$(function() {
    $('.chart1').easyPieChart({
    	barColor: '#f8835e', 
		trackColor: '#f9f9f9',
		scaleColor: '#dfe0e0',
		scaleLength: 5, 
		lineCap: 'round',
		lineWidth: 20, 
		trackWidth: undefined,
		size: 150,
		rotate: 0,
		animate: {
			duration: 2000,
			enabled: true
		}
    });
}); 
$(function() {
    $('.chart2').easyPieChart({
    	barColor: '#f8835e', 
		trackColor: '#f9f9f9',
		scaleColor: '#dfe0e0',
		scaleLength: 5, 
		lineCap: 'round',
		lineWidth: 20, 
		trackWidth: undefined,
		size: 150,
		rotate: 0,
		animate: {
			duration: 2000,
			enabled: true
		}
    });
}); 
$(function() {
    $('.chart3').easyPieChart({
    	barColor: '#f8835e', 
		trackColor: '#f9f9f9',
		scaleColor: '#dfe0e0',
		scaleLength: 5, 
		lineCap: 'round',
		lineWidth: 20, 
		trackWidth: undefined,
		size: 150,
		rotate: 0,
		animate: {
			duration: 2000,
			enabled: true
		}
    });
}); 
</script>          
<style type="text/css">
                                       
#panel_total_member{background-color: rgba(0, 150, 136, 0.8) !important;}
#panel_total_member .panel-title{color: #FFFFFF;}
#panel_countdown {background-color: #e91e63 !important;}
#panel_countdown .panel-title{color: #FFFFFF;}
    
</style>


<div class="container">  
	
	
	<div class="col-sm-4">    
		<div class="panel">                           
			<div id="panel_total_member" class="panel-heading" >
				<h3 class="panel-title"><strong>TOTAL MEMBER</strong></h3>
			</div>
			<div class="panel-body">
				<div class="col-sm-8">   
					<div id="container"                         
						style="min-width: 100%; height: 174px; width: 200px max-width: 200px; margin: 0 auto"></div>
				</div>
                
			</div>
		</div>
	</div>    
	    
	<div class="col-sm-8">
	 
		<div class="panel">      
			<div id="panel_countdown" class="panel-heading" >
				<h3 class="panel-title"><strong>COUNT DOWN</strong> </h3>
			</div>
			<div class="panel-body">           
					<!-- countdown start -->    
					<div class="countdown" style="width: 100%; height: 100%;"></div>
					<!--./ countdown end -->
			</div>  
		</div>
		<!-- <h4> LIMIT YEAR </h4>   -->

	</div>


	<div class="col-sm-4">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"><strong>TOTAL MEMBER </strong> </h3>
			</div>
			<div class="panel-body">
				<div class="chart1" data-percent="73" data-scale-color="#ffb400">73%</div>
			</div>
		</div>
	</div>

	<div class="col-sm-4">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">TASK 완료율</h3>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<div class="chart2" data-percent="73" data-scale-color="#ffb400">73%</div>
				</div>

			</div>                                  
		</div>
	</div> 
	<div class="col-sm-4">
		<div class="panel panel-primary">
			<div class="panel-heading">   
				<h3 class="panel-title">REPORT 완료율</h3>
			</div>
			<div class="panel-body">     
				<div class="col-sm-12">
					<div class="chart3" data-percent="73" data-scale-color="#ffb400">73%</div>
				</div>

			</div>                          
		</div>
	</div>




</div>





