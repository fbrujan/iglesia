<div class="box-provincias-agregar">
	<h3> Distritos</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">Edicion de Distrito</h1>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="distrito" class="control-label" ><h5>Nombre de Distrito:</h5></label>
							<input type="text" name="distrito" id="distrito" class="form-control"  style="text-align: center;" value="<?php echo $datos['distrito']; ?>" required autocomplete="off">
							<input type="hidden" id="id_distrito" name="id_distrito" value="<?php echo $datos['id_distrito']; ?>">
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
