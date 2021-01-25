<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supplier Coffee</title>
</head>
<body>
	<style>
fieldset {
	margin: 1.5em 0 0 0;
	padding: 0;
	border: 1px solid #CCC;
}
legend {
	margin-left: 1em;
	color: #009;
	font-weight: bold;
}
</style>
	<script
	src="resources/js/jquery3.5.1.min.js"></script>
	<fieldset>
		<legend>Supplier Info</legend>
		Supplier ID :<input type="text" id="supId" value="1" /><br />
		Supplier Name :<input type="text" id="supName" value="Gjun Coffee Inc.," /><br /> 
		Street :<input type="text" id="street" value="Kung Yuan 30" /><br /> 
		City :<input type="text" id="city" value="Taipei" /><br /> 
		zip :<input type="text" id="zip"	value="100" /><br /> 
		state :<input type="text" id="state" value="TW" /><br />
	</fieldset>
	<p>
	<fieldset>
		<legend>Coffee Info</legend>
		Coffee Name :<input type="text" id="cofName" value="Gjun Gold Brand" /><br />
		Sale :<input type="text" id="sales" value="300" /><br /> 
		total :<input	type="text" id="total" value="99" /><br /> 
		price :<input	type="text" id="price" value="250" /><br />
		<button id="send">Send</button>
	</fieldset>
	<div id="msg"></div>
	<script>
		$(document).ready(function() {
			$("#send").click(function() {
				var supobj = new Object();
				supobj.supId = $("#supId").val();
				supobj.supName = $("#supName").val();
				supobj.street = $("#street").val();
				supobj.city = $("#city").val();
				supobj.state = $("#state").val();
				supobj.zip = $("#zip").val();
				var cofObj = new Object();
				cofObj.cofName = $("#cofName").val();
				cofObj.suppliers = supobj;
				cofObj.sales = $("#sales").val();
				cofObj.total = $("#total").val();
				cofObj.price = $("#price").val();
				var value = JSON.stringify(cofObj);
				$.ajax("addOrder", {
					type : "post",
					data : value,
					contentType : "application/json", // 要送到server 的資料型態
					dataType : "html", // 預期從server 接收的資料型態
					success : function(data, status, jqXhr) {
						$("#msg").html(data);
					},
					error : function(data, status, errormsg) {
						$("#msg").html(errormsg);
					}
				});
			});
		});
	</script>
</body>
</html>