<div class="box-principal">
<h3 class="titulo"> Vista de Miembros<br /></h3>
<a class="btn btn-primary" href="<?php echo URL;?>miembros/agregar">Agregar Nuevo</a>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title"> Listado de Miembros</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Imagen</th>
						<th>Nombre</th>
						<th>Apellidos</th> 
						<th>Circuito</th> 
						<th>Iglesia</th> 
						<th>Asociacion</th>
						<th>Estado Actual</th><!--
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
						<td><img class="imagen-avatar" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $row['imagen'];?>"></td>
						<td><a href="<?php echo URL; ?>personas/editar/<?php echo $row['id_miembro'];?>"> <?php echo $row['nombres'];?></a></td>						
						<td><?php echo $row['apellidos'];?></td>
						<td><?php echo $row['circuito'];?></td>	
						<td><?php echo $row['iglesia'];?></td>	
						<td><?php echo $row['sociedad'];?></td>	
						<td><?php echo $row['estado'];?></td>						
						<td><a class="btn btn-warning" href="<?php echo URL; ?>miembros/editar/<?php  echo $row['id_miembro'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL; ?>miembros/eliminar/<?php  echo $row['id_miembro'];?>">Eliminar</a> 
						</td>
					</tr>
							
					<?php	} ?> 
					
							
						
				</tbody>
			</table>			
		</div>
	</div>
</div>