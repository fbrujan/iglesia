<?php $personas = $personas->index(); ?>
<div class="box-personas">
	<h3> Listado de Personas</h3>
	<a class="btn btn-primary" href="<?php echo URL;?>personas/agregar">Agregar Nueva</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Personas</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="text-transform: uppercase;">Imagen:</th>
						<th style="text-transform: uppercase;">Nombre:</th>
						<th style="text-transform: uppercase;">Telefono</th>
						<th style="text-transform: uppercase;">Apodo</th>
						<th style="text-transform: uppercase;">Sexo</th>
						<th style="text-transform: uppercase;">Clasificacion</th>
						<th style="text-transform: uppercase;">Estado Civil</th>
						<th style="text-transform: uppercase;">Pais</th>
						<th style="text-transform: uppercase;">Provincia</th>
						<th style="text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($personas)) { ?>
					<tr>
						<td><img class="imagen-avatar" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $row['imagen'];?>"></td>
						<td style="text-align: left;" ><a href="<?php echo URL;?>personas/detalles/<?php echo $row['id_persona'];?>"><?php echo $row['persona'] ;?></a></td>
						<td style="text-align: left;" ><?php echo $row['telefono'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['apodo'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['sexo'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['clasificacion'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['estado_civil'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['pais'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['provincia'] ;?></td>
						<td style="text-align: right;" >
							<a class="btn btn-warning" href="<?php echo URL;?>personas/editar/<?php echo $row['id_persona'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>personas/eliminar/<?php echo $row['id_persona'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
