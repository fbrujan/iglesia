<div class="box-principal">
<h3 class="titulo"> Vista de Servicios<br /></h3>
	<a class="btn btn-primary" href="<?php echo URL;?>servicios/agregar">Nuevo Servicio</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title"> Listado de Servicios</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Iglesia u Organizacion</th>
						<th>Servicio </th>
						<th>Fecha</th>
						<th>Hora</th>
						<th>Tipo de Servicio</th>
						<th>Departamento</th> 
						<th>Lider</th>
						<th>Costo</th>
						<th>Registro</th>
						<th>Asistencia</th>
						<th>Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while($row = mysqli_fetch_array($datos)){ ?>
					<tr>
						<td><?php echo $row['iglesia'];?></td>
						<td><a href="<?php echo URL;?>servicios/ver/<?php echo $row['id_servicio'];?>"><?php echo $row['servicio'];?></a></td>						
						<td><?php echo $row['fecha_inicio'];?></td>
						<td><?php echo $row['hora_inicio'];?></td>	
						<td><?php echo $row['tipo_servicio'];?></td>
						<td><?php echo $row['departamento'];?></td>	
						<td><?php echo $row['lider'];?></td>		
						<td><?php echo $row['costo'];?></td>
						<td><?php echo $row['registrados'];?></td>
						<td><?php echo $row['asistencia'];?></td>					
						<td><a class="btn btn-warning" href="<?php echo URL; ?>servicios/editar/<?php  echo $row['id_servicio'];?>">Editar</a>						
						</td>
					</tr>
							
					<?php	} ?> 
					
							
						
				</tbody>
			</table>			
		</div>
	</div>
</div>