<?php $tipoServicio		= $servicios->listarTiposServicios(); ?>
<?php $lider 			= $servicios->listarLideres(); ?>
<?php $departamento 	= $servicios->listarDepartamentos(); ?>
<?php $iglesia		 	= $servicios->listarIglesias(); ?>

<div class="box-principal">
	<h3 class="titulo">Editar Servicios<hr></h3>
	<div class="panel panel-success">
	  	<div class="panel-heading">
	    	<h3 class="panel-title">Editar Servicio: <?php echo $datos['servicio']; ?></h3>
	  	</div>
	  	<div class="panel-body">
	  		<div class="row">
	  			<div class="col-md-1">
	  				
	  			</div>
	  			<div class="col-md-10">
	  				<form class="form-vertical" action="" method="POST">
				   		
				   		<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Iglesia: </b> Actual: <?php echo $datos['iglesia']; ?></label>
				      		<select name="id_iglesia" class="form-control">
				      		<?php while($row = mysqli_fetch_array($iglesia)){ 
				      		if($datos['id_iglesia']==$row['id_iglesia']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_iglesia']; ?>"><?php echo $row['iglesia']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_iglesia']; ?>"><?php echo $row['iglesia']; ?></option>
				      			 
				      			<?php } } ?>
				      		</select>
				    	</div>

				    	<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Servicio:</b></label>
				       		<input class="form-control" value="<?php echo $datos['servicio']; ?>" name="servicio" type="text" required>				       
				   		</div>

				   		<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Fecha</b></label>
				       		<input class="form-control" value="<?php echo $datos['fecha_inicio']; ?>" name="fecha_inicio" type="date" required>				       
				   		</div>
				   		<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Hora Inicio</b></label>
				       		<input class="form-control" value="<?php echo $datos['hora_inicio']; ?>" name="hora_inicio" type="time" required>
				   		</div>


				   		<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Tipo Servicio: </b> Actual: <?php echo $datos['tipo_servicio']; ?></label>
				      		<select name="id_tipo_servicio" class="form-control">
				      		<?php while($row = mysqli_fetch_array($tipoServicio)){ 
				      		if($datos['id_tipo_servicio']==$row['id_tipo_servicio']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_tipo_servicio']; ?>"><?php echo $row['tipo_servicio']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_tipo_servicio']; ?>"><?php echo $row['tipo_servicio']; ?></option>
				      			 
				      			<?php } } ?>
				      		</select>
				    	</div>

				    	<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Departamento: </b> Actual: <?php echo $datos['departamento']; ?></label>
				      		<select name="id_departamento" class="form-control">
				      		<?php while($row = mysqli_fetch_array($departamento)){ 
				      		if($datos['id_departamento']==$row['id_departamento']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_departamento']; ?>"><?php echo $row['departamento']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_departamento']; ?>"><?php echo $row['departamento']; ?></option>
				      			 
				      			<?php } } ?>
				      		</select>
				    	</div>



				    	
				    	<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Lider: </b> Actual: <?php echo $datos['lider']; ?></label>
				      		<select name="id_lider" class="form-control">
				      		<?php while($row = mysqli_fetch_array($lider)){ 
				      		if($datos['id_lider']==$row['id_lider']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_lider']; ?>"><?php echo $row['lider']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_lider']; ?>"><?php echo $row['lider']; ?></option>
				      			 
				      			<?php } } ?>
				      		</select>
				    	</div>

				    	<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Descripcion:</b></label>
				       		<input class="form-control" value="<?php echo $datos['descripcion']; ?>" name="descripcion" type="text" required>				       
				   		</div>

				   		<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Costo:</b></label>
				       		<input class="form-control" value="<?php echo $datos['costo']; ?>" name="costo" type="text" required>				       
				   		</div>

				   		<input value="<?php echo $datos['id_servicio']; ?>" name="id_servicio" type="hidden">
				   		<div class="form-group">
				   			<button type="submit" class="btn btn-success">Editar</button>
				       		<button type="reset" class="btn btn-warning">Borrar</button>
				   		</div>
					</form>
	  			</div>
	  			<div class="col-md-1">
	  				
	  			</div>
	  		</div>
	 	</div>
	</div>
</div>

