<?php  $personas 		= $asistencia->listarPersonas(); ?>
<?php  $servicios 		= $asistencia->listarServicios(); ?>

<div class="box-principal">
<h3 class="titulo">Registro de Asistencias a Actividades<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title"> Nueva Asistencia</h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group">
				      <label for="fecha" class="control-label">Fecha:</label>
				      
				        <input class="form-control" name="fecha" type="date"  required id="fecha" value="<?php 
				        			if (isset($_POST['fecha'])) {
				      						echo $_POST['fecha'];
				      					}
				        ?>"
				        >


				    </div>
				    <div class="form-group">
				     	<label for="id_servicio" class="control-label">Actividad:</label>
				     	<select name="id_servicio" class="form-control" id="id_servicio">
				      		<?php while($row = mysqli_fetch_array($servicios)){ ?>
				      		<option value="<?php echo $row['id_servicio']; ?>"<?php
				      				if (isset($_POST['id_servicio'])) {
				      					if ($row['id_servicio'] ==$_POST['id_servicio']) {
				      						echo " selected";
				      					}
				      				}

				      			?>

				      			>
				      				<?php echo $row['servicio']; ?>
				      				
				      		</option>
				      	<?php } ?>
				      </select>
				    </div>
				    <div class="form-group">
				     	<label for="nombre" class="control-label">Buscar:</label>
				     	<input type="text" name="nombre" id="nombre" autocomplete="off">
				    </div>


				    <div class="form-group">
				     	<label for="id_persona" class="control-label">Nombre:</label>
				     	<select name="id_persona" class="form-control" id="id_persona">
				     		<option value="0"> Seleccione  una persona....</option>
				      		<?php while($row = mysqli_fetch_array($personas)){ ?>
				      		<option value="<?php echo $row['id_persona']; ?>"><?php echo $row['nombres'] . ' ' .  $row['apellidos']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>

			
				    <div class="form-group">
				     	<label for="id_tanda" class="control-label" required id="id_tanda">Tanda:</label><br />
				     	<input type="radio" name="id_tanda" value="1" <?php if (isset($_POST['id_tanda'])) { if ($_POST['id_tanda'] =='1') {echo " checked";} } ?> >Matutina
		              	<input type="radio" name="id_tanda" value="2" <?php if (isset($_POST['id_tanda'])) { if ($_POST['id_tanda'] =='2') {echo " checked";} } ?> >Vespertina
		              	<input type="radio" name="id_tanda" value="3" <?php if (isset($_POST['id_tanda'])) { if ($_POST['id_tanda'] =='3') {echo " checked";} } ?> >Nocturna
		              	<input type="radio" name="id_tanda" value="4" <?php if (isset($_POST['id_tanda'])) { if ($_POST['id_tanda'] =='4') {echo " checked";} } ?> >Sabatina
		              	<input type="radio" name="id_tanda" value="5" <?php if (isset($_POST['id_tanda'])) { if ($_POST['id_tanda'] =='5') {echo " checked";} } ?> >Dominical
				    </div>

				     <!--
				     <div class="form-group">
				     	<label for="inputEmail" class="control-label" required>Clasificacion:</label><br />
				     	<input type="radio" name="id_clasificacion" value="1" checked>Dama
		              	<input type="radio" name="id_clasificacion" value="2" >Caballero
		              	<input type="radio" name="id_clasificacion" value="3" >Joven
		              	<input type="radio" name="id_clasificacion" value="4" >Juvenil
		              	<input type="radio" name="id_clasificacion" value="5" >Nino
				    </div>
					-->

				    
				    
				     <input value="fbrujan" name="usuario" type="hidden" required id="usuario">
				    
				    <div class="form-group">
				    	 <button type="submit" class="btn btn-success">Registrar</button>
				         <button type="reset" class="btn btn-warning">Borrar</button>
				         <button class="btn btn-critical" > <a href="<?php echo URL;?>asistencia">REGRESAR</a></button>
				    </div>
				</form>
				
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
	  </div>
	</div>
</div>