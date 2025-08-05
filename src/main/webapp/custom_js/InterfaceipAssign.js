$(function () {
	getdataofipassign();
	
});

function getInterface(ip) {

	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceUrl = base_url + "/interfaceReport/getInterfaceNameByIP";

	$.ajax({
		url : serviceUrl,
		type : 'GET',
		data : 'ip_address=' + ip

	}).done(
			function(data) {
				// alert(data)
				var pollingHost = data;
				var d = pollingHost.split("~");

				var length = d.length;
				// alert(length)

				var html;
				// html += '<option value="">---Please
				// Select---</option>';
				for (var i = 0; i < length; i++) {

					// alert(d1);
					if (d[i] == 'NA') {

					} else {
						html += '<option value="&apos;' + d[i] + '&apos;">'
								+ d[i] + '</option>';
					}
				}

				html += "</select>";
				// alert(html)
				document.getElementById("interface_name").innerHTML = html;

			});
	
	

}

function getdataofipassign(){
// alert("inside get data");
	
	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceUrl = base_url + "/nodeReport/getinterfaceassigndata";

	$.ajax({
		url : serviceUrl,
		type : 'GET',
		dataType : 'json',
		

	}).done(
			function(data4) {
				
				  var table = $("#interfaIpAssignTable").DataTable({
				        lengthChange: false,
				        autoWidth: false,
				        data: data4,
				        pageLength: 5,
				        scrollX: true,
				        scrollY: true,
				      });
				      table.buttons().container().appendTo("#interfaIpAssignTable_wrapper .col-sm-6:eq(0)");
				
			});
	
	
}

$(function() {
	$.validator.setDefaults({
		submitHandler : function() {
			// alert( "Form successful submitted!" +$('#ip_address').val());
			// document.getElementById("graph_ip").innerHTML = $('#ip_address')
			// .val();
			generateGraph();

		}
	});
	$('#reportForm').validate({
		rules : {

			ip_address : {

				required : true

			},
			interface_name : {

				required : true

			},
			Interface_ip : {

				required : true

			}

		},
		messages : {
			ip_address : {
				required : "Please enter a IP address",

			},
			interface_name : {

				required : "Please select a interface name",

			},
			Interface_ip : {

				required : "Please enter a Interface IP address",

			},

			terms : "Please accept our terms"
		},
		errorElement : 'span',
		errorPlacement : function(error, element) {
			error.addClass('invalid-feedback');
			element.closest('.form-group').append(error);
		},
		highlight : function(element, errorClass, validClass) {
			$(element).addClass('is-invalid');
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).removeClass('is-invalid');
		}
	});
});

function printReport() {
	alert("Print");
	$("#print").hide()
	window.print();
	// window.location.reload();
	$("#print").show()
}

$(function() {
	$("#backForm").click(function() {
		$("#graphFormDiv").show();
		$("#graphView").hide();
	});

	$("#SavePngButton").click(function() {

		html2canvas($("#graphView"), {
			onrendered : function(canvas) {
				// alert("onrendered emthod: ")
				canvas.toBlob(function(blob) {
					// you can changename
					var name = "BandwidthGraph.pdf";
					var imgData = canvas.toDataURL(blob);
					var doc = new jsPDF('p', 'mm');
					doc.addImage(imgData, 'PNG', 8, 10, 198, 105);
					doc.save(name);
				});
			}
		});
	});
});

$(function() {

	$("#SaveJPGButton").click(function() {

		html2canvas($("#graphView"), {
			onrendered : function(canvas) {
				// alert("onrendered emthod: ")
				canvas.toBlob(function(blob) {
					// you can changename
					saveAs(blob, "BandwidthGraph.jpeg");
				});
			}
		});
	});
});

