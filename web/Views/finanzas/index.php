<div class="box-principal">
<h3 class="titulo">Listado de Transacciones<hr></h3>
<a class="btn btn-primary" href="<?php echo URL;?>finanzas/agregar">Agregar Nuevo</a>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Listado de Transacciones</h3>
	  </div>
	  <div class="panel-body">
	    <table class="table table-striped table-hover ">
		  <thead>
		    <tr>
		    <!--  <th>id</th> -->
		      <th>Transaccion</th>
			  <th>Monto</th>
			  <th>Motivo</th>
			  <th>A nombre</th>
			  <th>Fecha</th>
			  <th>Detalles</th>
		      <th>Acción</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<?php while($row = mysqli_fetch_array($datos)){ ?>
		  	<tr>
		  		<!--<td><?php echo $row['id_transaccion']; ?></td>-->
			    <td><?php echo $row['tipo_transaccion']; ?></td>
				<td><?php echo $row['valor']; ?></td>
				<td><?php echo $row['concepto']; ?></td>
				<td><?php echo $row['full_name']; ?></td>
				<td><?php echo $row['fecha']; ?></td>
				<td><?php echo $row['comentario']; ?></td>
			 <td>
			 	<a class="btn btn-warning" href="<?php echo URL; ?>finanzas/editar/<?php echo $row['id_transaccion']; ?>">Editar</a>
				<a class="btn btn-danger" href="<?php echo URL; ?>finanzas/eliminar/<?php echo $row['id_transaccion']; ?>">Eliminar</a>
			</td>
			</tr>
			<?php } ?>
		  </tbody>
		</table> 
	  </div>
	</div>
</div>
<!-- 
	17 de agosto
	1-10179505501 reclamacion banreservas elaine sosa 
	--15600 7 dias laborasbles 
	8095283511 Cherry Suriel.
	asistenciafinanciera
-->
