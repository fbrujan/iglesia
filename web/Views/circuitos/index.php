<?php $circuitos = $circuitos->index(); ?>
<div class="box-circuitos">
	<h3> Listado de Circuitos</h3>
	<a class="btn btn-primary" href="<?php echo URL;?>circuitos/agregar">Agregar Nuevo Circuito</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Circuitos</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 20%; text-transform: uppercase;">Distrito</th>
						<th style="width: 25%; text-transform: uppercase;">Circuito</th>
						<th style="width: 25%; text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($circuitos)) { ?>
					<tr>
						<td style="text-align: left; width: 20%;" ><?php echo $row['distrito'] ;?></td>
						<td style="text-align: left; width: 20%;" ><?php echo $row['circuito'] ;?></td>
						<td style="text-align: right; width: 25%;" >
							<a class="btn btn-warning" href="<?php echo URL;?>circuitos/editar/<?php echo $row['id_circuito'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>circuitos/eliminar/<?php echo $row['id_circuito'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
