<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supplier</title>
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
</head>
<body>
	<script src="resources/js/jquery3.5.1.min.js"></script>
	<fieldset>
		<legend>Supplier Info</legend>
		Supplier ID :<input type="text" id="supId" value="1" /><br />
		Supplier Name :<input type="text" id="supName" value="Gjun Coffee Inc.," /><br /> 
		Street :<input type="text" id="street" value="Kung Yuan 30" /><br /> 
		City :<input type="text" id="city" value="Taipei" /><br /> 
		zip :<input type="text" id="zip" value="100" /><br /> 
		state :<input type="text" id="state" value="TW" /><br />
	</fieldset>
	<button id="send">Send</button>
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
				var value = JSON.stringify(supobj);
				$.ajax("addSupplier", {
					type : "post",
					data : value,
					// 要送到server 的資料型態
					contentType : "application/json",
					// 預期從server 接收的資料型態 
					dataType : "html", 
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