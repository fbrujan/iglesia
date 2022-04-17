<?php $paises = $registros->listarPaises(); ?>
<?php $distritos = $registros->listarDistritos(); ?>
<?php $circuitos = $registros->listarCircuitos(); ?>
<?php $iglesias = $registros->listarIglesias(); ?>
<?php $provincias = $registros->listarProvincias(); ?>
<?php $estados = $registros->listarEstados(); ?>
<?php $comites = $registros->listarComites(); ?>
<?php $cargos = $registros->listarCargos(); ?>
<?php $servicios = $registros->listarServicios(); ?>
<?php 
		 if (!$_POST){	
		 		$_POST['id_servicio']=0;
		 		$_POST['id_provincia']=0;
		 		$_POST['id_sexo']=0;
		 		$_POST['id_estado']=0;
		 		$_POST['id_estado_civil']=0;
		 		$_POST['id_sociedad']=0;
		 		$_POST['id_tipo_documento']=0;
		 		$_POST['id_pais']=0;
		 		$_POST['id_distrito']=0;
		 		$_POST['id_circuito']=0;
		 		$_POST['id_iglesia']=0;
		 		$_POST['id_rango_ministerial']=0;
		 		$_POST['es_pastor']=0;
		 		$_POST['es_miembro_ministerial']=0;
		 		$_POST['es_presbitero']=0;
		 		$_POST['es_delegado']=0;
		 		$_POST['trabaja_comite']=0;
		 		$_POST['id_comite_temporero']=0;
		 		$_POST['id_cargo']=0;
		 		$_POST['es_exonerado']=0;

		 } 
?>


<div class="box-principal">
<h3 class="titulo">Registro en Actividades<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Registrar Nuevo</h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group" id="div_id_servicio">

				       <label for="id_servicio" class="control-label">Actividad:</label>
				      <select name="id_servicio" required id="id_servicio">
				      	<option value="0">Seleccione un Servicio o Actividad ..</option>
				      	<?php while($row = mysqli_fetch_array($servicios)){ ?>
				      		<option value="<?php echo $row['id_servicio']; ?>" <?php if ($row['id_servicio']==$_POST['id_servicio']) { echo "selected";} ;?> > <?php echo $row['servicio']; ?>
				      		</option>
				      	<?php } ?>
				      </select>
				   	 
				    </div>			   
				    <div class="form-group" id="div_nombre">
				      <label for="nombre" class="control-label">Nombre</label>s
				      <input  name="nombre" id="nombre" autocomplete="off" type="text" required value="<?php if(isset($_POST['nombre'])){echo $_POST['nombre'];} ?>">
				    
				      <label for="apellidos" class="control-label" >Apellidos</label>
				      <input name="apellidos" id="apellidos" type="text" required  value="<?php if(isset($_POST['apellidos'])){echo $_POST['apellidos'];} ?>">
				    </div>

 	 		    	<div class="form-group" id="div_fch_nacimiento">
 	 		    	  <label for="fch_nacimiento" class="control-label">Fecha Nacimiento</label>
				      <input  name="fch_nacimiento" id="fch_nacimiento" type="date"  value="<?php if(isset($_POST['fch_nacimiento'])){echo $_POST['fch_nacimiento'];} ?>">
				    </div>
				    <div  class="form-group" id="div_id_sexo">
				      <label for="id_sexo" class="control-label" >Sexo:</label>
		              <input type="radio" class="id_sexo" name="id_sexo" id="id_sexo1" value="1"  <?php  
		              if (isset($_POST['id_sexo'])) {
		              	   if ($_POST['id_sexo'] == 1) { echo "checked";} ;
		              }
		           ?> >Masculino

		              <input type="radio" class="id_sexo" name="id_sexo" id="id_sexo2" value="2"  <?php  
		              if (isset($_POST['id_sexo'])) {
		              	   if ($_POST['id_sexo'] == 2) { echo "checked";} ;
		              }
		           ?> >Femenino
		           
				    </div>
<br/>
				    <div class="form-group" id="div_id_estado_civil">
				     	<label for="id_estado_civil" class="control-label">Estado Civil:</label>
			            <input type="radio" name="id_estado_civil" id="id_estado_civil1" value="1" <?php if (isset($_POST['id_estado_civil']) && $_POST['id_estado_civil'] == 1) { echo "checked";} ;?> >Soltero(a)
			            <input type="radio" name="id_estado_civil" id="id_estado_civil2" value="2" <?php if (isset($_POST['id_estado_civil']) && $_POST['id_estado_civil'] == 2) { echo "checked";} ;?> >Casado(a)
			            <input type="radio" name="id_estado_civil" id="id_estado_civil3" value="3" <?php if (isset($_POST['id_estado_civil']) && $_POST['id_estado_civil'] == 3) { echo "checked";} ;?> >Viudo(a)
			            <input type="radio" name="id_estado_civil" id="id_estado_civil4" value="4" <?php if (isset($_POST['id_estado_civil']) && $_POST['id_estado_civil'] == 4) { echo "checked";} ;?>>Divorciado(a)
			            <input type="radio" name="id_estado_civil" id="id_estado_civil5" value="5" <?php if (isset($_POST['id_estado_civil']) && $_POST['id_estado_civil'] == 5) { echo "checked";} ;?>>Union Libre
				    </div>
