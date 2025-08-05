function myFunction() {
	var change = document.getElementById("toggle");
	if (change.innerHTML == "Select All") {
		$('.checkers').each(function() {
			this.checked = true;
		});
		change.innerHTML = "Un-Select All";
	} else {
		$('.checkers').each(function() {
			this.checked = false;
		});
		change.innerHTML = "Select All";
	}
}


//Date range as a button
$('#daterange-btn').daterangepicker(
		{
			timePicker : true,
			timePickerIncrement : 10,
			ranges : {
				'Today' : [ moment().hours(0).minutes(0).seconds(0), moment().hours(23).minutes(59).seconds(59) ],
				'Yesterday' : [ moment().hours(0).minutes(0).seconds(0).subtract(1, 'days'),
						moment().hours(23).minutes(59).seconds(59).subtract(1, 'days') ],
				'Last 7 Days' : [ moment().hours(0).minutes(0).seconds(0).subtract(6, 'days'), moment().hours(23).minutes(59).seconds(59)],
				'Last 30 Days' : [ moment().hours(0).minutes(0).seconds(0).subtract(29, 'days'), moment().hours(23).minutes(59).seconds(59)],
				'This Month' : [ moment().startOf('month'),
						moment().endOf('month') ],
				'Last Month' : [
						moment().subtract(1, 'month').startOf('month'),
						moment().subtract(1, 'month').endOf('month') ]
			},
			startDate : moment().subtract(29, 'days'),
			endDate : moment()
		}, function(start, end) {
			var from_date = document.getElementById("from_date");
			from_date.value = start.format('YYYY-MM-DD HH:mm:ss');
			var to_date = document.getElementById("to_date");
			to_date.value = end.format('YYYY-MM-DD HH:mm:ss');

		})
//$('#daterange-btn').daterangepicker(
//		{
//			timePicker : true,
//			timePickerIncrement : 10,
//			ranges : {
//				'Today' : [ moment(), moment() ],
//				'Yesterday' : [ moment().subtract(1, 'days'),
//						moment().subtract(1, 'days') ],
//				'Last 7 Days' : [ moment().subtract(6, 'days'), moment() ],
//				'Last 30 Days' : [ moment().subtract(29, 'days'), moment() ],
//				'This Month' : [ moment().startOf('month'),
//						moment().endOf('month') ],
//				'Last Month' : [
//						moment().subtract(1, 'month').startOf('month'),
//						moment().subtract(1, 'month').endOf('month') ]
//			},
//			startDate : moment().subtract(29, 'days'),
//			endDate : moment()
//		}, function(start, end) {
//			var from_date = document.getElementById("from_date");
//			from_date.value = start.format('YYYY-MM-DD HH:mm:ss');
//			var to_date = document.getElementById("to_date");
//			to_date.value = end.format('YYYY-MM-DD HH:mm:ss');
//
//		})

$('#reservationtime').daterangepicker({
	timePicker : true,
	timePickerIncrement : 10,
	locale : {
		format : 'MM/DD/YYYY hh:mm:ss'
	}

}, function(start, end) {

	var from_date = document.getElementById("from_date");
	from_date.value = start.format('YYYY-MM-DD HH:mm:ss');
	var to_date = document.getElementById("to_date");
	to_date.value = end.format('YYYY-MM-DD HH:mm:ss');
});


$(function() {

	$('[data-mask]').inputmask()
	// Bootstrap Duallistbox

})





