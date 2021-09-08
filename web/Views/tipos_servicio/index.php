<div class="box-principal">
<h3 class="titulo">Listado Tipos Servicios <hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado Tipos Servicios</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Tipo Servicio</th>
		       <th>Codigo Tipo Servicio</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_tipo_servicio']; ?></td>-->
			    <td><?php echo $row['tipo_servicio']; ?></td>
			     <td><?php echo $row['cod_tipo_servicio']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>tipos_servicio/editar/<?php echo $row['id_tipo_servicio']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>tipos_servicio/eliminar/<?php echo $row['id_tipo_servicio']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>