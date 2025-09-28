$(function() {
	view_topology();
})


function view_topology() {
	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/"
		+ l.pathname.split('/')[1];
	var serviceUrl = base_url + "/nodeReport/getview_topology";
	$.ajax({
		type: 'POST',
		url: serviceUrl,
//		data: 'ip_address=' + ipArray
//			+ '&from_date=' + $('#from_date').val()
//			+ '&to_date=' + $('#to_date').val(),
		dataType: 'json',
		success: (function(eventData) {
			//alert(eventData);
			$('#reportForm').hide();
			$('#reportDiv').show();
			$('#setSpinner').hide();
			$('#fDate').html($('#from_date').val());
			$('#tDate').html($('#to_date').val());
			var table = $('#example1').DataTable({
				lengthChange: false,
				autoWidth: false,
				"pageLength": 5,
				"data": eventData,
				scrollX: true,
				scrollY: true,
				"buttons": ["copy", "csv", "excel", "pdf", "print",
					"colvis"],
			}).buttons().container().appendTo(
				'#serviceReportTable_wrapper .col-md-6:eq(0)');
		})
	})
}

	}
}