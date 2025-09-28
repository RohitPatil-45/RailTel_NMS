<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Node Status Report | DataTables</title>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/webtemplate/dist/img/AdminLTELogo.png">
<!-- Google Font: Source Sans Pro -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/OfflineCss/googleapifamily.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">



<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/dist/css/adminlte.min.css">
<style>
#spinnerTopConnChart {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.9);
	z-index: 1000;
}

.swal2-validation-message {
	width: 112%;
	margin-left: -26px;
}
</style>
</head>
<body class="hold-transition layout-top-nav">

	<div class="wrapper">

		<!-- Navbar -->
		<jsp:include page="header.jsp" />
		<!-- /.navbar -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Node Report</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/nodeReport/deviceStatus">Node
										Status Report</a></li>
								<li class="breadcrumb-item active">View Report</li>


							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">


							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Node Status Report</h3>
									&nbsp; &nbsp; &nbsp;<b>From Date :</b> ${fdate} <b>&nbsp;
										&nbsp; &nbsp;To Date :</b> ${tdate}

								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div id="spinnerTopConnChart">
										<center>
											<i style='margin-left: 10px; margin-top: 30%; color: blue'
												id='' class='fa fa-spinner fa-spin fa-2x'></i>
									</div>

									<table id="example1" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>ID</th>
												<th>Node IP</th>
												<th>Node Status</th>
												<th>EVENT_TIMESTAMP</th>
												<th>DEVICE_NAME</th>
												<th>LOCATION</th>
												<th>DISTRICT</th>
												<th>STATE</th>
												<th>ZONE</th>
												<th>GROUP_NAME</th>
<!-- 												<th>ADD NOTES</th> -->
												<th>TIME & NOTES</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="report" items="${statusReportData}">
												<tr>
													<td>${report.ID}</td>
													<td>${report.NODE_IP}</td>
													<td>${report.NODE_STATUS}</td>
													<td>${report.EVENT_TIMESTAMP}</td>
													<td>${report.DEVICE_NAME}</td>
													<td>${report.LOCATION}</td>
													<td>${report.DISTRICT}</td>
													<td>${report.STATE}</td>
													<td>${report.ZONE}</td>
													<td>${report.GROUP_NAME}</td>
<%-- 													<td>${report.ADD_NOTES}</td> --%>
													<td>${report.VIEW_NOTES}</td>

												</tr>
											</c:forEach>

										</tbody>
										<tfoot>
											<tr>
												<th>ID</th>
												<th>Node IP</th>
												<th>Node Status</th>
												<th>EVENT_TIMESTAMP</th>
												<th>DEVICE_NAME</th>
												<th>LOCATION</th>
												<th>DISTRICT</th>
												<th>STATE</th>
												<th>ZONE</th>
												<th>GROUP_NAME</th>
