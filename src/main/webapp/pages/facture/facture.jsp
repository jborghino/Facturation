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
<!-- Bootstrap -->
<script src=<c:url value="/template/js/jquery.min.js"/>></script>
<!-- slider -->
<script src=<c:url value="/template/js/bootstrap.min.js"/>></script>
<script src=<c:url value="/template/js/jquery.isotope.min.js"/>></script>


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
						<a href="list.do"><button class="buttonVehicule">Visualiser</button></a>
					</div>
					<div class="element">
						<a href=""><button class="buttonVehicule">Rechercher</button></a>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="container">

		<div class="row">
			<h3>Visualisation</h3><br />
			<form:form action="save.do" commandName="facture" method="POST"
				cssClass="form-horizontal">
				<div class="col-lg-6">
					<form:hidden name="id" path="id" />

					<form:errors path="numero" />

					<div class="form-group">
						<form:label path="numero">N° de facture : </form:label>
						<span>${facture.numero }</span>

					</div>

					<form:errors path="date" />

					<div class="form-group">
						<form:label path="date">Date de la facture : </form:label>
						<fmt:formatDate value="${facture.date }" pattern="dd/MM/yyyy" />

					</div>
				</div>
				<div class="col-lg-12">
					<table class="display" id="table_id">
						<thead>
							<tr>
								<th style="width: 10%">Réf</th>
								<th style="width: 37%">Designation</th>
								<th style="width: 10%">Nb</th>
								<th style="width: 10%">Prix HT</th>
								<th style="width: 20%">Total HT</th>
								<th style="width: 13%">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="detail" items="${details }">

								<tr>
									<td>${detail.ref }</td>
									<td>${detail.designation }</td>
									<td>${detail.nb }</td>
									<td>${detail.prixHT }</td>
									<td>${detail.totalHT }</td>

									<td colspan="2"><a href="delete.do?id=${detail.id }">
											<i class="fa fa-minus-square fa-spin"></i>Supprimer
									</a> <a href="init.do?id=${detail.id }"> <i
											class="fa fa-rotate-right fa-spin"></i>Modifier
									</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>


				</div>
			</form:form>
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