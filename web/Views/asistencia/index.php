<div class="box-principal">
<h3 class="titulo"> Vista de Asistencia<br /></h3>
<a class="btn btn-primary" href="<?php echo URL;?>asistencia/agregar">Nueva Asistencia</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-litle"> Listado de Asistencia a Actividades</h3>
		</div>		
		<div   class="panel-body"  style="overflow:scroll; height:400px;">
			<table class="table table-striped table-hover"  >
				<thead>
					<tr>						
						<th>Tipo de Actividad</th> 
						<th>Nombre Actividad</th> 
						<th>Nombre de Asistente</th>
						<th>Clasificacion</th>
						<th>Condicion</th>
						<th>Fecha</th>
						<th>Tanda en que Asistio</th>	
						<th>Accion</th>
					</tr>
				</thead>
		     	<tbody>					
					<?php while($row = mysqli_fetch_array($datos)){ ?>
					<tr>
						<td><?php echo $row['tipo_servicio'];?></td>						
						<td><a href="<?php echo URL; ?>asistencia/ver/<?php echo $row['id_asistencia'];?>"> <?php echo $row['servicio'];?></a></td>
						<td><?php echo $row['nombre'];?></td>
						<td><?php echo $row['clasificacion'] ?></td>
						<td><?php echo $row['condicion'] ?></td>		
						<td><?php echo $row['fecha'];?></td>	
						<td><?php echo $row['tanda'];?></td>	
						<td><a class="btn btn-warning" href="<?php echo URL; ?>asistencia/editar/<?php  echo $row['id_servicio'];?>">Editar</a>

							
						</td>
					</tr>
							
					<?php	} ?> 
					
							
						
				</tbody>
			</table>			
		</div>
	</div>
</div>