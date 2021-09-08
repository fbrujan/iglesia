<?php 	$conceptos			= $finanzas->listar_conceptos(); ?>
<?php	$personas 			= $finanzas->listar_personas(); ?>
<?php	$tipos_tran 		= $finanzas->listar_tipos_transaccion(); ?>


<div class="box-principal">
<h3 class="titulo">Manejo de Finanzas<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title"> Nueva Transaccion</h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group">
				      <label for="fecha" class="control-label">Fecha:</label>
				      
				        <input class="form-control" name="fecha" type="date"  required id="fecha" value="<?php 
				        			if (isset($_POST['fecha'])) {
				      						echo $_POST['fecha'];
				      					}
				        ?>"
				        >


				    </div>
				    <div class="form-group">
				     	<label for="id_tipo_transaccion" class="control-label">Tipo:</label>
				     	<select name="id_tipo_transaccion" class="form-control" id="id_tipo_transaccion">
				      		<?php while($row = mysqli_fetch_array($tipos_tran)){ ?>
				      		<option value="<?php echo $row['id_tipo_transaccion']; ?>"<?php
				      				if (isset($_POST['id_tipo_transaccion'])) {
				      					if ($row['id_tipo_transaccion'] ==$_POST['id_tipo_transaccion']) {
				      						echo " selected";
				      					}
				      				}

				      			?>

				      			>
				      				<?php echo $row['tipo_transaccion']; ?>
				      				
				      		</option>
				      	<?php } ?>
				      </select>
				    </div>

					<div class="form-group">
				     	<label for="id_concepto_transaccion" class="control-label">Concepto:</label>
				     	<select name="id_concepto_transaccion" class="form-control" id="id_concepto_transaccion">
				      		<?php while($row = mysqli_fetch_array($conceptos)){ ?>
				      		<option value="<?php echo $row['id_concepto_transaccion']; ?>"<?php
				      				if (isset($_POST['id_concepto_transaccion'])) {
				      					if ($row['id_concepto_transaccion'] ==$_POST['id_concepto_transaccion']) {
				      						echo " selected";
				      					}
				      				}

				      			?>

				      			>
				      				<?php echo $row['concepto_transaccion']; ?>
				      				
				      		</option>
				      	<?php } ?>
				      </select>
				    </div>



				    <div class="form-group">
				     	<label for="nombre" class="control-label">Buscar:</label>
				     	<input tabindex="10" type="text" name="nombre" id="nombre" autocomplete="off">
				    </div>


				    <div class="form-group">
				     	<label for="id_persona" class="control-label">Nombre:</label>
				     	<select name="id_persona" class="form-control" id="id_persona">
				     		<option value="0"> Seleccione  una persona....</option>
				      		<?php while($row = mysqli_fetch_array($personas)){ ?>
				      		<option value="<?php echo $row['id_persona']; ?>"><?php echo $row['nombres'] . ' ' .  $row['apellidos']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>

			
				    <div class="form-group">
				     	<label for="monto" class="control-label" required id="monto">Monto:</label>
				     	<input tabindex="13" type="number" name="monto" id="monto">
				    </div>
					<div class="form-group" >
				     	<label for="comentario" class="control-label" required id="comentario">Descripcion:</label>
				     	<input  type="text" name="comentario" id="comentario" value="<?php if(isset($_POST['comentario'])){echo $_POST['comentario'];}?>">
				    </div>
				    <input value="fbrujan" name="usuario" type="hidden" required id="usuario">
				    <input value="Vigente" name="estado" type="hidden" required id="estado">
				    <div class="form-group">
				    	 <button tabindex="16" type="submit" class="btn btn-success">Registrar</button>
				         <button type="reset" class="btn btn-warning">Borrar</button>
				         <button class="btn btn-critical" > <a href="<?php echo URL;?>finanzas">REGRESAR</a></button>
				    </div>
				</form>
				
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
	  </div>
	</div>
</div>