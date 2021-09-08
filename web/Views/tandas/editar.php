<div class="box-principal">
<h3 class="titulo">Editar Tandas<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Editar Tandas: <?php echo $datos['tanda']; ?></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST">
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Nombre del Tanda</label>
				        <input class="form-control" value="<?php echo $datos['tanda']; ?>" name="tanda" type="text" required>
				    </div>
				    <input value="<?php echo $datos['id_tanda']; ?>" name="id_tanda" type="hidden">
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

