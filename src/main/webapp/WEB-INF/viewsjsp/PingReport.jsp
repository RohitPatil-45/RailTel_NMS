<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Ping | Report</title>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/webtemplate/dist/img/AdminLTELogo.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

.searchRow {
	display: none;
}

#spinnerTopConnChart {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.9);
	z-index: 1000;
}

    body {
      font-family: Arial, sans-serif;
      font-size: 14px;
      margin: 20px;
    }
    h2 {
      color: #0078d7;
      margin-bottom: 10px;
    }
    table {
      border-collapse: collapse;
      width: 90%;
      margin-top: 10px;
    }
    td, th {
      padding: 8px 10px;
      vertical-align: top;
    }
    .label {
      width: 150px;
      font-weight: bold;
      white-space: nowrap;
    }
    .bar {
      display: inline-block;
      background-color: #b6d7a8;
      width: 40px;
      height: 10px;
      margin-left: 5px;
      vertical-align: middle;
    }
    .value {
      white-space: nowrap;
    }
    .full-row {
      border-top: 1px solid #ccc;
    }
</style>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/OfflineCss/googleapifamily.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/fontawesome-free/css/all.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/daterangepicker/daterangepicker.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<!-- BS Stepper -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/bs-stepper/css/bs-stepper.min.css">
<!-- dropzonejs -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/dropzone/min/dropzone.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/dist/css/adminlte.min.css">

<!-- daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/daterangepicker/daterangepicker.css">


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<!-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatablesCSS/jquery.dataTables.css">-->

<!-- DataTables -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/css/fixedHeader.dataTables.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/css/select.dataTables.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/css/buttons.dataTables.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/css/colReorder.dataTables.min.css">

</head>




<body class="hold-transition layout-top-nav">


	<div class="wrapper">

		<!-- Navbar -->
		<jsp:include page="header.jsp" />
		<!-- /.navbar -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" id="graphFormDiv">


			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">

							<h1>Ping Report</h1>


						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>

								<li class="breadcrumb-item active">Ping Report</li>


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
						<!-- left column -->
						<div class="col-md-12">
							<!-- jquery validation -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Ping</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<!--<form id="quickForm">-->

								<form method="post" action="pingReportData">
									<div class="card-body">
										<div class="row">


											<div class="col-md-6">

												<div class="form-group" id="date_div">
													<label>Report Date range:</label>

													<div class="input-group">
														<button type="button" class="btn btn-default float-right"
															id="daterange-btn" name="daterange-btn">
															<i class="far fa-calendar-alt"></i> Date range picker <i
																class="fas fa-caret-down"></i>
														</button>
														<input type="text" id='from_date' name='from_date'
															class="form-control" readonly /> <input type="text"
															id='to_date' name='to_date' class="form-control" readonly />
													</div>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Group Name</label>
													<form:select name="group_name" id="group_name" type="text"
														path="groupName" class="form-control select2"
														style="width: 100%;" items="${groupName}"
														onclick="groupDevices(this);" />
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">IP mask:</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="fas fa-laptop"></i></span>
														</div>
														<form:select name="ip_address" id="ip_address" type="text"
															path="groupName" class="form-control select2" />
													</div>
												</div>

											</div>

										</div>

									</div>

									<div class="card-footer" style="display: flex;">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>



							</div>
							<!-- /.card -->
						</div>
						<!--/.col (left) -->
						<!-- right column -->
						<div class="col-md-6"></div>
						<!--/.col (right) -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<div id="spinnerTopConnChart" style="display: none;">
			<i style='margin-left: 10px; margin-top: 30%; color: blue' id=''
				class='fa fa-spinner fa-spin fa-2x'></i>
		</div>
		<div class="card card-default" id="graphView" style="display: none">
			<div class="card-header">
				<h3 class="card-title">
					Ping : <span
						style="font-size: 20px; font-family: Calibri; color: black"
						id="graph_ip"></span>
				</h3>
			</div>
			<!-- /.card-header -->
			<div>
				<h2>
					 <span style="color: #0078d7;">Report for Ping</span>
				</h2>

				<table>
					<tr>
						<td class="label">Report Time Span:</td>
						<td colspan="3">11/20/2024 6:13:00 AM – 11/21/2024 12:00:00
							PM</td>
					</tr>
					<tr>
						<td class="label">Sensor Type:</td>
						<td colspan="3">Ping (60 s Interval)</td>
					</tr>
					<tr>
						<td class="label">Probe, Group, Device:</td>
						<td colspan="3">Local Probe &gt; TASMAC &gt; Tamil Nadu State
							Marketing Corporation Limited/ Perungudi(hub location)
							ERP-ID:1367798 B/W:1G DOP:29-05-2024 RF36729</td>
					</tr>
					<tr class="full-row">
						<td class="label">Uptime Stats:</td>
						<td class="value">Up: 100% <span class="bar"></span> [01d 05h
							46m 00s]
						</td>
						<td class="value">Down: 0% <span class="bar"></span> [00s]
						</td>
					</tr>
					<tr>
						<td class="label">Request Stats:</td>
						<td class="value">Good: 100% <span class="bar"></span> [1788]
						</td>
						<td class="value">Failed: 0% <span class="bar"></span> [0]
						</td>
					</tr>
					<tr class="full-row">
						<td class="label">Average (Ping Time):</td>
						<td colspan="3" class="value">13 msec</td>
					</tr>
				</table>
			</div>
			<div class="card-body" id="containervlx"></div>

		</div>

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
		src="<%=request.getContextPath()%>/webtemplate/plugins/moment/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatablesJS/jquery-3.5.1.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- jquery-validation -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/jquery-validation/additional-methods.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->

	<!-- Sweet Alert -->

	<!-- date-range-picker -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/daterangepicker/daterangepicker.js"></script>


	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- Page specific script -->
	<script src="<%=request.getContextPath()%>/custom_js/companyMaster.js"></script>

	<!-- Select2 -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/select2/js/select2.full.min.js"></script>

	<!-- <script src="<%=request.getContextPath()%>/webtemplate/datatablesJS/jquery.dataTables.js"></script>-->


	<!-- DataTables -->
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net/js/jquery.dataTables.min.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/dataTables.bootstrap.min.js"></script> --%>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net/js/dataTables.fixedHeader.js"></script>

	<%-- <script src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/dataTables.editor.min.js"></script> --%>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/dataTables.select.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/dataTables.colReorder.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/dataTables.buttons.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/jszip.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/vfs_fonts.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/buttons.html5.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/buttons.print.min.js"></script>


	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/inputmask/jquery.inputmask.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/highcharts/highcharts.js"></script>

	<!-- Include jsPDF library -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/jspdf.umd.min.js"></script>

	<!-- Include html2pdf library -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/html2pdf.bundle.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/html3canvas.min.js"></script>
	<script src="<%=request.getContextPath()%>/custom_js/PingReport.js"></script>

</body>

</html>
