<div class="box-principal">
<h3 class="titulo">Editar Tipo Servicio<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Editar Tipo Servicio: <?php echo $datos['tipo_servicio']; ?></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST">
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Tipo Servicio</label>
				        <input class="form-control" value="<?php echo $datos['tipo_servicio']; ?>" name="tipo_servicio" type="text" required>
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Codigo Tipo Servicio</label>
				        <input class="form-control" value="<?php echo $datos['cod_tipo_servicio']; ?>" name="cod_tipo_servicio" type="text" required>
				    </div>
				    <input value="<?php echo $datos['id_tipo_servicio']; ?>" name="id_tipo_servicio" type="hidden">
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

