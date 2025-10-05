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

@media print {
	body {
		margin: 0;
		padding: 0;
		font-size: 12px;
	}
	.navbar, .breadcrumb, .btn, .card-header, .control-sidebar, .main-footer,
	header, aside, #spinnerTopConnChart {
		display: none !important;
	}
	.card-body, #pingChart, table {
		page-break-inside: avoid;
		break-inside: avoid;
	}
	#pingChart {
		height: auto !important;
		width: 100% !important;
		display: block !important;
		page-break-inside: avoid;
		break-inside: avoid;
	}
	canvas, svg {
		page-break-inside: avoid !important;
		break-inside: avoid !important;
		display: block !important;
		width: 100% !important;
		max-width: 100% !important;
	}
	.card {
		border: none !important;
		box-shadow: none !important;
	}
	th, td {
		font-size: 12px;
		padding: 6px;
	}
	.content-wrapper {
		padding: 0 !important;
		margin: 0 !important;
	}
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
						<div class="col-sm-6"></div>
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
									<h3 class="card-title">
										Ping Report: ${ipAddress}<span
											style="font-size: 20px; font-family: Calibri; color: black"
											id="graph_ip"></span>
									</h3>

									<button type="button" id="print" onclick="printReport()"
										style="float: right;" class="btn btn-success btn-sm">
										<i class="fa fa-print"></i>
									</button>
								</div>
								<!-- /.card-header -->
								<div>
									<h2>
										<span style="color: #0078d7;">Report for Ping</span>
									</h2>

									<table>
										<tr>
											<td class="label">Report Time Span:</td>
											<td colspan="3">${fDate}<b>-</b> ${toDate}
											</td>
										</tr>
										
										<tr>
											<td class="label">IP Address:</td>
											<td colspan="3">${ipAddress}
											</td>
										</tr>
										
										<tr>
											<td class="label">Procure Bandwidth:</td>
											<td colspan="3" id="procureBw"></td>
											</td>
										</tr>
										
										<tr>
											<td class="label">Sensor Type:</td>
											<td colspan="3">Ping (60 s Interval)</td>
										</tr>
										<!-- <tr>
											<td class="label">Probe, Group, Device:</td>
											<td colspan="3">location</td>
										</tr>
										<tr class="full-row">
											<td class="label">Uptime Stats:</td>
											<td class="value">Up: 100% <span class="bar"></span>
												[01d 05h 46m 00s]
											</td>
											<td class="value">Down: 0% <span class="bar"></span>
												[00s]
											</td>
										</tr> -->
										<tr>
											<td class="label">Probe, Group, Device:</td>
											<td colspan="3" id="probeGroupDevice"></td>
										</tr>
										<tr class="full-row">
											<td class="label">Uptime Stats:</td>
											<td class="value" id="uptimeCell">Up: ...</td>
											<td class="value" id="downtimeCell">Down: ...</td>
										</tr>
										<!-- <tr>
											<td class="label">Request Stats:</td>
											<td class="value">Good: 100% <span class="bar"></span>
												[1788]
											</td>
											<td class="value">Failed: 0% <span class="bar"></span>
												[0]
											</td>
										</tr> -->
										<tr class="full-row">
											<td class="label">Average (Ping Time):</td>
											<td colspan="3" class="value" id="pingTime">13 msec</td>
										</tr>
									</table>
								</div>
								<br>

								<div>

									<div class="card-body" id="pingChart"
										style="height: auto; width: 100%; border: 2px solid #333; border-radius: 8px; padding: 10px;">
									</div>


								</div>

								<br>
								<div>
									<div id="spinnerTopConnChart">
										<i style='margin-left: 10px; margin-top: 30%; color: blue'
											id='' class='fa fa-spinner fa-spin fa-2x'></i>
									</div>
									<table id="pingTable"
										class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Date Time</th>
												<th>Ping Time</th>
												<th>Minimum</th>
												<th>Maximum</th>
												<th>Packet Loss</th>
												<th>Downtime</th>
												<th>Coverage</th>

											</tr>
										</thead>
										<tbody>

										</tbody>
										<tfoot>
											<tr>
												<th>Averages</th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
											</tr>
										</tfoot>
									</table>

								</div>


								<br>

								<div>
									<h2>
										<span style="color: #0078d7;">Sensor Status History</span>
									</h2>
									<table id="nodeStatusTable"
										class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Status</th>
												<th>Date Time</th>
												<th>Duration</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>

							</div>
							<!-- /.card -->
						</div>
						<div class="col-md-6"></div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
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
	<script
		src="<%=request.getContextPath()%>/webtemplate/plugins/highcharts/highcharts.js"></script>

	<!-- Include jsPDF library -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/jspdf.umd.min.js"></script>

	<!-- Include html2pdf library -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/html2pdf.bundle.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/webtemplate/js/html3canvas.min.js"></script>

	<%-- <script src="<%=request.getContextPath()%>/custom_js/PingReportData.js"></script> --%>

	<script>
	var chart = "";
		$(function() {

			var location = "";
			var group = "";
			var device = "";
			var uptimeDuration = "";
			var downtimeDuration = "";
			var uptimePercent = "";
			var downtimePercent = "";
			
			
			$('#pingTable').DataTable({
			    lengthChange: false,
			    autoWidth: false,
			    data: ${data},
			    searching: false,
			    paging: false,
			    footerCallback: function (row, data, start, end, display) {
			        var api = this.api();

			        // Helper: parse numeric value from string with units
			        var intVal = function (i) {
			            if (typeof i === 'string') {
			                return parseFloat(i.replace(/[^0-9.]/g, '')) || 0;
			            }
			            return typeof i === 'number' ? i : 0;
			        };

			        // Columns to average: Ping Time, Minimum, Maximum, Packet Loss, Downtime, Coverage
			        var columns = [1, 2, 3, 4, 5, 6];
				
			        columns.forEach(function (colIdx) {
			            var total = api
			                .column(colIdx, { page: 'current' })
			                .data()
			                .reduce(function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0);

			            var count = api.column(colIdx, { page: 'current' }).data().length;
			            var average = total / count;
			            var rowCount = api.rows({ page: 'current' }).data().length;
			            $(api.column(0).footer()).html('Averages (of ' + rowCount + ' values)');
			            // Format suffix
			            var suffix = '';
			            if (colIdx >= 1 && colIdx <= 3) {
			                suffix = ' msec';
			            } else {
			                suffix = ' %';
			            }

			            // Special handling for packet loss (show <1% if <1)
			            if (colIdx === 4 && average < 1) {
			                average = '<1';
			            } else {
			                average = Math.round(average);
			            }

			            $(api.column(colIdx).footer()).html(average + suffix);
			            
			            if (colIdx === 1) {
			            	$('#pingTime').html(average + suffix);
			            }
			        });
			    },
			    initComplete: function (settings, json) {
			        $('#spinnerTopConnChart').hide();
			    },
			    drawCallback: function (settings) {
			        $('#spinnerTopConnChart').hide();
			    }
			}).buttons().container().appendTo('#pingTable_wrapper .col-md-6:eq(0)');

			
			
			$('#nodeStatusTable').DataTable({
				lengthChange : false,
				autoWidth : false,
				"data" : ${sensorData},
				"searching" : false,
				"paging" : false,
				 ordering: false,
			}).buttons().container().appendTo(
			'#nodeStatusTable_wrapper .col-md-6:eq(0)');
			
			
			//Basic info
			const report = ${report};
			if (report && report.length > 0 && report[0]) {
				const row = report[0];
	
				// Get values
				location = row[3];
				group = row[2];
				device = row[0];
				uptimeDuration = row[6];
				downtimeDuration = row[7];
				uptimePercent = row[8];
				downtimePercent = row[9];
				
				// Create text
				const uptimeText = "Up: " + uptimePercent + "% <span class=\"bar\"></span> [" + uptimeDuration + "]";
				const downtimeText = "Down: " + downtimePercent + "% <span class=\"bar\"></span> [" + downtimeDuration + "]";

				// Set by IDs
				$('#probeGroupDevice').html(location + " - "+group+" - "+device);
				$('#uptimeCell').html(uptimeText);
				$('#downtimeCell').html(downtimeText);
				$('#procureBw').html(row[10]);
			}
			
			
			//end info
			
			
			const categories = ${data}.map(row => row[0]);
		    const pingTime = ${data}.map(row => parseInt(row[1]));
		    const minLatency = ${data}.map(row => parseInt(row[2]));
		    const maxLatency = ${data}.map(row => parseInt(row[3]));
		    const packetLoss = ${data}.map(row => parseInt(row[4]));
		    const downtime = ${data}.map(row => parseInt(row[5]));
		    const coverage = ${data}.map(row => parseInt(row[6]));
		    
		    chart = Highcharts.chart('pingChart', {
		        chart: {
		          zoomType: 'xy'
		        },
		        exporting: {
		            enabled: true
		          },
		        title: {
		          text: 'Sensor: Ping'
		        },
		        subtitle: {
		          text: location + " - "+group+" - "+device
		        },
		        xAxis: [{
		          categories: categories,
		          crosshair: true,
		          labels: {
		            rotation: -45
		          }
		        }],
		        yAxis: [{ // Primary yAxis
		          labels: {
		            format: '{value} msec',
		            style: {
		              color: Highcharts.getOptions().colors[1]
		            }
		          },
		          title: {
		            text: 'msec',
		            style: {
		              color: Highcharts.getOptions().colors[1]
		            }
		          }
		        }, { // Secondary yAxis
		          title: {
		            text: '%',
		            style: {
		              color: Highcharts.getOptions().colors[0]
		            }
		          },
		          labels: {
		            format: '{value} %',
		            style: {
		              color: Highcharts.getOptions().colors[0]
		            }
		          },
		          opposite: true
		        }],
		        tooltip: {
		          shared: true
		        },
		        legend: {
		            layout: 'horizontal',
		            align: 'center',
		            verticalAlign: 'bottom',
		            floating: false,
		            backgroundColor: Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF'
		        },
		        series: [{
		          name: 'Downtime',
		          type: 'column',
		          yAxis: 1,
		          data: downtime,
		          tooltip: {
		            valueSuffix: ' %'
		          },
		          color: '#FF0000'
		        }, {
		          name: 'Packet Loss',
		          type: 'spline',
		          yAxis: 1,
		          data: packetLoss,
		          tooltip: {
		            valueSuffix: ' %'
		          },
		          color: '#BDB76B'
		        }, {
		          name: 'Ping Time',
		          type: 'area',
		          data: pingTime,
		          tooltip: {
		            valueSuffix: ' msec'
		          },
		          color: '#4682B4',
		          fillOpacity: 0.3
		        }, {
		          name: 'Minimum',
		          type: 'spline',
		          data: minLatency,
		          tooltip: {
		            valueSuffix: ' msec'
		          },
		          color: '#20B2AA'
		        }, {
		          name: 'Maximum',
		          type: 'spline',
		          data: maxLatency,
		          tooltip: {
		            valueSuffix: ' msec'
		          },
		          color: '#FF69B4'
		        }]
		      });
			
		});
		
		
		function printReport()
		{
			if (chart) {
				chart.setSize(1000, 600); // Force a fixed size
				chart.reflow();
			}

			setTimeout(function () {
				window.print();

				// Restore chart size after print (optional)
				if (chart) {
					chart.setSize(null, null); // Auto size back
					chart.reflow();
				}
			}, 1000);
		}
		
		window.onbeforeprint = function () {
		    if (chart) {
		        chart.setSize(1000, 600, false);
		        chart.reflow();
		    }
		};

		window.onafterprint = function () {
		    if (chart) {
		        chart.setSize(null, null, false); // Reset to auto-responsive
		        chart.reflow();
		    }
		};
	</script>

</body>

</html>
