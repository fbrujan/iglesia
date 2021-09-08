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
				      <label for="inputEmail" class="control-label">Fecha:</label>
				        <input class="form-control" name="fecha" type="date" required>
				    </div>
				    <div class="form-group">
				     	<label for="inputEmail" class="control-label">Actividad:</label>
				     	<select name="id_servicio" class="form-control">
				      		<?php while($row = mysqli_fetch_array($servicios)){ ?>
				      		<option value="<?php echo $row['id_servicio']; ?>"><?php echo $row['servicio']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>

				    <div class="form-group">
				     	<label for="inputEmail" class="control-label" required>Tanda:</label><br />
				     	<input type="radio" name="id_tanda" value="1" >Matutina
		              	<input type="radio" name="id_tanda" value="2" >Vespertina
		              	<input type="radio" name="id_tanda" value="3" checked>Nocturna
		              	<input type="radio" name="id_tanda" value="4" >Sabatina
		              	<input type="radio" name="id_tanda" value="5" >Dominical
				    </div>
				    <div class="form-group">
				     	<label for="inputEmail" class="control-label">Nombre:</label>
				     	<br />
				      		<?php while($row = mysqli_fetch_array($personas)){ ?>
				      		<input type="checkbox" name="id_persona[]" value="<?php echo $row['id_persona']; ?>"><?php echo $row['nombres'] . ' ' .  $row['apellidos']; ?> <br />
				      	<?php } ?>
				     
				    </div>
				    
				     <input value="fbrujan" name="usuario" type="hidden" required>
				    
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