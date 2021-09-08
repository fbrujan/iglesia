<?php $comite_temporero = $comite_temporero->index(); ?>
<div class="box-comite-temporero">
	<h3> Listado de Comites Temporeros</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Comites Temporeros</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 60%; text-transform: uppercase;">Cargo</th>
						<th style="width: 40%; text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($comite_temporero)) { ?>
					<tr>
						<td style="text-align: left;" ><?php echo $row['comite_temporero'] ;?></td>
						<td style="text-align: right;">
							<a class="btn btn-warning" href="<?php echo URL;?>comite_temporero/editar/<?php echo $row['id_comite_temporero'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>comite_temporero/eliminar/<?php echo $row['id_comite_temporero'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
