<div class="box-paises">
	<h3> Paises</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">Edicion de Pais</h1>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="pais" class="control-label"><h5>Nuevo Nombre de Pais:<b><?php echo $datos['pais']; ?></b></h5></label>
							<input type="text" name="pais" id="pais" class="form-control"  value="<?php echo $datos['pais']; ?>" required autocomplete="off">
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
