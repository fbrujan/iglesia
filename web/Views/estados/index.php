
<div class="box-principal">
<h3 class="titulo">Listado de Estados<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Estados</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Estado</th>
		      <th>Elegible para Lider</th>
		      <th>Acción</th>		      
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_estado']; ?></td>-->
			    <td><?php echo $row['estado']; ?></td>
			    <td><?php echo $row['elegible_lider']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>estados/editar/<?php echo $row['id_estado']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>estados/eliminar/<?php echo $row['id_estado']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>
