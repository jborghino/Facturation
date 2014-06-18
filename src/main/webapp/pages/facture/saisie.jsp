<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<link rel="stylesheet"
	href=<c:url value="/template/css/bootstrap.min.css"/>>
<link rel="stylesheet"
	href=<c:url value="/template/css/font-awesome.min.css"/>>
<link rel="stylesheet" href=<c:url value="/template/css/mycss.css"/>>
<link rel="stylesheet" href=<c:url value="/template/css/ui.jqgrid.css"/>>
<link rel="stylesheet"
	href=<c:url value="/template/css/jquery.dataTables.css"/>>
<link rel="stylesheet"
	href=<c:url value="/template/css/dataTables.keyTable.css"/>>
<!-- Bootstrap -->
<script src=<c:url value="/template/js/jquery.min.js"/>></script>
<!-- slider -->
<script src=<c:url value="/template/js/bootstrap.min.js"/>></script>
<script src=<c:url value="/template/js/jquery.isotope.min.js"/>></script>
<script src=<c:url value="/template/js/jquery.jqGrid.min.js"/>></script>
<script src=<c:url value="/template/js/jquery.dataTables.js"/>></script>
<script src=<c:url value="/template/js/jquery-1.8.3.min.js"/>></script>
<script src=<c:url value="/template/js/KeyTable.min.js"/>></script>
<script src=<c:url value="/template/js/jquery.jeditable.min.js"/>></script>


<script language="javascript" type="text/javascript">
	// 	$(function() {
	// 		$("td")
	// 				.dblclick(
	// 						function() {
	// 							var OriginalContent = $(this).text();

	// 							$(this).addClass("cellEditing");
	// 							$(this)
	// 									.html(
	// 											"<input type='text' value='" + OriginalContent + "' />");
	// 							$(this).children().first().focus();

	// 							$(this).children().first().keypress(
	// 									function(e) {
	// 										if (e.which == 13) {
	// 											var newContent = $(this).val();
	// 											$(this).parent().text(newContent);
	// 											$(this).parent().removeClass(
	// 													"cellEditing");
	// 										}
	// 									});

	// 							$(this).children().first().blur(function() {
	// 								$(this).parent().text(OriginalContent);
	// 								$(this).parent().removeClass("cellEditing");
	// 							});
	// 						});
	// 	});

	// 	function addRow() {
	// 		$('#table_id tr:last').after('<tr><td>Insert value</td><td>Insert value</td><td>Insert value</td><td>Insert value</td><td>Insert value</td></tr>');
	// 	}

	$(document).ready(
			function() {
				var t = $('#table_id').dataTable({
	                "sPaginationType": "full_numbers",
	                "bJQueryUI": true
	            });
				// 		new $.fn.dataTable.KeyTable(t);
				var keys = new KeyTable({
					"table" : document.getElementById('table_id')
				});

				$('#table_id tbody td').each( function () {
					keys.event.action( this, function (nCell) {
						/* Block KeyTable from performing any events while jEditable is in edit mode */
						keys.block = true;
						
						/* Initialise the Editable instance for this table */
						$(nCell).editable( function (sVal) {
							/* Submit function (local only) - unblock KeyTable */
							keys.block = false;
							return sVal;
						}, { 
							"onblur": 'submit', 
							"onreset": function(){ 
								/* Unblock KeyTable, but only after this 'esc' key event has finished. Otherwise
								 * it will 'esc' KeyTable as well
								 */
								setTimeout( function () {keys.block = false;}, 0); 
							}
						} );
						
						/* Dispatch click event to go into edit mode - Saf 4 needs a timeout... */
						setTimeout( function () { $(nCell).click(); }, 0 );
					} );
				} );

				$('#addRow').on(
						'click',
						function() {
							t.row.add(
									[ 'Insert Value', 'Insert Value',
											'Insert Value', 'Insert Value',
											'Insert Value' ]).draw();

						});
			});
</script>

</head>

<body>

	<div class="jumbotron">
		<div class="container">FACTURATION</div>
	</div>






	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div id="isotopecontent" class="col-lg-12">
					<div class="element">
						<a href="saisie.do"><button class="buttonVehicule">Saisir</button></a>
					</div>
					<div class="element">
						<a href=""><button class="buttonVehicule">Visualiser</button></a>
					</div>
					<div class="element">
						<a href=""><button class="buttonVehicule">Rechercher</button></a>
					</div>
					<div class="element">
						<a href="home.do"><button class="buttonVehicule">Accueil</button></a>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<h3>Saisie</h3>

			<form:form action="save.do" commandName="fa" method="POST"
				cssClass="form-horizontal">
				<div class="col-lg-2">
					<form:hidden name="id" path="id" />

					<form:errors path="numero" />

					<div class="form-group">
						<form:label path="numero">N° de facture</form:label>
						<form:input name="numero" path="numero"
							cssClass="bg-focus form-control" />

					</div>

					<form:errors path="date" />

					<div class="form-group">
						<form:label path="date">Date de la facture</form:label>
						<form:input name="date" path="date"
							cssClass="bg-focus form-control" />

					</div>
				</div>
				<div class="col-lg-12">
					<table
						class="table-condensed table-hover table-striped table-bordered"
						id="table_id">
						<thead>
							<tr>
								<th style="width: 10%">Réf</th>
								<th style="width: 50%">Designation</th>
								<th style="width: 10%">Nb</th>
								<th style="width: 10%">Prix HT</th>
								<th style="width: 20%">Total HT</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>156</td>
								<td>Test 156</td>
								<td>1</td>
								<td>29</td>
								<td>29</td>
							</tr>
							<tr>
								<td>278</td>
								<td>Test 278</td>
								<td>2</td>
								<td>15</td>
								<td>30</td>
							</tr>
						</tbody>
					</table>


				</div>
			</form:form>

			<button id="addRow" class="buttonVehicule">Nouvelle ligne</button>
		</div>
	</div>


	<script type="text/javascript">
		var j = jQuery.noConflict();
		j(document).ready(function() {

			j('a').on('click', function() {
				j(this).blur();
			});

			var container = j('#isotopecontent');
			container.isotope({
				itemSelector : '.element',
				animationEngine : 'jquery'
			});

		});
	</script>



</body>

</html>