<div class="box-principal">
<h3 class="titulo"> Registro Actividades<br /></h3>
<a class="btn btn-primary" href="<?php echo URL;?>registros/agregar">Agregar Nuevo</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title"> Personas Registradas en Actividades</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Lugar</th>
						<th>Actividad</th>
						<th>Nombre</th>
						<th>Apellidos</th> 
						<th>Circuito</th> 
						<th>Iglesia</th> 
						<th>Clasificacion</th>
						<th>Tipo Registro</th>
						<th>Fecha Registro</th><!--
						<th>Fecha Conversion</th>
						<th>Fecha Bautismo</th>						
						<th>Sexo</th>
						<th>Numero Documento</th> -->
						<th>Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while($row = mysqli_fetch_array($datos)){ ?>
					<tr>
						<td><?php echo $row['iglesia_anfitrion'];?></td>
						<td><?php echo $row['servicio'];?></td>
						<td><a href="<?php echo URL; ?>registros/editar/<?php echo $row['id_registro'];?>"> <?php echo $row['nombres'];?></a></td>						
						<td><?php echo $row['apellidos'];?></td>
						<td><?php echo $row['circuito'];?></td>	
						<td><?php echo $row['iglesia'];?></td>	
						<td><?php echo $row['clasificacion'];?></td>	
						<td><?php echo $row['condicion'];?></td>	
						<td><?php echo $row['fecha_registro'];?></td>						
						<td><a class="btn btn-warning" href="<?php echo URL; ?>registros/editar/<?php  echo $row['id_registro'];?>">Editar</a>
							
						</td>
					</tr>
							
					<?php	} ?> 					
							
						
				</tbody>
			</table>			
		</div>
	</div>
</div>