<br/>
				    <div class="form-group" id="div_id_sociedad">
				      	<label for="id_sociedad" class="control-label">Sociedad que Pertenece:</label>
				        <input type="radio" name="id_sociedad" id="id_sociedad2" value="2"  <?php if (isset($_POST['id_sociedad']) && $_POST['id_sociedad'] == 2) { echo "checked";} ;?> >Caballero
				        <input type="radio" name="id_sociedad" id="id_sociedad1" value="1"  <?php if (isset($_POST['id_sociedad']) && $_POST['id_sociedad'] == 1) { echo "checked";} ;?> >Dama
	                    <input type="radio" name="id_sociedad" id="id_sociedad3" value="3"  <?php if (isset($_POST['id_sociedad']) && $_POST['id_sociedad'] == 3) { echo "checked";} ;?> >Joven
	                    <input type="radio" name="id_sociedad" id="id_sociedad4" value="4"  <?php if (isset($_POST['id_sociedad']) && $_POST['id_sociedad'] == 4) { echo "checked";} ;?> >Juvenil
	                    <input type="radio" name="id_sociedad" id="id_sociedad5" value="5"  <?php if (isset($_POST['id_sociedad']) && $_POST['id_sociedad'] == 5) { echo "checked";} ;?> >Nino
				    </div>
