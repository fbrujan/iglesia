
<div class="box-principal">
<h3 class="titulo">Editar Estados<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Editar Estados: <?php echo $datos['estado']; ?></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST">
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Nombre del Estado</label>
				        <input class="form-control" value="<?php echo $datos['estado']; ?>" name="estado" type="text" required>
				    </div>
				    
				    <div class="form-group">
				    	<label for="inputEmail" class="control-label">Elegible para Lider</label>
				    	<input type="radio" name="elegible_lider" value="0" <?php if($datos['elegible_lider']==0) { echo 'checked';}?> >No
              			<input type="radio" name="elegible_lider" value="1" <?php if($datos['elegible_lider']==1) { echo 'checked';}?> >Si
              		</div>


				    <input value="<?php echo $datos['id_estado']; ?>" name="id_estado" type="hidden">
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

