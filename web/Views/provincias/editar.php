<div class="box-provincias-agregar">
	<h3> Provincias</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">Edicion de Provincia</h1>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="provincia" class="control-label" ><h5>Nombre de Provincia:</h5></label>
							<input type="text" name="provincia" id="provincia" class="form-control"  style="text-align: center;" value="<?php echo $datos['provincia']; ?>" required autocomplete="off">
							<label for="ciudad_cabecera" class="control-label"><h5>Ciudad cabecera:</h5></label>
							<input type="text" name="ciudad_cabecera" id="ciudad_cabecera" class="form-control" style="text-align: center;" value="<?php echo $datos['ciudad_cabecera']; ?>" required autocomplete="off">
							<input type="hidden" id="id_provincia" name="id_provincia" value="<?php echo $datos['id_provincia']; ?>">
							<input type="hidden" id="id_pais" name="id_pais" value="<?php echo $datos['id_pais']; ?>">
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
