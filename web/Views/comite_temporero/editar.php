<div class="box-comite-temporero">
	<h3> Comites Temporeros</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">Edicion de Comite Temporero</h1>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="comite_temporero" class="control-label"><h5>Nuevo Nombre de Comite:</h5></label>
							<input type="text" name="comite_temporero" id="comite_temporero" class="form-control"  value="<?php echo $datos['comite_temporero']; ?>" required autocomplete="off">
							<input type="hidden" id="id_comite_temporero" name="id_comite_temporero" value="<?php echo $datos['id_comite_temporero']; ?>">
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
