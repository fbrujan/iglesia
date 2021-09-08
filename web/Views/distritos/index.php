<?php $distritos = $distritos->index(); ?>
<div class="box-distritos">
	<h3> Listado de Distritos</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Distritos</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 20%; text-transform: uppercase;">Pais</th>
						<th style="width: 25%; text-transform: uppercase;">Distrito</th>
						<th style="width: 25%; text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($distritos)) { ?>
					<tr>
						<td style="text-align: left; width: 20%;" ><?php echo $row['pais'] ;?></td>
						<td style="text-align: left; width: 20%;" ><?php echo $row['distrito'] ;?></td>
						<td style="text-align: right; width: 25%;" >
							<a class="btn btn-warning" href="<?php echo URL;?>distritos/editar/<?php echo $row['id_distrito'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>distritos/eliminar/<?php echo $row['id_distrito'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
