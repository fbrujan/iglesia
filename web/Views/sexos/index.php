<div class="box-principal">
<h3 class="titulo">Listado de Sexos<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Sexos</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Sexo</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_sexo']; ?></td>-->
			    <td><?php echo $row['sexo']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>sexos/editar/<?php echo $row['id_sexo']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>sexos/eliminar/<?php echo $row['id_sexo']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>