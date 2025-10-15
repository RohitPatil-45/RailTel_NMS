<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Device SLA Report | DataTables</title>
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
							<h1>Device SLA Report - Working Hours Report</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/nodeReport/slaReportForm">Device
										SLA Report</a></li>
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
									<h3 class="card-title">Device SLA Report</h3>
									&nbsp; &nbsp; &nbsp;<b>From Date :</b> ${fdate} <b>&nbsp;
										&nbsp; &nbsp;To Date :</b> ${tdate}

								</div>
								<!-- /.card-header -->
								<div class="card-body">


									<table id="example1" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Sr No</th>
												<th>NODE IP</th>
												<th>Device Name</th>
												<th>Group Name</th>
												<th>Location</th>
												<th>UPTIME</th>
												<th>DOWN</th>
												<th>UPTIME HOURS</th>
												<th>DOWN HOURS</th>
												<th>Total HOURS</th>
												<th>UPTIME(%)</th>
												<th>DOWNTIME(%)</th>
												<th>YEARLY COST</th>
												<th>PENALTY(%)</th>
												<th>PENALTY COST(Rs)</th>
												<th>NEED TO PAY COST(Rs)</th>


											</tr>
										</thead>
										<tbody>

										</tbody>
										<tfoot>
											<tr>
												<th>Sr No</th>
												<th>NODE IP</th>
												<th>Device Name</th>
												<th>Group Name</th>
												<th>Location</th>
												<th>UPTIME</th>
												<th>DOWN</th>
												<th>UPTIME HOURS</th>
												<th>DOWN HOURS</th>
												<th>Total HOURS</th>
												<th>UPTIME(%)</th>
												<th>DOWNTIME(%)</th>
												<th>YEARLY COST</th>
												<th>PENALTY(%)</th>
												<th>PENALTY COST(Rs)</th>
												<th>NEED TO PAY COST(Rs)</th>
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

	<!-- Page specific script 
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						data : ${slaReportData},
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
		}); 
	</script>
	
	-->

