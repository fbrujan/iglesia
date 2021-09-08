<div class="box-iglesias">
	<h3> Listado de Iglesias</h3>
	<a class="btn btn-primary" href="<?php echo URL;?>iglesias/agregar">Agregar Nueva Iglesia</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Listado de Iglesias</h3>

		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover table-condensed">
				<thead>
					<tr>
						<th style="text-transform: uppercase;">Distrito</th>
						<th style="text-transform: uppercase;">Circuito</th>
						<th style="text-transform: uppercase;">Iglesia</th>
						<th style="text-transform: uppercase;">Direccion</th>
						<th style="text-transform: uppercase;">Telefono</th>
						<th style="text-transform: uppercase;">Fundador</th>
						<th style="text-transform: uppercase;">Fecha Fundacion</th>
						
						<th style="text-align:center; text-transform: uppercase;" >Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = mysqli_fetch_array($datos)) { ?>
					<tr>
						<td style="text-align: left;" ><?php echo $row['distrito'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['circuito'] ;?></td>
						<td style="text-align: left;" ><a href="<?php echo URL;?>iglesias/detalles/<?php echo $row['id_iglesia'];?>"><?php echo $row['iglesia'] ;?></a></td>
						<td style="text-align: left;" ><?php echo $row['direccion'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['telefono'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['fundador'] ;?></td>
						<td style="text-align: left;" ><?php echo $row['fecha_fundada'] ;?></td>
						
						<td style="text-align: right;" >
							<a class="btn btn-warning" href="<?php echo URL;?>iglesias/editar/<?php echo $row['id_iglesia'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL;?>iglesias/eliminar/<?php echo $row['id_iglesia'];?>">Eliminar</a>
						</td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			
		</div>
	</div>
</div>
