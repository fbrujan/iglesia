<?php //$paises = $paises->index(); ?>
<div class="box-paises">
	<h3> Listado de Paises</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Paises</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 60%; text-transform: uppercase;">Pais</th>
						<th style="width: 40%; text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($datos)) { ?>
					<tr>
						<td style="text-align: left;" ><?php echo $row['pais'] ;?></td>
						<td style="text-align: right;">
							<a class="btn btn-warning" href="<?php echo URL;?>paises/editar/<?php echo $row['id_pais'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>paises/eliminar/<?php echo $row['id_pais'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
