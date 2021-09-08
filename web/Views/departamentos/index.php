<div class="box-principal">
<h3 class="titulo">Listado de Departamentos<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Departamentos</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Departamento</th>
		       <th>Descripcion</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_departamento']; ?></td>-->
			    <td><?php echo $row['departamento']; ?></td>
			    <td><?php echo $row['descripcion']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>departamentos/editar/<?php echo $row['id_departamento']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>departamentos/eliminar/<?php echo $row['id_departamento']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>