<!-- 												<th>ADD NOTES</th> -->
												<th>TIME & NOTES</th>
											</tr>
										</tfoot>

									</table>


								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>

		<div class="modal fade" id="device-info-modal">
			<!-- 	style="height: 500px;" -->
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="width: fit-content;">
					<div class="modal-header">
						<h4 class="modal-title">Notes Info</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="deviceInfoBody">
						<div class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle"
								id="deviceInfoTable">
								<thead>
									<tr>
										<th>Sr No.</th>
										<th>ID</th>
										<th>Notes</th>
										<th>Date & Time</th>

									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!-- /.content-wrapper -->
		<!-- Footer  -->
		<jsp:include page="footer.jsp" />
		<!-- /. Footer -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/sweetalert2/sweetalert2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/jszip/jszip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/pdfmake/pdfmake.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->

	<!-- Page specific script -->


	<script>
	
	function addNotesClick(id) {
	    Swal.fire({
	        title: 'Add Notes',
	        html: `
	            <textarea id="notes-textarea" class="swal2-textarea" 
	                placeholder="Enter your notes here..." required></textarea>
	        `,
	        showCancelButton: true,
	        confirmButtonText: 'Add',
	        cancelButtonText: 'Cancel',
	        focusConfirm: false,
	        preConfirm: () => {
	            const notes = $('#notes-textarea').val().trim();
	            
	            // Validation: Check if notes are empty
	            if (!notes) {
	                Swal.showValidationMessage("Notes cannot be empty!");
	                return false;
	            }
	            return notes;
	        },
	        // Prevent closing on click outside
	        allowOutsideClick: () => !Swal.isLoading()
	    }).then((result) => {
	        if (result.isConfirmed) {
	            const notes = result.value;
	            var base_url = window.location.protocol + "//" + 
	                         window.location.host + "/" + 
	                         window.location.pathname.split("/")[1];
	            var serviceUrl = base_url + "/nodeReport/saveNodeStatusNotes";

	            $.ajax({
	                type: "POST",
	                url: serviceUrl,
	                data: {
	                    id: id,
	                    notes: notes
	                },
	                success: function(response) {
	                    Swal.fire({
	                        icon: 'success',
	                        title: 'Success!',
	                        text: 'Notes added successfully.',
	                        timer: 2000,
	                        showConfirmButton: false
	                    }).then(() => {
	                        location.reload();
	                    });
	                },
	                error: function(xhr) {
	                    Swal.fire({
	                        icon: 'error',
	                        title: 'Error',
	                        text: 'Failed to add notes. ' + 
	                             (xhr.responseJSON?.message || xhr.statusText)
	                    });
	                }
	            });
	        }
	    });
	}
	
	
	function viewNotesClick(id) {
		// $('#deviceInfoTable td').remove();
		var l = window.location;
		var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
		var serviceUrl = base_url + "/nodeReport/getDevicenNotesInfo";
		
		$.ajax({
			type: 'POST',
			url: serviceUrl,
			data: {
				id: id
			},
			dataType: 'json',
			success: function(data) {

				var infoModal = $('#device-info-modal');
				infoModal.modal('show');

				// Destroy the existing DataTable instance if it exists
				if ($.fn.DataTable.isDataTable('#deviceInfoTable')) {
					$('#deviceInfoTable').DataTable().clear().destroy();
				}

				// Clear the table body
				$('#deviceInfoTable tbody').empty();


				var dataTable2 = $('#deviceInfoTable').DataTable({
					autoWidth: false,
					// pageLength: 10,
					data:data,
					buttons: ["copy", "csv", "excel", "print"],
					deferRender: true, // Recommended for scroller for large
					// datasets
					"paging": false,
					destroy: true,
					deferRender: true, // Recommended for scroller for large
					// datasets
					scrollY: 500, // Set the height of the scrollable area
					scroller: true
					// Enable Scroller extension
				});

				// Append the buttons container to the desired location
				dataTable2.buttons().container().appendTo(
					'#deviceInfoTable_wrapper .col-md-6:eq(0)');

				setTimeout(function() {

					dataTable2.columns.adjust().draw();
				}, 500);

			}

		});

	}

</script>

	<!-- Page specific script 
	<script>
		$(function() {
			$('#example1').DataTable(
					{
						lengthChange : false,
						autoWidth : false,
						"pageLength" : 10,
						scrollX : true,
						scrollY : true,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ],
						"initComplete" : function(settings, json) {
							// Hide loader once the DataTable is initialized
							$('#spinnerTopConnChart').hide();
						},
						"drawCallback" : function(settings) {
							// Hide loader after each draw (page change, etc.)
							$('#spinnerTopConnChart').hide();
						}
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
		});
	</script>
	
-->


<script>
$(function() {
    $('#example1').DataTable({
        lengthChange: false,
        autoWidth: false,
        pageLength: 10,
        scrollX: true,
        scrollY: true,
        buttons: [
            "copy",
            "csv",
            {
                extend: "excelHtml5",
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: "pdfHtml5",
                orientation: "landscape",   // Landscape = wide
                pageSize: "A3",             // A3 fits more columns
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (doc) {
                    // Smaller font for more data fitting
                    doc.defaultStyle.fontSize = 7;
                    doc.styles.tableHeader.fontSize = 8;
                    doc.styles.tableHeader.alignment = 'left';

                    // Ensure table uses full width
                    var tableNode = doc.content[1].table;
                    var columnCount = tableNode.body[0].length;
                    tableNode.widths = new Array(columnCount).fill('*'); // equal column widths

                    // Reduce padding
                    var objLayout = {};
                    objLayout['hLineWidth'] = function(i) { return 0.5; };
                    objLayout['vLineWidth'] = function(i) { return 0.5; };
                    objLayout['hLineColor'] = function(i) { return '#aaa'; };
                    objLayout['vLineColor'] = function(i) { return '#aaa'; };
                    objLayout['paddingLeft'] = function(i) { return 2; };
                    objLayout['paddingRight'] = function(i) { return 2; };
                    doc.content[1].layout = objLayout;

                    // Add title at top
                    doc.content.unshift({
                        text: 'SLA Report',
                        style: 'header',
                        alignment: 'center',
                        margin: [0, 0, 0, 10],
                        fontSize: 12,
                        bold: true
                    });
                }
            },
            "print",
            "colvis"
        ],
        initComplete: function(settings, json) {
            $('#spinnerTopConnChart').hide();
        },
        drawCallback: function(settings) {
            $('#spinnerTopConnChart').hide();
        }
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
});
</script>



</body>
</html>
