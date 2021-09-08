<?php $tipoServicio		= $servicios->listarTiposServicios(); ?>
<?php $lider 			= $servicios->listarLideres(); ?>
<?php $departamento 	= $servicios->listarDepartamentos(); ?>
<?php $iglesia		 	= $servicios->listarIglesias(); ?>

<div class="box-principal">
	<h3 class="titulo">Creacion de Actividades o Servicios<hr></h3>
	<div class="panel panel-success">
	  	<div class="panel-heading">
	    	<h3 class="panel-title">Crear Actividad o Servicio </h3>
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
				   			<label for="inputEmail" class="control-label"><b>Nombre o Titulo del Servicio:</b></label>
				       		<input class="form-control" name="servicio" type="text" required>       
				   		</div>

				   		<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Fecha</b></label>
				       		<input class="form-control" name="fecha_inicio" type="date" required>				       
				   		</div>

				   		<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Hora Inicio</b></label>
				       		<input class="form-control" name="hora_inicio" type="time" required>
				   		</div>

				   		<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Tipo Servicio: </b> </label>
				      		<select name="id_tipo_servicio" class="form-control">
				      		<?php while($row = mysqli_fetch_array($tipoServicio)){ ?>
				      			<option  value="<?php echo $row['id_tipo_servicio']; ?>"><?php echo $row['tipo_servicio']; ?></option> 
				      			<?php } ?>
				      		</select>
				    	</div>

				    	<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Departamento: </b> </label>
				      		<select name="id_departamento" class="form-control">
				      		<?php while($row = mysqli_fetch_array($departamento)){ ?>
				      			<option  value="<?php echo $row['id_departamento']; ?>"><?php echo $row['departamento']; ?></option> 
				      			<?php } ?>
				      		</select>
				    	</div>

				    	<div class="form-group">
				      		<label for="inputEmail" class="control-label"><b>Lider: </b> </label>
				      		<select name="id_lider" class="form-control">
				      		<?php while($row = mysqli_fetch_array($lider)){  ?>
				      			<option  value="<?php echo $row['id_lider']; ?>"><?php echo $row['lider']; ?></option> 
				      			<?php } ?>
				      		</select>
				    	</div>

				    	<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Descripcion:</b></label>
				       		<input class="form-control"  name="descripcion" type="text" required>				       
				   		</div>

				   		<div  class="form-group" id="requiere_registro">
					      <label for="requiere_registro" class="control-label" >Se requiere REGISTRO previo para asistir a esta Actividad:</label>
			              <input type="radio" class="requiere_registro" name="requiere_registro" id="requiere_registro1" value="1"  <?php if ($_POST['requiere_registro'] == 1) { echo "checked";} ;?> >SI
			              <input type="radio" class="requiere_registro" name="requiere_registro" id="requiere_registro0" value="0" <?php if ($_POST['requiere_registro'] == 0) { echo "checked";} ;?>>NO
				   
				  		</div>

				   		<div class="form-group">
				   			<label for="inputEmail" class="control-label"><b>Costo:</b></label>
				       		<input class="form-control"  name="costo" type="text" required>				       
				   		</div>

				   		<div class="form-group">
				   			<button type="submit" class="btn btn-success">Registrar</button>
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

