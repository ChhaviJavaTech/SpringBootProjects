<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lakshmi Store</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.js"></script>


<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<c:if test="${not empty msg}">
		<script>
        // Display success message in an alert box
        sucmsg='${msg}';
        if(sucmsg=="saved succes fully"){
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: '${msg}',
            timer: 6000,
            showCancelButton: true,
            confirmButtonText: 'Download PDF'
        }).then((result) => {
          if (result.isConfirmed) {
        	  generatePDF('${bno}');
           
          }
        });
        }
        else{
        	 Swal.fire({
                 icon: 'error',
                 title: 'ERROR!',
                 text: '${msg}',
                 timer: 6000
             });
            }
    </script>
	</c:if>
	<div class="container p-2 mt-3 border border-dark">
		<h2 class="text-primary mt-2 mb-4 " align="center">Lakshmi
			Departmental Store</h2>
		<form action="./save" method="post">
			<div class="container row mb-4">
				<h4 class="text-secondary">
					<b><i><u>Customer Details</u> </i></b>
				</h4>
				<div class="col-sm-4">
					<label>Mobile No<span class="text-danger">*</span></label> <input
						class="form-control" type="text" required maxlength="12"
						onchange="getCustDetaile()" id="mob" name="mobileNo">
				</div>
				<div class="col-sm-4">
					<label>Name<span class="text-danger">*</span></label> <input
						class="form-control" type="text" id="cname" name="customerName"
						required>
				</div>
				<div class="col-sm-4">
					<label>Address<span class="text-danger">*</span></label> <input
						class="form-control" type="text" id="add" name="address" required>
				</div>
			</div>
			<div class="container row mb-4">
				<h4 class="text-secondary">
					<b><i><u>Add Product</u> </i></b>
				</h4>
				<div class="col-sm-2">
					<label>Product Id<span class="text-danger">*</span></label> <input
						class="form-control" type="number" id="pId" name="productId"
						required min=1 onChange="getProduct()">
				</div>
				<div class="col-sm-3">
					<label>Product Name<span class="text-danger">*</span></label> <input
						class="form-control" type="text" id="pname" name="productName"
						disabled="disabled">
				</div>
				<div class="col-sm-3">
					<label>Unit Price<span class="text-danger">*</span></label> <input
						class="form-control" type="text" id="up" name="unitPrice"
						disabled="disabled">
				</div>
				<div class="col-sm-2">
					<label>Quantity<span class="text-danger">*</span></label> <input
						class="form-control" type="number" id="qt" min=0 value=0>
				</div>
				<input hidden="hidden" id="maxqt">
				<div class="col-sm-2 pt-4">
					<button class="btn btn-success" onclick="addProd()" type="button">Add</button>
				</div>
			</div>

			<div class="container mx-2">
				<h4 class="text-secondary">
					<b><i><u>Product Detaile</u> </i></b>
				</h4>
				<table class='table table-striped' id="ti">
					<thead>
						<tr>
							<th>SlNo</th>
							<th>Product Name</th>
							<th>Unit Price</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<tbody>


					</tbody>
				</table>
				<input type="submit" value="Save" class="btn btn-primary">
		</form>
		<div>
			<div class="container" align="right">
				Total Price:
				<p id="p">0</p>
				Total Gst @18%:
				<p id="gst">0</p>
				--------------------------------<br> Payable Amount:
				<p id="am">0</p>
			</div>
		</div>
	</div>

	</div>
</body>
<script type="text/javascript">
function getCustDetaile() {
	  console.log("Hello");
	var mobNo = $("#mob").val(); 
	 $("#cname").val("${null}");
     $("#add").val("${null}");
	
	$.ajax({
		type : "GET",
		url : "./getCustDetaile",  
		data : "mob=" + mobNo,
		success : function(res) {
			if(res){
				
              $("#cname").val(res.customerName);
               $("#add").val(res.address);
               $("#cname").prop("disabled", true);
               $("#add").prop("disabled", true);
				}
			else{
				 $("#cname").prop("disabled", false);
	               $("#add").prop("disabled", false);
				}
			
		},
		error: function(err) {
		    // Handle error case
			 Swal.fire({
                 icon: 'error',
                 title: 'ERROR!',
                 text: err,
                 timer: 6000
             });
		  }
	});
}


function getProduct() {
	  console.log("Hello");
	var pId = $("#pId").val(); 
	 $("#pname").val("${null}");
     $("#up").val("${null}");
     $("#qt").val("${null}");
	
	$.ajax({
		type : "GET",
		url : "./getProduct",  
		data : "pId=" + pId,
		success : function(res) {
			if(res){
               $("#pname").val(res.productName);
               $("#up").val(res.unitPrice);
               $("#qt").attr("max",res.quantity);
               $("#maxqt").val(res.quantity);
				}
			else{
				Swal.fire({
	                 icon: 'error',
	                 title: 'ERROR!',
	                 text: "Wrong Product Id.Enter valid Product ID",
	                 timer: 6000
	                 
	             });
				}
			
		},
		error: function(err) {
		    // Handle error case
			 Swal.fire({
                 icon: 'error',
                 title: 'ERROR!',
                 text: err,
                 timer: 6000
             });
		  }
	});
}
function addProd(){
	var pid= $("#pId").val();
	/* var pids= $("#pids").val(); */
	var qtys= $("#qtys").val();
	var name= $("#pname").val();
	var qty=$("#qt").val();
	var up= $("#up").val();
	var maxqt= $("#maxqt").val();
	if(!(name.trim() === ''||qty.trim() === ''||qty.trim() === '')){
		if(parseInt(qty)<maxqt){
	var totalRows = $("#ti tr").length;
	var totalPric= parseInt($("#p").html())+parseInt(qty)*parseInt(up);
	var gst= parseInt(totalPric)*0.18;
	var am= gst+totalPric;
	
	$("#ti tbody").append("<tr><td>"+totalRows+"</td><td>"
	       	   +name+"</td><td>"
	       	   +up+"</td><td>"+qty+"<input hidden='hidden' name='pids' value='"+pid+"-"+qty+"'></td></tr>") ;
	$("#p").html(totalPric);
	$("#gst").html(gst);
	$("#am").html(am);
	/* $("#pids").val(pids+","+pid);
	$("#qtys").val(qtys+","+qty); */
		}else{
			Swal.fire({
				icon: 'warning',
				  title: 'Excess Quantity',
	            text: "Maximum quantity can be "+maxqt,
	            timer: 6000
	        });
			}
}
	else{
		Swal.fire({
			icon: 'warning',
			  title: 'Requird Filed Incomplete',
            text: "Enter the all product detailes!!",
            timer: 6000
        });
		}         
	
}
function generatePDF(bill){
	console.log(bill);
}
</script>
</html>