// Date range as a button
$('#daterange-btn').daterangepicker(
		{
			timePicker : true,
			timePickerIncrement : 10,
			ranges : {
				'Today' : [ moment().hours(0).minutes(0).seconds(0),
						moment().hours(23).minutes(59).seconds(59) ],
				'Yesterday' : [
						moment().hours(0).minutes(0).seconds(0).subtract(1,
								'days'),
						moment().hours(23).minutes(59).seconds(59).subtract(1,
								'days') ],
				'Last 7 Days' : [
						moment().hours(0).minutes(0).seconds(0).subtract(6,
								'days'),
						moment().hours(23).minutes(59).seconds(59) ],
				'Last 30 Days' : [
						moment().hours(0).minutes(0).seconds(0).subtract(29,
								'days'),
						moment().hours(23).minutes(59).seconds(59) ],
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

function groupDevices(option) {
	var grpname = option.value;
	var l = window.location;
	var ipMask = null;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split("/")[1];
	var serviceUrl = base_url + "/nodeReport/getGroupDeviceLists";
	$.ajax({
		type : "get",
		dataType : "json",
		url : serviceUrl,
		data : "groupName=" + grpname,
	}).done(
			function(data5) {
				ipMask = data5;

				var optionsString = "<option value=''>Please Select</option>";
				$.each(ipMask, function(index, value) {
					optionsString += '<option value="' + value + '">' + value
							+ '</option>';
				});

				$('#ip_address').html(optionsString).select2();
				$('#ip_address').val("").trigger('change');
			});
}

$("#ip_address").change(
		function() {
			var ip = $(this).val();
			var l = window.location;
			var interFaceName = null;
			var base_url = l.protocol + "//" + l.host + "/"
					+ l.pathname.split("/")[1];
			var serviceUrl = base_url + "/nodeReport/getInterFaceNameLists";
			$.ajax({
				type : "get",
				dataType : "json",
				url : serviceUrl,
				data : "ip=" + ip,
			}).done(
					function(data5) {
						interFaceName = data5;

						var optionsString = '';
						$.each(interFaceName, function(index, value) {
							optionsString += '<option value="' + value + '">'
									+ value + '</option>';
						});

						$('#interface_name').html(optionsString).select2();
						$('#interface_name').val(interFaceName[0]).trigger(
								'change');
					});
		});

function generateGraph() {
	// alert("generate Graph")
	$("#spinnerTopConnChart").show()

	$.ajax({
		type : 'POST',
		url : 'interfaceipassignhere',
// dataType : 'json',
		data : 'ip_address=' + $('#ip_address').val() + '&Interface_ip='
				+ $('#Interface_ip').val() + '&interface_name='
				+ $('#interface_name').val(),
		success : function(jsondata) {
			
			  if(jsondata=== "success"){
					Swal.fire({
					position: 'top',
					icon: 'success',
					title: 'Interface IP Updated Successfully',
					showConfirmButton: true,
					timer: 3000
					})
					
					.then(() => {
						 var l = window.location;
						   var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
						  window.location.href =base_url+"/nodeReport/InterfaceIpAssign";

						})
							      
							    }else{
							    	 
							    	Swal.fire({
							    		  position: 'top',
							    		  icon: 'warning',
							    		  title: 'Failed',
							    		  showConfirmButton: false,
							    		  timer: 3000
							    		})
									     
								    }

		}

	});

}
$(function() {

	$('#SavePngButton').click(function() {
		var element = $('#containervlx')[0];

		html2pdf(element, {
			margin : 15,
			filename : 'InterfaceAvailability.pdf',
			image : {
				type : 'jpeg',
				quality : 0.98
			},
			html2canvas : {
				scale : 2
			},
			jsPDF : {
				unit : 'mm',
				format : 'a4',
				orientation : 'portrait'
			}
		});
	});

	$('#SaveJPGButton').click(function() {
		var element = $('#containervlx')[0];

		html2canvas(element, {
			scale : 2, // You can adjust the scale as needed
		}).then(function(canvas) {
			var link = document.createElement('a');
			link.href = canvas.toDataURL('image/png');
			link.download = 'InterfaceAvailability.png';
			link.click();
		});
	});

	$("#backForm").click(function() {
		$("#graphFormDiv").show();
		$("#graphView").hide();
	});

});