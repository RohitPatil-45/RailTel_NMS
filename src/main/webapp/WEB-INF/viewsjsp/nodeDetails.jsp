<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Device Details</title>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/webtemplate/dist/img/AdminLTELogo.png">

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/OfflineCss/googleapifamily.css">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/fontawesome-free/css/all.min.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/dist/css/adminlte.min.css">
<!-- SweetAlert2 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/sweetalert2/sweetalert2.min.css">

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
<!-- daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webtemplate/plugins/daterangepicker/daterangepicker.css">

<style>
.modal-dialog-slideout {
	min-height: 100%;
	margin: 0 0 0 auto;
	background: #fff;
}

.modal.fade .modal-dialog.modal-dialog-slideout {
	-webkit-transform: translate(100%, 0) scale(1);
	transform: translate(100%, 0) scale(1);
}

.modal.fade.show .modal-dialog.modal-dialog-slideout {
	-webkit-transform: translate(0, 0);
	transform: translate(0, 0);
	display: flex;
	align-items: stretch;
	-webkit-box-align: stretch;
	height: 100%;
}

.modal.fade.show .modal-dialog.modal-dialog-slideout .modal-body {
	overflow-y: auto;
	overflow-x: hidden;
}

.modal-dialog-slideout .modal-content {
	border: 0;
}

.modal-dialog-slideout .modal-header, .modal-dialog-slideout .modal-footer
	{
	height: 69px;
	display: block;
}

.modal-dialog-slideout .modal-footer .exportLatency {
	float: right;
}

.dropbtn {
	color: #3498DB;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	color: red;
}

.dropdown {
	float: right !important;
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
	background-color: #3498DB;
}

.show {
	display: block;
}

.card-header {
	background-color: dodgerblue;
}

.status-badge {
	padding: 4px 8px;
	border-radius: 4px;
	font-weight: bold;
}

.status-up {
	background-color: #28a745;
	color: white;
}

.status-down {
	background-color: #dc3545;
	color: white;
}

