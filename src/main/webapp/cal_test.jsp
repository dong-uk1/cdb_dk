<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.js"></script>
<style>
.fc h2 {
   font-size: 25px;
   font-weight:bold;
   margin-right:10px;
}
.fc .fc-toolbar>*>* {
    float: left;
    margin-left: 0.75em;
    display: -webkit-inline-box;
}
.fc-head {
    background-color: bisque;
    line-height: 50px;
    font-size: 15px;
    font-weight: bold;
}
.fc-content{font-size:18px; background-color:black;}
</style>
</head>
<body>
<body>
	<div style="width:80%;"id="calendar"></div>     
  <script type="text/javascript">
  $(function() {

	var hdr = {
		left: '',
		center: 'prev, title,next',
		right: '',
	};

	$('#calendar').fullCalendar({
		height: 650,
		header: hdr,
		defaultView: 'month',
		editable: false,
		droppable: false, 
		displayEventTime: false,
		dayClick: function(date, allDay) {
	},
	eventClick: function(info) {},
	select: function (start, end, allDay) {},
	events: function(start, end, timezone, callback){
		var events = [];
		var tglCurrent = $('#calendar').fullCalendar('getDate');

		$.ajax({
			type: "POST",
			dataType: "json",
			url: "test.php",
			cache: false,
			async: false,
			success: function(result) {
				$.each(result.rows, function(index, item){
					events.push({title:item.ContentId, start: new Date(item.start), end: new Date(item.start), Score:item.Score});
				});
				callback(events);
			}
		});
	},
	eventRender: function (event, element, icon) {
		if(event.Score != '' && typeof event.Score  !== "undefined"){
			element.find(".fc-title").append("<br/><b>"+event.Score+"</b>");
		}
	},
	windowResize: function (event, ui) {
		$('#calendar').fullCalendar('render');
	}
	});
  });
  </script>
</body>

</body>

</html>