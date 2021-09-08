<div class="box-principal">
<h3 class="titulo">Editar Sexos<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Editar Sexos: <?php echo $datos['sexo']; ?></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST">
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Nombre del Sexo</label>
				        <input class="form-control" value="<?php echo $datos['sexo']; ?>" name="sexo" type="text" required>
				    </div>
				    <input value="<?php echo $datos['id_sexo']; ?>" name="id_sexo" type="hidden">
				    <div class="form-group">
				    	 <button type="submit" class="btn btn-success">Editar</button>
				        <button type="reset" class="btn btn-warning">Borrar</button>
				    </div>
				</form>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
	  </div>
	</div>
</div>

