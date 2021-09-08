<div class="box-principal">
<h3 class="titulo">Listado de Cargos<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Cargos</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Cargo</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_cargo']; ?></td>-->
			    <td><?php echo $row['cargo']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>cargos/editar/<?php echo $row['id_cargo']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>cargos/eliminar/<?php echo $row['id_cargo']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>
