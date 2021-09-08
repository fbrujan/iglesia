<?php $provincias = $provincias->index(); ?>
<div class="box-provincias">
	<h3> Listado de Provincias</h3>
	<a class="btn btn-primary" href="<?php echo URL;?>provincias/agregar">Agregar Nueva Provincia</a>
	
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Provincias</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 20%; text-transform: uppercase;">Pais</th>
						<th style="width: 25%; text-transform: uppercase;">Provincia</th>
						<th style="width: 30%; text-transform: uppercase;">Ciudad Principal</th>
						<th style="width: 25%; text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($provincias)) { ?>
					<tr>
						<td style="text-align: left; width: 20%;" ><?php echo $row['pais'] ;?></td>
						<td style="text-align: left; width: 20%;" ><?php echo $row['provincia'] ;?></td>
						<td style="text-align: left; width: 30%;" ><?php echo $row['ciudad_cabecera'] ;?></td>
						<td style="text-align: right; width: 25%;" >
							<a class="btn btn-warning" href="<?php echo URL;?>provincias/editar/<?php echo $row['id_provincia'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>provincias/eliminar/<?php echo $row['id_provincia'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
