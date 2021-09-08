<?php namespace Views;

	$template = new Template();

	class Template{

		public function __construct(){
?>
	<!DOCTYPE html>
	<html lang="es">
	<head>
		<meta charset="UTF-8">
		<!-- <title>Iglesia El Refugio 5to </title> -->
		<title>Asamblea de Iglesias Cristianas </title>
		<link rel="stylesheet" href="<?php echo URL; ?>Views/template/css/bootstrap.css">
		<link rel="stylesheet" href="<?php echo URL; ?>Views/template/css/general.css">
		<link rel="stylesheet" href="<?php echo URL; ?>Views/template/css/jquery-ui.css">

	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
  		<div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
		        <span class="sr-only"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">Asamblea de Iglesias Cristianas</a>
		    </div>

		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
		      <ul class="nav navbar-nav">
		        <li><a href="<?php echo URL; ?>">Inicio</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Miembros <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="<?php echo URL; ?>miembros">Listado</a></li>
		            <li><a href="<?php echo URL; ?>miembros/agregar">Nuevo Miembro</a></li>
		          </ul>
		        </li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Sociedades <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="<?php echo URL; ?>sociedades">Listado</a></li>
		            <li><a href="<?php echo URL; ?>sociedades/agregar">Agregrar</a></li>
		          <!--  <li><a href="<?php echo URL; ?>sociedades/agregar">Jovenes</a></li>
		            <li><a href="<?php echo URL; ?>sociedades/agregar">Juveniles</a></li>
		            <li><a href="<?php echo URL; ?>sociedades/agregar">Ni&ntilde;os</a></li> -->
		          </ul>
		        </li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Mostrar <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		          	<li><a href="<?php echo URL; ?>asistencia">Asistencia a Servicios</a></li>
		          	<li><a href="<?php echo URL; ?>cargos">Cargos</a></li>
		          	<li><a href="<?php echo URL; ?>circuitos">Circuitos</a></li>
		          	<li><a href="<?php echo URL; ?>comite_temporero">Comites Temporeros</a></li>
		          	<li><a href="<?php echo URL; ?>departamentos">Departamentos</a></li>
		          	<li><a href="<?php echo URL; ?>distritos">Distritos</a></li>
		          	<li><a href="<?php echo URL; ?>estados">Estado o Condicion</a></li>
		          	<li><a href="<?php echo URL; ?>iglesias">Iglesias</a></li>
		          	<li><a href="<?php echo URL; ?>lideres">Lideres (Solo Vigentes)</a></li>
		          	<li><a href="<?php echo URL; ?>lideres/listar_todos">Lideres (Todos)</a></li>
		          	<li><a href="<?php echo URL; ?>miembros">Miembros</a></li>
		          	<li><a href="<?php echo URL; ?>paises">Paises</a></li>
		          	<li><a href="<?php echo URL; ?>personas">Personas</a></li>
		          	<li><a href="<?php echo URL; ?>provincias">Provincias o Estados</a></li>
		            <li><a href="<?php echo URL; ?>servicios">Servicios</a></li>
		            <li><a href="<?php echo URL; ?>rango_ministerial">Rangos Ministeriales</a></li>
		            <li><a href="<?php echo URL; ?>sociedades">Sociedades</a></li>		            
		            <li><a href="<?php echo URL; ?>tandas">Tandas</a></li>
		            <li><a href="<?php echo URL; ?>tipos_servicio">Tipo Servicio</a></li>
		          </ul>
		        </li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Registrar <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		          	<li><a href="<?php echo URL; ?>asistencia/agregar">Nueva Asistencia</a></li>
		          	<li><a href="<?php echo URL; ?>cargos/agregar">Nuevo Cargo</a></li>
		          	<li><a href="<?php echo URL; ?>circuitos/agregar">Nuevo Circuito</a></li>
		          	<li><a href="<?php echo URL; ?>comite_temporero/agregar">Nuevo Comite Temporero</a></li>
		          	<li><a href="<?php echo URL; ?>departamentos/agregar">Nuevo Departamento</a></li>
		          	<li><a href="<?php echo URL; ?>distritos/agregar">Nuevo Distritos</a></li>
		          	<li><a href="<?php echo URL; ?>estados/agregar">Nuevo Estado o Condicion</a></li>
		          	<li><a href="<?php echo URL; ?>iglesias/agregar">Nueva Iglesia</a></li>
		          	<li><a href="<?php echo URL; ?>lideres/agregar">Nuevo Lider</a></li>
		          	<li><a href="<?php echo URL; ?>miembros/agregar">Nuevo Miembro</a></li>
		          	<li><a href="<?php echo URL; ?>paises/agregar">Nuevo Pais</a></li>
		          	<li><a href="<?php echo URL; ?>personas/agregar">Nueva Persona</a></li>
		          	<li><a href="<?php echo URL; ?>provincias/agregar">Nueva Provincia o Estado</a></li>
		          	<li><a href="<?php echo URL; ?>rango_ministerial/agregar">Nuevo Rango Ministerial</a></li>
		            <li><a href="<?php echo URL; ?>servicios/agregar">Nuevo Servicio</a></li>
		            <li><a href="<?php echo URL; ?>sociedades/agregar">Nueva Sociedad</a></li>
		            <li><a href="<?php echo URL; ?>tandas/agregar">Nueva Tanda</a></li>
		            <li><a href="<?php echo URL; ?>tipos_servicio/agregar">Nuevo Tipo Servicio</a></li>		            
		            
		          </ul>
		        </li>
		      </ul>
		      
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="http://codigofacilito.com">Francisco Brujan Arias</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
<?php
		}

		public function __destruct(){
?>
	<center><footer class="navbar-fixed-bottom">
		Todos los derechos reservados &copy 2018 ...
		Francisco Brujan ~ @fbrujan | <b>IglesiaRefugio5to</b>
	</footer></center>
	<script src="<?php echo URL; ?>Views/template/js/jquery-3.3.1.min.js"></script>
	<script src="<?php echo URL; ?>Views/template/js/bootstrap.js"></script>
	<script src="<?php echo URL; ?>Views/template/js/jquery-ui.js"></script>
	<script src="<?php echo URL; ?>Views/template/js/busca_miembros.js"></script>


	</body>
	</html>
<?php
		}

	}
/* cambiar estado por clasificacion_miembro*/
?>
