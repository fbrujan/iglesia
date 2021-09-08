<?php $rango_ministerial = $rango_ministerial->index(); ?>
<div class="box-rango-ministerial">
	<h3> Listado de Rangos Ministeriales</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Rangos Ministeriales</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 60%; text-transform: uppercase;">Rango Ministerial</th>
						<th style="width: 60%; text-transform: uppercase;">Codigo del Rango</th>
						<th style="width: 40%; text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($rango_ministerial)) { ?>
					<tr>
						<td style="text-align: left;" ><?php echo $row['rango_ministerial'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['cod_rango'] ;?></td>
						<td style="text-align: right;">
							<a class="btn btn-warning" href="<?php echo URL;?>rango_ministerial/editar/<?php echo $row['id_rango'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>rango_ministerial/eliminar/<?php echo $row['id_rango'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