<br/>
				    <div class="form-group" id="div_id_tipo_documento">
				      	<label for="id_tipo_documento" class="control-label">Documento Identidad:</label>
				      	<input type="radio" name="id_tipo_documento" id="id_tipo_documento1" value="1" <?php if (isset($_POST['id_tipo_documento']) && $_POST['id_tipo_documento'] == 1) { echo "checked";} ;?> >Cedula
			            <input type="radio" name="id_tipo_documento" id="id_tipo_documento2"  value="2" <?php if (isset($_POST['id_tipo_documento']) && $_POST['id_tipo_documento'] == 2) { echo "checked";} ;?> >Pasaporte
			            <input type="radio" name="id_tipo_documento" id="id_tipo_documento3" value="3" <?php if (isset($_POST['id_tipo_documento']) && $_POST['id_tipo_documento'] == 3) { echo "checked";} ;?> >Otro

				      	<input name="nro_documento" id="nro_documento" type="text"  value="<?php if(isset($_POST['nro_documento'])){echo $_POST['nro_documento'];} ?>"  >
				    </div>

				     <div class="form-group" id="div_telefono">
					      <label for="telefono" class="control-label">Telefono</label>
					      <input name="telefono" id="telefono" type="text" value="<?php if(isset($_POST['telefono'])){echo $_POST['telefono'];} ?>">
				      </div>
				      <div class="form-group" id="div_apodo"> 
					      <label for="apodo" class="control-label">Apodo</label>
					      <input type="text" name="apodo" id="apodo" value="<?php if(isset($_POST['apodo'])){echo $_POST['apodo'];} ?>">
				    </div>
	    
				    
				    <div class="form-group" id="div_id_pais">
				      <label for="id_pais" class="control-label">Pais de Origen:</label>
				      <select name="id_pais" id="id_pais">
				      	<option value="0">Seleccione un Pais ..</option>
				      	<?php while($row = mysqli_fetch_array($paises)){ ?>
				      		<option value="<?php echo $row['id_pais']; ?>" <?php if ($row['id_pais']==$_POST['id_pais']) { echo "selected";} ;?> > <?php echo $row['pais']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>
				    <div class="form-group" id="div_id_provincia">
				      <label for="id_provincia" class="control-label">Provincia o Estado:</label>
				      <select name="id_provincia" id="id_provincia">
				      	<option value="0">Seleccione una Provincia o Estado ..</option>
				      	<?php while($row = mysqli_fetch_array($provincias)){ ?>
				      		<option value="<?php echo $row['id_provincia']; ?>" <?php if ($row['id_provincia']==$_POST['id_provincia']) { echo "selected";} ;?>  ><?php echo $row['provincia']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>
				    <div class="form-group" id="div_direccion">
				      <label for="direccion" class="control-label">Direccion</label>
				      <input name="direccion" type="text" id="direccion" value="<?php if(isset($_POST['direccion'])){echo $_POST['direccion'];} ?>">
				    </div>
				    <div class="form-group" id="div_fch_conversion">
				      <label for="fch_conversion" class="control-label">Fecha Conversion</label>
				      <input  name="fch_conversion" type="date" id="fch_conversion" value="<?php if(isset($_POST['fch_conversion'])){echo $_POST['fch_conversion'];} ?>">
				    </div>
				    <div class="form-group" id="div_fch_bautismo">
				      <label for="fch_bautismo" class="control-label">Fecha Bautismo</label>
				      <input  name="fch_bautismo" type="date" id="fch_bautismo" value="<?php if(isset($_POST['fch_bautismo'])){echo $_POST['fch_bautismo'];} ?>">
				    </div>		   

				    <div class="form-group" id="div_id_distrito">
				      <label for="id_distrito" class="control-label">Distrito a que Pertence:</label>
				      <select name="id_distrito"  id="id_distrito">
				      	<option value="0">Seleccione un Distrito ..</option>
				      	<?php while($row = mysqli_fetch_array($distritos)){ ?>
				      		<option value="<?php echo $row['id_distrito']; ?>" <?php if ($row['id_distrito']==$_POST['id_distrito']) { echo "selected";} ;?>  >
				      				<?php echo $row['distrito']; ?>
				      		</option>
				      	<?php } ?>
				      </select>
				     </div>
				     <div class="form-group" id="div_id_circuito">
				      <label for="id_circuito" class="control-label">Circuito:</label>
				      <select name="id_circuito" id="id_circuito">
				      	<option value="0">Seleccione un Circuito ..</option>
				      	<?php while($row = mysqli_fetch_array($circuitos)){ ?>
				      		<option  codigo="<?php echo $row['id_circuito']; ?>"   value="<?php echo $row['id_circuito']; ?>" <?php if (isset($_POST['id_circuito']) && $row['id_circuito']==$_POST['id_circuito']) { echo "selected";} ;?> >
				      				<?php echo $row['circuito']; ?>
				      		</option>
				      	<?php } ?>
				      </select>
				    </div>
				    <div class="form-group" id="div_id_iglesia">
				       <label for="id_iglesia" class="control-label">Iglesia:</label>
				      <select name="id_iglesia" id="id_iglesia">
				    <!-- 	<option value="0">Seleccione un Iglesia ..</option> -->
				      	<?php while($row = mysqli_fetch_array($iglesias)){ ?>
				      		<option codigo="<?php echo $row['id_circuito']; ?>"   value="<?php echo $row['id_iglesia']; ?>" <?php if (isset($_POST['id_iglesia']) && $row['id_iglesia']==$_POST['id_iglesia']) { echo "selected";} ;?> >
				      				<?php echo $row['iglesia']; ?>
				      		</option>
				      	<?php } ?>
				      </select>
				   </div>
				   <div class="form-group" id="div_id_estado">
				      <label for="id_estado" class="control-label">Estatus en la Iglesia:</label>
				      <select name="id_estado" id="id_estado">
				      	<option value="0">Seleccione un Estado ..</option>
				      	<?php while($row = mysqli_fetch_array($estados)){ ?>
				      		<option value="<?php echo $row['id_estado']; ?>" <?php if ($row['id_estado']==$_POST['id_estado']) { echo "selected";} ;?>  ><?php echo $row['estado']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>			     

				   
				     <div class="form-group" id="div_id_rango_ministerial">
				     	<label for="id_rango_ministerial" class="control-label">Rango Ministerial:</label>
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial1" value="1" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 1) { echo "checked";} ;?> >Creyente
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial2" value="2" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 2) { echo "checked";} ;?> >Laico Registrado
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial3" value="3" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 3) { echo "checked";} ;?> >Exhortador(a)
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial4" value="4" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 4) { echo "checked";} ;?> >Evangelista
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial5" value="5" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 5) { echo "checked";} ;?> >Lic. Predicador(a)
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial6" value="6" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 6) { echo "checked";} ;?> >Lic. Pastor(a)
			            <input type="radio" name="id_rango_ministerial" id="id_rango_ministerial7" value="7" <?php if (isset($_POST['id_rango_ministerial']) && $_POST['id_rango_ministerial'] == 7) { echo "checked";} ;?> >Ministro Ordenado(a)
			            
				    </div>

				    <div class="form-group" id="div_funcion_ministerial">
				     	<label for="inputEmail" class="control-label">Funcion Ministerial:</label>
			            <input type="checkbox" name="es_pastor" id="es_pastor" value="1" <?php if (isset($_POST['es_pastor'])) { echo "checked";} ;?> >Pastor(a)
			            <input type="checkbox" name="es_miembro_ministerial" id="es_miembro_ministerial" value="1" <?php if (isset($_POST['es_miembro_ministerial'])) { echo "checked";} ;?> >Miembro del Ministerial
			            <input type="checkbox" name="es_presbitero" id="es_presbitero" value="1" <?php if (isset($_POST['es_presbitero'])) { echo "checked";} ;?> >Presbitero
			            
			             <input type="checkbox" name="es_delegado" id="es_delegado" value="1"  <?php if (isset($_POST['es_delegado'])) { echo "checked";} ;?> >Delegado(a)
				   	
				    </div>
				    <div class="form-group" id="div_trabaja_comite_temporero">
				    	<input type="checkbox" name="trabaja_comite" id="trabaja_comite" value="1" <?php if (isset($_POST['trabaja_comite'])) { echo "checked";} ;?> >Trabaja en Comite Temporero
				    	
				    </div>
				    


				    <div class="form-group" id="div_id_comite_temporero">
				      <label for="id_comite_temporero" class="control-label">Comite Temporero:</label>
				      <select name="id_comite_temporero" id="id_comite_temporero">
				      	<option value="0">Seleccione un Comite ..</option>
				       <?php while($row = mysqli_fetch_array($comites)){ ?>
				       <option value="<?php if (isset($_POST['id_comite_temporero'])){echo $row['id_comite_temporero']; }?>" <?php if (isset($_POST['id_comite_temporero']) && $row['id_comite_temporero']==$_POST['id_comite_temporero']) { echo "selected";} ;?>  ><?php echo $row['comite_temporero']; ?></option>
				      	<?php } ?>
				      </select>
				     </div>
				     <div class="form-group" id="div_id_cargo">
				      <label for="id_cargo" class="control-label">Cargo Ocupado:</label>
				      <select name="id_cargo" id="id_cargo">
				       <option value="0">Seleccione un Cargo ..</option>
				       <?php while($row = mysqli_fetch_array($cargos)){ ?>
				       <option value="<?php if (isset($_POST['id_cargo'])){echo $row['id_cargo'];} ?>"  <?php if (isset($_POST['id_cargo']) && $row['id_cargo']==$_POST['id_cargo']) { echo "selected";} ;?> ><?php echo $row['cargo']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>
 					<div class="form-group" id="div_es_exonerado">
				    	<input type="checkbox" name="es_exonerado" id="es_exonerado" value="1"  <?php if (isset($_POST['es_exonerado'])) { echo "checked";} ;?> >Exonerado(a)	
				    </div>
					<div class="form-group" id="div_imagen">
				      <label for="imagen" class="control-label">Imagen</label>
				        <input class="form-control" name="imagen" id="imagen" type="file" >
				    </div>
				    
				    <div class="form-group">
				    	<inpu				    t type="hidden" name="id_persona" id="id_persona" value="<?php if(isset($_POST['id_persona'])){echo $_POST['id_persona'];} ?>">
				    	<input type="hidden" name="id_miembro" id="id_miembro" value="">
				    	<input type="hidden" name="es_miembro_iglesia" id="es_miembro_iglesia" value="">
				    	<input type="hidden" name="es_visita" value="0" id="es_visita">
				    	<input type="hidden" name="es_lider" value="0" id="es_lider">
				    	<button type="submit" class="btn btn-success">Registrar</button>
				        <button type="reset" class="btn btn-warning">Borrar</button>
				        <button class="btn btn-critical" > <a href="<?php echo URL;?>registros">REGRESAR</a></button>		
				    </div>
				</form>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
	  </div>
	</div>
</div>

  <script type="text/javascript">
        // Consigue el elemento provincias/poblaciones por su identificador id. Es un método del DOM de HTML
        var id1 = document.getElementById("id_circuito");
        var id2 = document.getElementById("id_iglesia");
        
        // Añade un evento change al elemento id1, asociado a la función cambiar()
        if (id1.addEventListener) {     // Para la mayoría de los navegadores, excepto IE 8 y anteriores
            id1.addEventListener("change", cambiar);
        } else if (id1.attachEvent) {   // Para IE 8 y anteriores
            id1.attachEvent("change", cambiar); // attachEvent() es el método equivalente a addEventListener()
        }

        // Definición de la función cambiar()
        function cambiar() {
            for (var i = 0; i < id2.options.length; i++)
            
            // -- Inicio del comentario -- 
            // Muestra solamente los id2 que sean iguales a los id1 seleccionados, según la propiedad display
            if(id2.options[i].getAttribute("codigo") == id1.options[id1.selectedIndex].getAttribute("codigo")){
                id2.options[i].style.display = "block";
            }else{
                id2.options[i].style.display = "none";
            }
            // -- Fin del comentario --
                    
            id2.value = "";
        }

        // Llamada a la función cambiar()
        cambiar();
    </script>