<!-- 	<script> 
$(function() {
    $("#example1").DataTable({
        data: ${slaReportData},
        responsive: true,
        lengthChange: false,
        autoWidth: false,
        buttons: [
            "copy",
            "csv",
            "excel",
            {
                extend: 'pdfHtml5',
                orientation: 'landscape',
                pageSize: 'A3',
                title: '', // disable default title (we’ll add our own)
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (doc) {
                    // Get your dynamic values from JSP
                    var reportTitle = "Device SLA Report";
                    var fromDate = "${fdate}";
                    var toDate = "${tdate}";
                    
                    // Add header at the top of PDF
                    doc.content.splice(0, 0, {
                        margin: [0, 0, 0, 12],
                        alignment: 'center',
                        stack: [
                            { text: reportTitle, fontSize: 14, bold: true, margin: [0, 5, 0, 5] },
                            { text: 'From Date: ' + fromDate + '     To Date: ' + toDate, fontSize: 10, margin: [0, 2, 0, 5] }
                        ]
                    });

                    // Reduce font size for the table
                    doc.defaultStyle.fontSize = 8;
                    doc.styles.tableHeader.fontSize = 9;
                    doc.styles.tableHeader.alignment = 'left';

                    // Add subtle borders
                    var objLayout = {};
                    objLayout['hLineWidth'] = function(i) { return .5; };
                    objLayout['vLineWidth'] = function(i) { return .5; };
                    objLayout['hLineColor'] = function(i) { return '#aaa'; };
                    objLayout['vLineColor'] = function(i) { return '#aaa'; };
                    objLayout['paddingLeft'] = function(i) { return 4; };
                    objLayout['paddingRight'] = function(i) { return 4; };
                    doc.content[1].layout = objLayout;
                }
            },
            "print",
            "colvis"
        ]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
});
</script>
-->

<script>
$(function() {
    $("#example1").DataTable({
        data: ${slaReportData},
        responsive: true,
        lengthChange: false,
        autoWidth: false,
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'copy',
                title: '',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'csv',
                title: '',
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (csv) {
                    // Add custom header to CSV
                    var customHeader = 'Customer Name:\tTamil Nadu State Marketing Corporation\n' +
                                     'Event Timestamp\n' +
                                     '\tfrom\tto\n' +
                                     'Date\t' + "${fdate}" + '\t' + "${tdate}" + '\n' +
                                     'No. of Days\t' + calculateDays("${fdate}", "${tdate}") + '\n\n';
                    return customHeader + csv;
                }
            },
            {
                extend: 'excel',
                title: '',
                filename: 'Device_SLA_Report',
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (xlsx) {
                    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                    
                    // Get the sheet data
                    var sheetData = $('sheetData', sheet);
                    
                    // First, let's find and store the original table header and data
                    var originalRows = $('row', sheetData).toArray();
                    
                    // Clear the sheet data
                    sheetData.empty();
                    
                    // Add custom header rows
                    var customRows = [
                        // Row 1: Customer Name
                        '<row r="1">' +
                        '<c r="A1" t="inlineStr"><is><t>Customer Name:</t></is></c>' +
                        '<c r="B1" t="inlineStr"><is><t>Tamil Nadu State Marketing Corporation</t></is></c>' +
                        '</row>',
                        
                        // Row 2: Event Timestamp
                        '<row r="2">' +
                        '<c r="A2" t="inlineStr"><is><t>Event Timestamp</t></is></c>' +
                        '</row>',
                        
                        // Row 3: from/to headers
                        '<row r="3">' +
                        '<c r="A3" t="inlineStr"><is><t></t></is></c>' +
                        '<c r="B3" t="inlineStr"><is><t>from</t></is></c>' +
                        '<c r="C3" t="inlineStr"><is><t>to</t></is></c>' +
                        '</row>',
                        
                        // Row 4: Dates
                        '<row r="4">' +
                        '<c r="A4" t="inlineStr"><is><t>Date</t></is></c>' +
                        '<c r="B4" t="inlineStr"><is><t>' + "${fdate}" + '</t></is></c>' +
                        '<c r="C4" t="inlineStr"><is><t>' + "${tdate}" + '</t></is></c>' +
                        '</row>',
                        
                        // Row 5: No. of Days
                        '<row r="5">' +
                        '<c r="A5" t="inlineStr"><is><t>No. of Days</t></is></c>' +
                        '<c r="B5" t="inlineStr"><is><t>' + calculateDays("${fdate}", "${tdate}") + '</t></is></c>' +
                        '</row>',
                        
                        // Row 6: Empty row for spacing
                        '<row r="6"></row>'
                    ];
                    
                    // Add custom rows to sheet
                    customRows.forEach(function(rowHtml) {
                        sheetData.append(rowHtml);
                    });
                    
                    // Now add the original table data, adjusting row numbers
                    var rowOffset = 6; // We added 6 custom rows
                    
                    originalRows.forEach(function(row, index) {
                        var $row = $(row);
                        var newRowNumber = index + rowOffset + 1;
                        
                        // Update row number
                        $row.attr('r', newRowNumber);
                        
                        // Update all cell references in this row
                        $('c', $row).each(function() {
                            var $cell = $(this);
                            var cellRef = $cell.attr('r');
                            var column = cellRef.replace(/[0-9]/g, '');
                            var newCellRef = column + newRowNumber;
                            $cell.attr('r', newCellRef);
                        });
                        
                        sheetData.append($row);
                    });
                }
            },
            {
                extend: 'pdfHtml5',
                orientation: 'landscape',
                pageSize: 'A3',
                title: '',
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (doc) {
                    // Get your dynamic values
                    var fromDate = "${fdate}";
                    var toDate = "${tdate}";
                    var daysCount = calculateDays(fromDate, toDate);
                    
                    // Add custom header at the top of PDF
                    doc.content.splice(0, 0, {
                        margin: [0, 0, 0, 12],
                        alignment: 'left',
                        table: {
                            widths: ['auto', '*', 'auto', '*'],
                            body: [
                                [
                                    { text: 'Customer Name:', bold: true, fontSize: 10 },
                                    { text: 'Tamil Nadu State Marketing Corporation', fontSize: 10, colSpan: 3 },
                                    {},
                                    {}
                                ],
                                [
                                    { text: 'Event Timestamp', bold: true, fontSize: 10, colSpan: 4 },
                                    {},
                                    {},
                                    {}
                                ],
                                [
                                    { text: '', fontSize: 9 },
                                    { text: 'from', bold: true, fontSize: 9, alignment: 'center' },
                                    { text: 'to', bold: true, fontSize: 9, alignment: 'center' },
                                    { text: '', fontSize: 9 }
                                ],
                                [
                                    { text: 'Date', bold: true, fontSize: 9 },
                                    { text: fromDate, fontSize: 9, alignment: 'center' },
                                    { text: toDate, fontSize: 9, alignment: 'center' },
                                    { text: '', fontSize: 9 }
                                ],
                                [
                                    { text: 'No. of Days', bold: true, fontSize: 9 },
                                    { text: daysCount.toString(), fontSize: 9, alignment: 'center' },
                                    { text: '', fontSize: 9, colSpan: 2 },
                                    {}
                                ]
                            ]
                        },
                        layout: {
                            hLineWidth: function(i, node) { return 0.5; },
                            vLineWidth: function(i, node) { return 0.5; },
                            hLineColor: function(i, node) { return '#aaaaaa'; },
                            vLineColor: function(i, node) { return '#aaaaaa'; },
                            paddingLeft: function(i, node) { return 4; },
                            paddingRight: function(i, node) { return 4; }
                        }
                    });

                    // Add spacing after the header
                    doc.content.splice(1, 0, {
                        text: '',
                        margin: [0, 10, 0, 0]
                    });

                    // Reduce font size for the main data table
                    doc.defaultStyle.fontSize = 8;
                    doc.styles.tableHeader.fontSize = 9;
                    doc.styles.tableHeader.alignment = 'left';

                    // Add borders to main table
                    var objLayout = {};
                    objLayout['hLineWidth'] = function(i) { return 0.5; };
                    objLayout['vLineWidth'] = function(i) { return 0.5; };
                    objLayout['hLineColor'] = function(i) { return '#aaa'; };
                    objLayout['vLineColor'] = function(i) { return '#aaa'; };
                    objLayout['paddingLeft'] = function(i) { return 4; };
                    objLayout['paddingRight'] = function(i) { return 4; };
                    
                    if (doc.content[2] && doc.content[2].table) {
                        doc.content[2].layout = objLayout;
                    }
                }
            },
            {
                extend: 'print',
                title: '',
                exportOptions: {
                    columns: ':visible'
                },
                customize: function (win) {
                    // Add custom header for print
                    $(win.document.body).prepend(
                        '<div style="margin-bottom: 20px; border: 1px solid #ddd; padding: 10px;">' +
                        '<table style="width: 100%; border-collapse: collapse;">' +
                        '<tr><td style="border: 1px solid #ddd; padding: 5px; font-weight: bold; width: 120px;">Customer Name:</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px;" colspan="3">Tamil Nadu State Marketing Corporation</td></tr>' +
                        '<tr><td style="border: 1px solid #ddd; padding: 5px; font-weight: bold;" colspan="4">Event Timestamp</td></tr>' +
                        '<tr><td style="border: 1px solid #ddd; padding: 5px;"></td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px; font-weight: bold; text-align: center;">from</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px; font-weight: bold; text-align: center;">to</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px;"></td></tr>' +
                        '<tr><td style="border: 1px solid #ddd; padding: 5px; font-weight: bold;">Date</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px; text-align: center;">' + "${fdate}" + '</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px; text-align: center;">' + "${tdate}" + '</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px;"></td></tr>' +
                        '<tr><td style="border: 1px solid #ddd; padding: 5px; font-weight: bold;">No. of Days</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px; text-align: center;">' + calculateDays("${fdate}", "${tdate}") + '</td>' +
                        '<td style="border: 1px solid #ddd; padding: 5px;" colspan="2"></td></tr>' +
                        '</table>' +
                        '</div>'
                    );
                }
            },
            "colvis"
        ]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
});

// Helper function to calculate days between two dates
function calculateDays(fromDate, toDate) {
    try {
        var from = new Date(fromDate);
        var to = new Date(toDate);
        var timeDiff = Math.abs(to.getTime() - from.getTime());
        var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
        return daysDiff + 1; // Including both start and end dates
    } catch (e) {
        return 'N/A';
    }
}

// Helper function to get Excel column name from index
function getExcelColumn(columnIndex) {
    var column = '';
    while (columnIndex > 0) {
        var remainder = (columnIndex - 1) % 26;
        column = String.fromCharCode(65 + remainder) + column;
        columnIndex = Math.floor((columnIndex - 1) / 26);
    }
    return column;
}
</script>

</body>
</html>
