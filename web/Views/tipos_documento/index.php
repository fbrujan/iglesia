<div class="box-principal">
<h3 class="titulo">Listado de Tipos_Documentos<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Tipos_Documentos</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Tipo documento</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id']; ?></td>-->
			    <td><?php echo $row['tipo_documento']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>tipos_documento/editar/<?php echo $row['id_tipo_documento']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>tipos_documento/eliminar/<?php echo $row['id_tipo_documento']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>