.add-notes-btn {
	border-radius: 2em;
	font-size: 0.8rem;
	padding: 4px 12px;
	margin-left: 10px;
}
</style>
</head>
<body class="hold-transition layout-top-nav">

	<input type="hidden" name="deviceIP" id="deviceIP"
		value='<%=request.getParameter("nodeIP")%>'>

	<div class="wrapper">

		<jsp:include page="header.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">
								Node Details
								<%=request.getParameter("nodeIP")%></h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Node Details</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-6">
							<!-- Line chart -->
							<div class="card">
								<div class="card-header border-0">
									<h3 class="card-title">Basic Information</h3>
								</div>
								<div class="card-body table-responsive p-0">
									<table class="table table-striped table-valign-middle">
										<thead>
											<tr>
												<th>Label</th>
												<th>Information</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Node IP</td>
												<td><span id="Node_ip"></span></td>
											</tr>
											<tr>
												<td>Node Name</td>
												<td><span id="NodeNAme"></span></td>
											</tr>
											<tr>
												<td>Device Name</td>
												<td><span id="DeviceName"></span></td>
											</tr>
											<tr>
												<td>Location</td>
												<td><span id="Location"></span></td>
											</tr>
											<tr>
												<td>Company Name</td>
												<td><span id="Company"></span></td>
											</tr>
											<tr>
												<td>Version</td>
												<td><span id="Version"></span></td>
											</tr>
											<tr>
												<td>Serial No.</td>
												<td><span id="SerialNo"></span></td>
											</tr>
											<tr style="display: none;">
												<td>Model</td>
												<td><span id="Model"></span></td>
											</tr>
											<tr>
												<td>District</td>
												<td><span id="District"></span></td>
											</tr>
											<tr>
												<td>Node Status</td>
												<td>
													<span id="status"></span>
													<button type="button" class="btn btn-sm btn-info add-notes-btn" id="addNotesBtn" 
															style="display: none;" data-toggle="modal" 
															data-target="#addNotesModal">
														<i class="fas fa-sticky-note"></i> Add Notes
													</button>
												</td>
											</tr>
											<tr>
												<td>Date & Time</td>
												<td><span id="datetime"></span></td>
											</tr>
											<tr>
												<td>Procured Bandwidth</td>
												<td><span id="procuredBandwidth"></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-md-6">
							<div class="card">
								<div class="card-header border-0">
									<div class="d-flex justify-content-between">
										<h3 class="card-title">Node Latency</h3>
									</div>
								</div>
								<div class="card-body">
									<div class="d-flex"></div>
									<!-- /.d-flex -->
									<div class="position-relative mb-4">
										<div id="container_latency"
											style="height: 400px; min-width: 310px"></div>
									</div>
									<div class="d-flex flex-row justify-content-end">
										<span class="mr-2"> <i
											class="fas fa-square text-primary"></i> Latency
										</span> <span> <i class="fas fa-square text-gray"></i> Packet
											Drop
										</span>
									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>

					<!-- First Row Complete -->

					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header border-0">
									<div class="d-flex justify-content-between">
										<h3 class="card-title">Node Availablity</h3>
									</div>
									<div id="dropdown" style="float: right; margin-top: -5%;">
										<div id="NodeAvailability" class="dropdown-content"
											style="margin-top: 6%; margin-left: -5%;">
											<a href="#" data-toggle="modal" data-target="#dateNodeModal">Export</a>
											<a href="#graph">Graph</a>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="d-flex">
										<p class="d-flex flex-column">
											<span class="text-bold text-lg"></span> <span>Uptime
												Over Time</span>
										</p>
										<p class="ml-auto d-flex flex-column text-right">
											<span class="text-muted">Date Wise (Avg %)</span>
										</p>
									</div>
									<div class="position-relative mb-4">
										<canvas id="sales-chart" height="200"></canvas>
									</div>
									<div class="d-flex flex-row justify-content-end">
										<span class="mr-2"> <i
											class="fas fa-square text-success"></i> Uptime
										</span> <span> <i class="fas fa-square text-danger"></i>
											Downtime
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card" style="height: 374px">
								<div class="card-header border-0">
									<h3 class="card-title">Node Status Events</h3>
								</div>
								<div class="card-body table-responsive p-0">
									<table class="table table-striped table-valign-middle"
										name="nodeStatusSummary" id="nodeStatusSummary">
										<thead>
											<tr>
												<th>Sr No.</th>
												<th>Node IP</th>
												<th>Status</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- Second Row Complete -->

					<div class="row">
						<div class="col-md-6">
							<!-- Donut chart -->
							<div class="card card-primary card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i> Memory Utilization
									</h3>
									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div id="donut-chart" style="height: 300px;"></div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</div>

						<!-- /.col-md-6 -->
						<div class="col-lg-6">
							<div class="card">
								<div class="card-header border-0">
									<h3 class="card-title">RAM</h3>
								</div>
								<div class="card-body">
									<div
										class="d-flex justify-content-between align-items-center border-bottom mb-3">
										<p class="text-success text-xl">
											<i class="ion ion-ios-refresh-empty"></i>
										</p>
										<p class="d-flex flex-column text-right">
											<span class="font-weight-bold"> <i
												class="ion ion-android-arrow-up text-success"></i><span
												id="Total_RAM"></span>
											</span> <span class="text-muted">Total RAM(MB)</span>
										</p>
									</div>
									<!-- /.d-flex -->
									<div
										class="d-flex justify-content-between align-items-center border-bottom mb-3">
										<p class="text-warning text-xl">
											<i class="ion ion-ios-cart-outline"></i>
										</p>
										<p class="d-flex flex-column text-right">
											<span class="font-weight-bold"> <i
												class="ion ion-android-arrow-up text-warning"></i><span
												id="Used_RAM"></span>
											</span> <span class="text-muted">Used RAM(MB)</span>
										</p>
									</div>
									<!-- /.d-flex -->
									<div
										class="d-flex justify-content-between align-items-center mb-0">
										<p class="text-danger text-xl">
											<i class="ion ion-ios-people-outline"></i>
										</p>
										<p class="d-flex flex-column text-right">
											<span class="font-weight-bold"> <i
												class="ion ion-android-arrow-down text-danger"></i><span
												id="Free_RAM"></span>
											</span> <span class="text-muted">Free RAM (MB)</span>
										</p>
									</div>
									<!-- /.d-flex -->
								</div>
							</div>
						</div>
						<!-- /.col-md-6 -->
					</div>

					<div class="row">
						<div class="col-6">
							<!-- interactive chart -->
							<div class="card card-primary card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="far fa-chart-bar"></i> CPU Utilization
									</h3>
								</div>
								<div class="card-body">
									<div id="interactive" style="height: 300px;"></div>
								</div>
								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> <i class="fas fa-square text-primary"></i>
										CPU Utilization
									</span>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</div>

						<div class="col-lg-6">
							<div class="card">
								<div class="card-header border-0">
									<h3 class="card-title">Interface Summary</h3>
								</div>
								<div class="card-body table-responsive p-0"
									style="height: 335px;">
									<table class="table table-striped table-valign-middle"
										name="interfaceStatusSummary" id="interfaceStatusSummary">
										<thead>
											<tr>
												<th>Sr No.</th>
												<th>Interface Name</th>
												<th>Interface IP</th>
												<th>Admin Status</th>
												<th>Operational Status</th>
												<th>Status</th>
												<th>Alias Name</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- Node Connected Device  -->
					<div class="col-lg-6">
						<div class="card">
							<div class="card-header border-0">
								<h3 class="card-title">Node Connected Devices</h3>
							</div>
							<div class="card-body table-responsive p-0">
								<table class="table table-striped table-valign-middle"
									name="ConnectedDevices" id="ConnectedDevices">
									<thead>
										<tr>
											<th>SR_NO</th>
											<th>DEV_CONNECTED_IP</th>
											<th>DEV_CONNECTED_MAC_ID</th>
											<th>DEV_CONNECTED_INTERFACE_NAME</th>
											<th>DEV_CONNECTED_CON_TYPE</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- End Node Connected Device -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Add Notes Modal -->
		<div class="modal fade" id="addNotesModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add Notes</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form id="addNotesForm">
						<div class="modal-body">
							<input type="hidden" id="notesNodeIP" name="nodeIP">
							<div class="form-group">
								<label for="notesText">Notes:</label>
								<textarea class="form-control" id="notesText" name="notes" rows="4" 
										  placeholder="Enter your notes here..." required></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Save Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Report Generation Modal -->
		<div class="modal modal-right fade bd-example-modal-lg" id="dateModal"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-slideout modal-lg"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Generate Report
							And Graph</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form method="post" id="exportNodeReportGraph">
						<div class="modal-body row">
							<div class="form-group col-6">
								<label>Report View:</label>
								<div class="input-group">
									<select type="text" id='reportGraph' name='reportGraph'
										class="form-control">
										<option value="report">Report</option>
										<option value="graph">Graph</option>
									</select>
								</div>
							</div>
							<div class="form-group col-6">
								<label>Report Date range:</label>
								<div class="input-group">
									<input type="hidden" name="deviceIP" id="deviceIP"
										value='<%=request.getParameter("nodeIP")%>'>
									<button type="button" class="btn btn-default float-right"
										id="daterange-btn1" name="daterange-btn1">
										<i class="far fa-calendar-alt"></i> Date range picker <i
											class="fas fa-caret-down"></i>
									</button>
									<input type="text" id='from_date' name='from_date'
										class="form-control" readonly required /> <input type="text"
										id='to_date' name='to_date' class="form-control" readonly
										required />
								</div>
							</div>
						</div>
						<hr />
						<div class="modal-body row" id="report">
							<div class="form-group col-12">
								<table id="example1" class="table table-bordered table-striped"
									style="width: 100%">
									<tbody>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="latency" id="latency" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="latency">
														Latency Report </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="cpu" id="cpu" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="cpu"> CPU
														Report </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="memory" id="memory" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="memory"> Memory
														Report </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="nodeStatus" id="nodeStatus" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="nodeStatus">
														Node Status Report </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="availability" id="availability" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="availability">
														Availability Report </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="cpuThreshold" id="cpuThreshold" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="cpuThreshold">
														CPU Threshold </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="memoryThreshold" id="memoryThreshold" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="memoryThreshold">
														Memory Threshold </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="report"
														value="latencyThreshold" id="latencyThreshold" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="latencyThreshold">
														Latency Threshold </label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-body row" id="graph">
							<div class="form-group col-12">
								<table id="example1" class="table table-bordered table-striped">
									<tbody>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="graph"
														value="latencyGraph" id="latencyGraph" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="latencyGraph">
														Latency Graph </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="graph"
														value="cpuGraph" id="cpuGraph" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="cpuGraph"> CPU
														Graph </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="graph"
														value="memoryGraph" id="memoryGraph" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="memoryGraph">
														Memory Graph </label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="graph"
														value="availabilityGraph" id="availabilityGraph" required>
												</div>
											</td>
											<td>
												<div class="form-check">
													<label class="form-check-label" for="availabilityGraph">
														Availability Graph </label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer" id="reportButton">
							<button type="submit" class="btn btn-primary exportLatency"
								id="exportReportLatency"
								style="background-color: dodgerblue; border-radius: 2em; width: 9em;">Generate
								report</button>
						</div>
						<div class="modal-footer" id="graphButton">
							<button type="submit" class="btn btn-primary exportLatency"
								id="exportGraphLatency"
								style="background-color: dodgerblue; border-radius: 2em; width: 9em;">Generate
								Graph</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="modal fade bd-example-modal-lg" id="dateNodeModal"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Node
							Availability Report</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form method="post" action="nodeAvailabilityReport">
						<div class="modal-body">
							<div class="form-group" id="date_div">
								<label>Report Date range:</label>
							</div>
						</div>
						<div class="modal-footer">
							<center>
								<button type="submit" class="btn btn-primary">Submit</button>
							</center>
						</div>
					</form>
				</div>
			</div>
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

	<!-- JavaScript Libraries -->
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/moment/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/datatablesJS/jquery-3.5.1.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script src="<%=request.getContextPath()%>/webtemplate/dist/js/adminlte.js"></script>
	<!-- SweetAlert2 -->
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- OPTIONAL SCRIPTS -->
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/chart.js/Chart.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/webtemplate/dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="<%=request.getContextPath()%>/webtemplate/dist/js/pages/dashboard3.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/jquery-validation/additional-methods.min.js"></script>

	<!-- DataTables  & Plugins -->
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/jszip/jszip.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

	<script src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/vfs_fonts.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/buttons.html5.min.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/datatables.net-bs/js/buttons.print.min.js"></script>

	<!-- FLOT CHARTS -->
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/flot/jquery.flot.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/flot/plugins/jquery.flot.resize.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/flot/plugins/jquery.flot.pie.js"></script>
	<script src="<%=request.getContextPath()%>/webtemplate/js/highstock.js"></script>

	<!-- date-range-picker -->
	<script src="<%=request.getContextPath()%>/webtemplate/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="<%=request.getContextPath()%>/custom_js/nodeDetails.js"></script>

	<script>
		// Function to show/hide Add Notes button based on node status
		function updateAddNotesButton(status) {
			const addNotesBtn = document.getElementById('addNotesBtn');
			const statusSpan = document.getElementById('status');
			const nodeIP = document.getElementById('deviceIP').value;
			
			// Clear existing classes
			statusSpan.className = '';
			
			// Show button only if device is down/offline
			if (status && (status.toLowerCase() === 'down' || status.toLowerCase() === 'offline')) {
				addNotesBtn.style.display = 'inline-block';
				statusSpan.classList.add('status-badge', 'status-down');
				// Store the node IP in the modal's hidden field
				document.getElementById('notesNodeIP').value = nodeIP;
			} else {
				addNotesBtn.style.display = 'none';
				statusSpan.classList.add('status-badge', 'status-up');
			}
			
			// Set the status text
			statusSpan.textContent = status;
		}

		// Handle form submission for adding notes
		$(document).ready(function() {
			$('#addNotesForm').on('submit', function(e) {
				e.preventDefault();
				
				const nodeIP = $('#notesNodeIP').val();
				const notes = $('#notesText').val().trim();
				
				if (!notes) {
					Swal.fire({
						icon: 'warning',
						title: 'Validation Error',
						text: 'Please enter some notes!',
						timer: 3000
					});
					return;
				}
				
				// Show loading state
				const submitBtn = $(this).find('button[type="submit"]');
				submitBtn.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Saving...');
				
				// AJAX call to save notes
				$.ajax({
					type: 'POST',
					url: '<%=request.getContextPath()%>/nodeDashboard/saveNodeNotes',
					data: {
						nodeIP: nodeIP,
						notes: notes
					},
					success: function(response) {
						$('#addNotesModal').modal('hide');
						$('#notesText').val(''); // Clear the textarea
						submitBtn.prop('disabled', false).html('Save Notes');
						
						Swal.fire({
							icon: 'success',
							title: 'Success!',
							text: 'Notes saved successfully!',
							timer: 3000,
							showConfirmButton: false
						});
					},
					error: function(xhr, status, error) {
						submitBtn.prop('disabled', false).html('Save Notes');
						
						Swal.fire({
							icon: 'error',
							title: 'Error',
							text: 'Failed to save notes. Please try again.',
							timer: 3000
						});
						console.error('Error saving notes:', error);
					}
				});
			});
			
			// Clear form when modal is closed
			$('#addNotesModal').on('hidden.bs.modal', function() {
				$('#notesText').val('');
				$('#addNotesForm').find('button[type="submit"]').prop('disabled', false).html('Save Notes');
			});
		});

		// Update the Basic Info AJAX call to check status
		// This should be integrated with your existing AJAX call
		// In your existing Basic Info AJAX success function, add:
		// updateAddNotesButton(data[0]['status']);

		// Rest of your existing JavaScript code...
		window.onload = function() {
			var obj = document.getElementById("deviceIP");
			var ip = obj.value;

			// Your existing AJAX calls here...
			// Interface Summary
			var l = window.location;
			var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
			var serviceUrl = base_url + "/nodeDashboard/InterfaceStatusHistoryDetails";
			var linkDetailUrl = base_url + "/dashboard/interfaceInfoPage?nodeIP=";
			$.ajax({
				type: 'GET',
				url: serviceUrl,
				data: 'ip_address=' + ip,
				dataType: 'json',
				success: function(data) {
					var htmldata;
					$.each(data, function(i, item) {
						htmldata = $('<tr>').html(
							"<td>" + data[i].srno + "</td>" + "<td><a href="
							+ linkDetailUrl + ip + "&intName="
							+ encodeURIComponent(data[i].interfaceName)
							+ ">" + data[i].interfaceName + "</a></td>"
							+ "<td>" + data[i].interfaceIP + "</td>"
							+ "<td>" + data[i].adminStatus + "</td>"
							+ "<td>" + data[i].operStatus + "</td>"
							+ "<td>" + data[i].ICMPStatus + "</td>"
							+ "<td>" + data[i].aliasName + "</td>")

						$('#interfaceStatusSummary').append(htmldata);
					});
				}
			});

			// Basic info & RAM Graph & CPU Utilization
			var serviceUrl = base_url + "/nodeDashboard/basicInfoDetails";
			$.ajax({
				type: 'GET',
				url: serviceUrl,
				data: 'ip_address=' + ip,
				dataType: 'json',
				success: function(data) {
					document.getElementById('Node_ip').textContent = data[0]['Node_ip'];
					document.getElementById('NodeNAme').textContent = data[0]['NodeNAme'];
					document.getElementById('Location').textContent = data[0]['Location'];
					document.getElementById('Company').textContent = data[0]['Company'];
					document.getElementById('District').textContent = data[0]['District'];
					
					// Update node status and show/hide Add Notes button
					updateAddNotesButton(data[0]['status']);
					
					document.getElementById('datetime').textContent = data[0]['DateTime'];
					document.getElementById('procuredBandwidth').textContent = data[0]['Procured_Bandwidth'];
					document.getElementById('Version').textContent = data[0]['Version'];
					document.getElementById('Model').textContent = data[0]['Model'];
					document.getElementById('DeviceName').textContent = data[0]['DeviceName'];
					document.getElementById('SerialNo').textContent = data[0]['SerialNo'];

					document.getElementById('Total_RAM').textContent = data[0]['Total_RAM'];
					document.getElementById('Used_RAM').textContent = data[0]['Used_RAM'];
					document.getElementById('Free_RAM').textContent = data[0]['Free_RAM'];

					/*
					 * DONUT CHART -----------
					 */
					var donutData = [{
						label: 'Used %',
						data: data[0]['Used_RAM'],
						color: '#DD1C1C'
					}, {
						label: 'Free %',
						data: data[0]['Free_RAM'],
						color: '#52ED15'
					}]
					$.plot('#donut-chart', donutData, {
						series: {
							pie: {
								show: true,
								radius: 1,
								innerRadius: 0.5,
								label: {
									show: true,
									radius: 2 / 3,
									formatter: labelFormatter,
									threshold: 0.1
								}

							}
						},
						legend: {
							show: false
						}
					})
				}
			});

			// Your other existing AJAX calls...
		};

		// Rest of your existing JavaScript functions...
	</script>
</body>
</html>