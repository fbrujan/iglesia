<?php $miembros 		= $lideres->listarMiembrosActuales(); ?>
<?php $sociedades 		= $lideres->listarSociedades(); ?>
<?php $cargos 			= $lideres->listarCargos(); ?>
<?php $departamentos 	= $lideres->listarDepartamentos(); ?>
<div class="box-principal">
<h3 class="titulo">Agregar Lider<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Agregar un nuevo Lider</h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group">
				     	<label for="inputEmail" class="control-label">Miembro:</label>
				     	<select name="id_miembro" class="form-control">
				      		<?php while($row = mysqli_fetch_array($miembros)){ ?>
				      		<option value="<?php echo $row['id_miembro']; ?>"><?php echo $row['miembro']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>

				    <div class="form-group">
				     	<label for="inputEmail" class="control-label">Departamento:</label>
				     	<select name="id_departamento" class="form-control">
				      		<?php while($row = mysqli_fetch_array($departamentos)){ ?>
				      		<option value="<?php echo $row['id_departamento']; ?>"><?php echo $row['departamento']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>

				    <div class="form-group">
				     	<label for="inputEmail" class="control-label">Nuevo Cargo:</label>
				     	<select name="id_cargo" class="form-control">
				      		<?php while($row = mysqli_fetch_array($cargos)){ ?>
				      		<option value="<?php echo $row['id_cargo']; ?>"><?php echo $row['cargo']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Desde</label>
				        <input class="form-control" name="fch_inicio" type="date" required>
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Hasta</label>
				        <input class="form-control" name="fch_fin" type="date" required>
				    </div>
				     <input value="1" name="vigente" type="hidden" required>
				    
				    <div class="form-group">
				    	 <button type="submit" class="btn btn-success">Registrar</button>
				        <button type="reset" class="btn btn-warning">Borrar</button>
				    </div>
				</form>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
	  </div>
	</div>
</div>