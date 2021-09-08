<div class="box-principal">
<h3 class="titulo">Listado de Sociedades<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Sociedades</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Sociedad</th>
		      <th>Siglas</th>
		      <th>Lema</th>
		      <th>Descripcion</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_sociedad']; ?></td>-->
			    <td><?php echo $row['sociedad']; ?></td>
			    <td><?php echo $row['siglas']; ?></td>
			    <td><?php echo $row['lema']; ?></td>
			    <td><?php echo $row['descripcion']; ?></td>

			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>sociedades/editar/<?php echo $row['id_sociedad']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>sociedades/eliminar/<?php echo $row['id_sociedad']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>
