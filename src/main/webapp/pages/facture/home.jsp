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
						<a href=""><button class="buttonVehicule">Visualiser</button></a>
					</div>
					<div class="element">
						<a href=""><button class="buttonVehicule">Rechercher</button></a>
					</div>

				</div>
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