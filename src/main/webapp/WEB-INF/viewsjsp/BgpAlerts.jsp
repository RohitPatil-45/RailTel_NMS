<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BGP Alerts</title>
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
							<h1>BGP Monitoring</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">BGP Alerts</li>
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
									<h3 class="card-title">BGP Alerts</h3>
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
												<th>Message</th>
												<th>Technician</th>
												<th>Severity</th>
												<th>last Updated</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Flap count for Peer is 2, threshold value for
													flapcount is 2</td>
												<td>Unacknowledge</td>
												<td>Critical</td>
												<td>16 Dec 2024 10:25:42 AM IST</td>
											</tr>

											<tr>
												<td>State changed from Established to Idle</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:25:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Idle to Established</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:26:42 AM IST</td>
											</tr>
											<tr>
												<td>Flap count for Peer is 3, threshold value for
													flapcount is 3</td>
												<td>Unacknowledge</td>
												<td>Critical</td>
												<td>16 Dec 2024 10:27:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Idle to Established</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:28:42 AM IST</td>
											</tr>
											<tr>
												<td>Flap count for Peer is 1, threshold value for
													flapcount is 1</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:29:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Idle to Established</td>
												<td>Unacknowledge</td>
												<td>Critical</td>
												<td>16 Dec 2024 10:30:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Established to Idle</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:31:42 AM IST</td>
											</tr>
											<tr>
												<td>Flap count for Peer is 4, threshold value for
													flapcount is 4</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:32:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Established to Idle</td>
												<td>Unacknowledge</td>
												<td>Critical</td>
												<td>16 Dec 2024 10:33:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Idle to Established</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:34:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Established to Idle</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:35:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Idle to Established</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:36:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Established to Idle</td>
												<td>Unacknowledge</td>
												<td>Critical</td>
												<td>16 Dec 2024 10:37:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Idle to Established</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:38:42 AM IST</td>
											</tr>
											<tr>
												<td>State changed from Established to Idle</td>
												<td>Unacknowledge</td>
												<td>Clear</td>
												<td>16 Dec 2024 10:39:42 AM IST</td>
											</tr>

										</tbody>
										<tfoot>
											<tr>
												<th>Message</th>
												<th>Technician</th>
												<th>Severity</th>
												<th>last Updated</th>
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
		<!-- /.content-wrapper -->
		<jsp:include page="footer.jsp" />

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
	<script src="<%=request.getContextPath()%>/webtemplate/dist/js/demo.js"></script>
	<script src="<%=request.getContextPath()%>/custom_js/addNode.js"></script>

	<!-- Page specific script -->
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
</body>
</html>
