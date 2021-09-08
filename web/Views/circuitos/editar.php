<div class="box-circuitos">
	<h3> Circuitos</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">Edicion de Circuito</h1>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="distrito" class="control-label" ><h5>Distrito:</h5></label>
							<input type="text" name="distrito" id="distrito" class="form-control" style="text-align: center;" disabled value="<?php echo $datos['distrito'];?>">
							<label for="circuito" class="control-label" ><h5>Nombre de Circuito:</h5></label>
							<input type="text" name="circuito" id="circuito" class="form-control"  style="text-align: center;" value="<?php echo $datos['circuito']; ?>" required autocomplete="off">
							<input type="hidden" id="id_circuito" name="id_circuito" value="<?php echo $datos['id_circuito']; ?>">
							<input type="hidden" id="id_distrito" name="id_distrito" value="<?php echo $datos['id_distrito']; ?>">				
						</div>
						<div class="form-group">
							<button class="btn btn-success" type="submit">Editar</button>
							<button class="btn btn-warning" type="reset">Limpiar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>