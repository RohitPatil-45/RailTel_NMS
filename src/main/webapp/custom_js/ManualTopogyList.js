$(document).ready(function() {

	//	alert("dsd")
	getview_topology();
})


function getview_topology() {

	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceUrl = base_url + "/nodeReport/getview_topology";
	//	
	$.ajax({
		type: 'POST',
		url: serviceUrl,
		dataType: "JSON",
		success: function(data) {



			// Initialize DataTable
			var table = $('#topologyTable').DataTable({
				"responsive": true,
				data: data,
				"lengthChange": true,
				"autoWidth": false,
				"pageLength": 25,
				"buttons": [
					'copy', 'csv', 'excel', 'pdf', 'print', 'colvis'
				],
				"initComplete": function(settings, json) {
					$('#spinnerTopConnChart').hide();
				}
			});

			// Add buttons to container
			table.buttons().container().appendTo('#topologyTable_wrapper .col-md-6:eq(0)');


		}

	})
}

function Deleteview_topology(id) {
	Swal.fire({
		title: 'Are you sure?',
		text: "Do you really want to delete this topology?",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#3085d6',
		confirmButtonText: 'Yes, delete it!'
	}).then((result) => {
		if (result.isConfirmed) {
			var l = window.location;
			var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
			var serviceUrl = base_url + "/nodeReport/Deleteview_topology";

			$.ajax({
				type: 'POST',
				url: serviceUrl,
				//				dataType: "JSON",
				data: { id: id },
				success: function(data) {
//					alert("data ::" + data)
					if (data === "success") {
						Swal.fire(
							'Deleted!',
							'Topology deleted successfully.',
							'success'
						).then(() => {
							location.reload(); // Reload the page or refetch the table
						});
					} else {
						Swal.fire(
							'Error!',
							data,
							'error'
						);
					}
				},
				error: function(xhr, status, error) {
					Swal.fire(
						'Error!',
						'Something went wrong while deleting. Please try again.',
						'error'
					);
				}
			});
		}
	});
}

