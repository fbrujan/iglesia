<div class="box-principal">
<h3 class="titulo"> Vista de Lideres<br /></h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title"> Listado de Lideres Actuales</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Imagen</th>
						<th>Nombre</th>
						<th>Cargo</th>
						<th>Departamento</th> 
						<th>Periodo</th><!--
						<th>Asociacion</th>
						<th>Fecha Conversion</th>
						<th>Fecha Bautismo</th>
						<th>Estado Actual</th>
						<th>Sexo</th>
						<th>Numero Documento</th> -->
						<th>Accion</th>
					</tr>
				</thead>
				<tbody>
					<?php while($row = mysqli_fetch_array($datos)){ ?>
					<tr>
						<td><img class="imagen-avatar" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $row['imagen'];?>"></td>
						<td><a href="<?php echo URL; ?>lideres/ver/<?php echo $row['id_lider'];?>"> <?php echo $row['lider'];?></a></td>						
						<td><?php echo $row['cargo'];?></td>
						<td><?php echo $row['departamento'];?></td>	
						<td><?php echo $row['periodo'];?></td>						
						<td><a class="btn btn-warning" href="<?php echo URL; ?>lideres/editar/<?php  echo $row['id_lider'];?>">Editar</a>
							<a class="btn btn-danger" href="<?php echo URL; ?>lideres/eliminar/<?php  echo $row['id_lider'];?>">Eliminar</a> 
						</td>
					</tr>
							
					<?php	} ?> 
					
							
						
				</tbody>
			</table>			
		</div>
	</div>
</div>