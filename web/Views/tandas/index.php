<div class="box-principal">
<h3 class="titulo">Listado de Tandas<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Tandas</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Tanda</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_tanda']; ?></td>-->
			    <td><?php echo $row['tanda']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>tandas/editar/<?php echo $row['id_tanda']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>tandas/eliminar/<?php echo $row['id_tanda']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>