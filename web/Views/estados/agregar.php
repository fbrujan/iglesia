<?php
	ob_start();
?>
<div class="box-principal">
<h3 class="titulo">Agregar Estado<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Agregar un nuevo Estado</h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Nombre del Estado</label>
				        <input class="form-control" name="estado" type="text" required>
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Elegible para Lider</label>
		              <input type="radio" name="elegible_lider" value="0" checked>No
		              <input type="radio" name="elegible_lider" value="1" >Si            		
				    </div>
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

<?php
	ob_end_flush();
?>