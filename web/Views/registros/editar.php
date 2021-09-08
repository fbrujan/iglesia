<?php $sociedades = $miembros->listarSociedades(); ?>
<?php $estados = $miembros->listarEstados(); ?>
<?php $iglesia = $miembros->listarIglesias(); ?>
<?php $rango_ministerial = $miembros->listarRangosMinisteriales(); ?>
<?php $sexo = $miembros->listarSexos(); ?>
<?php $tipoDocumento = $miembros->listarTipoDocumento(); ?>
<div class="box-principal">
<h3 class="titulo">Editar Miembro<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Miembro:<b> <?php echo $datos['nombres'] . " " . $datos['apellidos']; ?></b></h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-3">
	  			<div class="panel panel-default">
				  <div class="panel-body">
				    <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen']; ?>">
				   
				  </div>
				  <div> <input class="form-control" name="imagen" id="imagen" type="file" required></div>
				</div>
	  		</div>
	  		<div class="col-md-9">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group">
				      Nombre:<b><?php echo $datos['nombres']; ?></b>

				    
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">  Apellidos:<b><?php echo $datos['apellidos']; ?></b></label>
				        
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Fecha Nacimiemto: <?php echo $datos['fecha_nacimiento']; ?></label>
				      
				    </div>
				     <div class="form-group">
				      <label for="inputEmail" class="control-label">Sexo: <b>: <?php echo $datos['sexo']; ?></b></label>
				      
				    </div>

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Documento (<b><?php echo $datos['tipo_documento']; ?>):</b></label>
				      
				    
				      <label for="inputEmail" class="control-label"><b> <?php echo $datos['nro_documento_identidad']; ?></b></label>
				      
				    </div>
				     <div class="form-group">
				      <label for="inputEmail" class="control-label">Fecha Conversion </label>
				        <input class="form-control" value="<?php echo $datos['fecha_conversion']; ?>" name="fch_conversion" type="date" >
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Fecha Bautismo</label>
				        <input class="form-control" value="<?php echo $datos['fecha_bautismo']; ?>" name="fch_bautismo" type="date" >
				    </div>		     
				    
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Sociedad que pertenece(<b><?php echo $datos['sociedad']; ?></b>)</label>
				      <select name="id_sociedad" class="form-control">
				      	<?php while($row = mysqli_fetch_array($sociedades)){ 
				      		if($datos['id_sociedad']==$row['id_sociedad']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_sociedad']; ?>"><?php echo $row['sociedad']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_sociedad']; ?>"><?php echo $row['sociedad']; ?></option>
				      			 
				      	<?php } } ?>
				      </select>
				    </div>

				     <div class="form-group">
				      <label for="inputEmail" class="control-label">Iglesia que pertenece(<b><?php echo $datos['iglesia']; ?></b>)</label>
				      <select name="id_iglesia" class="form-control">
				      	<?php while($row = mysqli_fetch_array($iglesia)){ 
				      		if($datos['id_iglesia']==$row['id_iglesia']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_iglesia']; ?>"><?php echo $row['iglesia']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_iglesia']; ?>"><?php echo $row['iglesia']; ?></option>
				      			 
				      	<?php } } ?>
				      </select>
				    </div>

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Rango Ministerial(<b><?php echo $datos['rango_ministerial']; ?></b>)</label>
				      <select name="id_rango_ministerial" class="form-control">
				      	<?php while($row = mysqli_fetch_array($rango_ministerial)){ 
				      		if($datos['id_rango_ministerial']==$row['id_rango']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_rango']; ?>"><?php echo $row['rango_ministerial']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_rango']; ?>"><?php echo $row['rango_ministerial']; ?></option>
				      			 
				      	<?php } } ?>
				      </select>
				    </div>


				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Estado Actual:(<b> <?php echo $datos['estado']; ?></b>)</label>
				     <select name="id_estado" class="form-control">
				      	<?php while($row = mysqli_fetch_array($estados)){ 
				      		if($datos['id_estado']==$row['id_estado']){ ?>
				      			<option selected="selected" value="<?php echo $row['id_estado']; ?>"><?php echo $row['estado']; ?></option>
				      			<?php }else{?><option value="<?php echo $row['id_estado']; ?>"><?php echo $row['estado']; ?></option>
				      			 
				      	<?php } } ?>
				      </select>
				    </div>

				   
				   <div class="form-group">
				      <label for="inputEmail" class="control-label">Desde:</label>
				        <input class="form-control" value="<?php echo $datos['fecha_inicio']; ?>" name="fch_inicio" type="date" >
				    </div>		

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Hasta</label>
				        <input class="form-control" value="<?php echo $datos['fecha_fin']; ?>" name="fch_fin" type="date" >
				    </div>		

				    <input value="<?php echo $datos['id_miembro']; ?>" name="id_miembro" type="hidden" required>
				    <input value="<?php echo $datos['id_persona']; ?>" name="id_persona" type="hidden" required>
				    <input value="<?php echo $datos['imagen']; ?>" name="imagen" type="hidden" required> 
				    <div class="form-group">
				    	<button type="submit" class="btn btn-success">Editar</button>
				        <button type="reset" class="btn btn-warning">Borrar</button>
				        <button class="btn btn-critical" > <a href="<?php echo URL;?>miembros">REGRESAR</a></button>	
				    </div>
				</form>
	  		</div>
	  	</div>
	  </div>
	</div>
</div>