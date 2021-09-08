<?php $miembros 		= $lideres->listarMiembros(); ?>
<?php $sociedades 		= $lideres->listarSociedades(); ?>
<?php $cargos 			= $lideres->listarCargos(); ?>
<?php $departamento 	= $lideres->listarDepartamentos(); ?>
<div class="box-principal">
<h3 class="titulo"><?php echo $datos['miembro']; ?><br />
	<?php echo $datos['periodo'];?><hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Editar Lider <?php echo $datos['miembro'] ; ?></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-3">
	  			<div class="panel panel-default">
				  <div class="panel-body">
				    <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen']; ?>">
				  </div>
				</div>
	  		</div>
	  		<div class="col-md-9">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">

	  				 <div class="form-group">
				      <label for="inputEmail" class="control-label" ><b>Cargo Actual: <?php echo $datos['cargo']; ?></b></label>
				      <select name="id_cargo" class="form-control">
				      	<?php while($row = mysqli_fetch_array($cargos)){ 
				      		if($datos['id_cargo']==$row['id']){ ?>
				      			<option selected="selected" value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
				      			 
				      	<?php } } ?>
				      </select>
				    </div>

				    
				    <div class="form-group">
				      <label for="inputEmail" class="control-label"><b>Departamento Actual: <?php echo $datos['departamento']; ?></b></label>
				     <select name="id_departamento" class="form-control">
				      	<?php while($row = mysqli_fetch_array($departamento)){ 
				      		if($datos['id_departamento']==$row['id']){ ?>
				      			<option selected="selected" value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
				      			 
				      	<?php } } ?>
				      </select>
				    </div>
				   
				    <div class="form-group">
				      <label for="inputEmail" class="control-label"><b>Fecha Inicio</b></label>
				        <input class="form-control" value="<?php echo $datos['fch_inicio']; ?>" name="fch_inicio" type="date" >
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label"><b>Fecha Fin</b></label>
				        <input class="form-control" value="<?php echo $datos['fch_fin']; ?>" name="fch_fin" type="date" >
				    </div>

				    
				    <div class="form-group">
				      <label for="inputEmail" class="control-label"><b>Vigente</b></label>
				        <input class="form-control" value="<?php echo $datos['vigente']; ?>" name="vigente" type="number" >
				    </div>

				    <input value="<?php echo $datos['id']; ?>" name="id" type="hidden" required>
				     <input value="<?php echo $datos['id_miembro']; ?>" name="id_miembro" type="hidden" required>
				    <input value="<?php echo $datos['imagen']; ?>" name="imagen" type="hidden" required>
				    <div class="form-group">
				    	 <button type="submit" class="btn btn-success">Editar</button>
				        <button type="reset" class="btn btn-warning">Borrar</button>
				    </div>
				</form>
	  		</div>
	  	</div>
	  </div>
	</div>
</div>