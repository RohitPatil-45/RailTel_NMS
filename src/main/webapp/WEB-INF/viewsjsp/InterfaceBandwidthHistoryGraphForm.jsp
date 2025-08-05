<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Interface BW History Graph | Graphs</title>
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

							<h1>Graph</h1>


						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>

								<li class="breadcrumb-item active">Interface Bandwidth
									History Graph</li>


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
									<h3 class="card-title">Interface Bandwidth History Graph</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<!--<form id="quickForm">-->

								<form method="post" id="reportForm">
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
													<div class="input-group">
														<form:select name="group_name" id="group_name" type="text"
															path="groupName" class="form-control select2"
															style="width: 100%;" items="${groupName}"
															onclick="groupDevices(this);" />
													</div>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">IP mask:</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="fas fa-laptop"></i></span>
														</div>
														<form:select name="ip_address" id="ip_address"
															path="groupName" class="form-control" />
													</div>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Interface Name</label> <select
														name="interface_name" id="interface_name"
														class="form-control " style="width: 100%">
													</select>

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
			<center>
				<i style='margin-left: 10px; margin-top: 30%; color: blue' id=''
					class='fa fa-spinner fa-spin fa-2x'></i>
			</center>
		</div>
		<div class="card card-default" id="graphView" style="display: none">
			<div class="card-header">
				<h3 class="card-title">
					Interface Bandwidth History Graph : <span
						style="font-size: 20px; font-family: Calibri; color: black"
						id="graph_ip"></span> <span
						style="font-size: 20px; font-family: Calibri; color: black"
						id="graph_interfaceName"></span>
				</h3>

				<div class="card-tools">

					<button type="button" id="backForm" class="btn btn-danger btn-sm">
						<i class="fa fa-backward"></i>
					</button>
					<button type="button" id="SavePngButton"
						class="btn btn-danger btn-sm">
						<i class="fa fa-file-pdf-o"></i>
					</button>
					<button type="button" id="SaveJPGButton"
						class="btn btn-warning btn-sm">
						<i class="fa fa-file-image-o"></i>
					</button>
					<button type="button" id="print" onclick="printReport()"
						class="btn btn-success btn-sm">
						<i class="fa fa-print"></i>
					</button>
				</div>
			</div>
			<!-- /.card-header -->
			<div class="card-body" id="containervlx"></div>

		</div>
		<div class="row" id="showTraffic" style="display: none;">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<table id="dataListing" class="table table-bordered table-striped"
					data-toggle="table" data-search="true" data-toolbar="#toolbar">
					<thead>
						<tr>
							<th data-sortable="true" style="text-align: center;">Label</th>
							<th data-sortable="true" style="text-align: center;">Min(KB)</th>
							<th data-sortable="true" style="text-align: center;">Max(KB)</th>
							<th data-sortable="true" style="text-align: center;">Avg(KB)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;">OUT
									Traffic</span></td>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;"
								id="min_out_traffic"></span></td>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;"
								id="max_out_traffic"></span></td>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;"
								id="avg_out_traffic"></span></td>
						</tr>
						<tr>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;">IN
									Traffic</span></td>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;"
								id="min_in_traffic"></span></td>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;"
								id="max_in_traffic"></span></td>
							<td data-sortable="true" style="text-align: center;"><span
								style="font-size: 17px; font-family: Calibri; color: black;"
								id="avg_in_traffic"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3"></div>
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
	<%-- <script src="<%=request.getContextPath()%>/custom_js/companyMaster.js"></script> --%>

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
	<script src="<%=request.getContextPath()%>/webtemplate/js/highstock.js"></script>

	<!-- Include jsPDF library -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/jspdf.umd.min.js"></script>

	<!-- Include html2pdf library -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/html2pdf.bundle.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/html3canvas.min.js"></script>


	<script
		src="<%=request.getContextPath()%>/custom_js/InterfaceBWHistoryGraph.js"></script>

</body>

</html>
