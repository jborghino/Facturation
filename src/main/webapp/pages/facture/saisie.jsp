<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<!-- <script src=<c:url value="/template/js/jquery.jqGrid.min.js"/>></script> -->
<script src=<c:url value="/template/js/jquery.dataTables.js"/>></script>
<script src=<c:url value="/template/js/KeyTable.min.js"/>></script>
<script src=<c:url value="/template/js/jquery.dataTables.editable.js"/>></script>
<script src=<c:url value="/template/js/jquery.jeditable.min.js"/>></script>
<script src=<c:url value="/template/js/jquery-1.8.3.min.js"/>></script>


<script language="javascript" type="text/javascript">
	$(document).ready(function() {

		var oTable = $('#table_id').dataTable({
			"paging" : false
		});

		var $table = $("#table_id");
		// editable
		// $().DataTable() will return a DataTables API instance, 
		// with the selected table(s) in its context. 
		// 	The API instance provides a wide range of methods that can be used to manipulate the table.
		var dataTable = $table.DataTable();

		//Delete row
		$('#table_id tbody').on('dblclick', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				dataTable.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

		$('#deleteRow').click(function() {
			dataTable.row('.selected').remove().draw(false);
		});

		//Ajout d'une nouvelle ligne en fin de tableau
		$("#addRow").click(function() {
			$(oTable).dataTable().fnAddData([ "", "", "", "", "Undefined" ]);
			$(oTable).find('td').editable(function(v, s) {
				console.log(v);
				return (v);
			});
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		/* Apply the jEditable handlers to the table */
		$('#table_id tbody td').editable(function(sValue) {
			/* Get the position of the current data from the node */
			var aPos = oTable.fnGetPosition(this);

			/* Get the data array for this row */
			var aData = oTable.fnGetData(aPos[0]);

			/* Update the data array and return the value */
			aData[aPos[1]] = sValue;
			return sValue;
		}, {
			"onblur" : 'submit'
		}); /* Submit the form when bluring a field */

		/* Init DataTables */
		oTable = $('#table_id').dataTable();
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		

		$('#table_id tbody tr').on('change', 'td', function() {
			$('#table_id tbody tr').each(function() {

				$nb = parseInt($('td:eq(2)').html());
				$prixHT = parseInt($('td:eq(3)').html());
				$totalHT = $nb * $prixHT;
				
				console.log("nb = " + $nb);
				console.log("prixHT : " + $prixHT);
				console.log("totalHT : " + $totalHT);
				console.log("nb * prix : " + $nb * $prixHT);
			});
		});

		// 		$('#table_id tbody tr').on('change', 'td', function() {
		// 			// Alert the contents of an element in a SPAN in the first TD
		// 			var nb = $('td:eq(2)').html();
		// 			var prixHT = $('td:eq(3)').html();
		// 			var totalHT = nb * prixHT;

		// 			$('td:eq(4)').html();
		// 			$('td:eq(4)').innerHTML = totalHT;
		// 			alert (nb);
		// 			alert (prixHT);
		// 			alert (totalHT);
		// 		});
	});
</script>

<!-- <script type="text/javascript">

// $(function(){
// 		// tab navigation
// 		var $table = $("#table_id").DataTable();
// 		var keys = new KeyTable({
// 			"table" : $table
// 		});
// 		var $td = $("#table_id").find("tbody td").get();
// 		console.log($td);
		
		
// 		$td.each(function() {
// 			keys.event.action(this, function(nCell) {
// 				/* Block KeyTable from performing any events while jEditable is in edit mode */
// 				keys.block = false;

// 				/* Initialise the Editable instance for this table */
// 				$(nCell).editable(function(sVal) {
// 					/* Submit function (local only) - unblock KeyTable */
// 					keys.block = false;
// 					return sVal;
// 				}, {
// 					"onblur" : 'submit',
// 					"onreset" : function() {
// 						/* Unblock KeyTable, but only after this 'esc' key event has finished. Otherwise
// 						 * it will 'esc' KeyTable as well
// 						 */
// 						setTimeout(function() {
// 							keys.block = false;
// 						}, 0);
// 					}
// 				});

// 				/* Dispatch click event to go into edit mode - Saf 4 needs a timeout... */
// 				setTimeout(function() {
// 					$(nCell).click();
// 				}, 0);
// 			});
// 		});
// });
</script> -->

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
						<a href="list.do""><button class="buttonVehicule">Visualiser</button></a>
					</div>
					<div class="element">
						<a href="list.do"><button class="buttonVehicule">Rechercher</button></a>
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
			</form:form>
			<div class="col-lg-12">
				<div class="row">
					<button id="addRow" class="buttonVehicule">Nouvelle ligne</button>
					<button id="deleteRow">Supprimer</button>
				</div>
				<table class="display" id="table_id">
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
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</tbody>
				</table>


			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-lg-offset-9">
				<span><b>TOTAL HT : </b>
					<div id="totalHT"></div> </span>
			</div>
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