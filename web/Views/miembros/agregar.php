<?php $paises = $miembros->listarPaises(); ?>
<?php $provincias = $miembros->listarProvincias(); ?>
<?php $estados = $miembros->listarEstados(); ?>
<?php $iglesias = $miembros->listarIglesias(); ?>


<div class="box-principal">
<h3 class="titulo">Agregar Miembros<hr></h3>
	<div class="panel panel-success">
	  <div class="panel-heading">
	    <h3 class="panel-title">Agregar un nuevo Miembro</h3>
	  </div>
	  <div class="panel-body">
	  	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10">
	  			<form class="form-horizontal" action="" method="POST" enctype="multipart/form-data">
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Nombre</label>
				      <input  name="nombre" type="text" required>
				    
				      <label for="inputEmail" class="control-label">Apellidos</label>
				      <input name="apellidos" type="text" required>

				      <label for="inputEmail" class="control-label">Sexo:</label>
		              <input type="radio" name="id_sexo" value="1" checked >Masculino
		              <input type="radio" name="id_sexo" value="2" >Femenino
				   
				    </div>

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Telefono</label>
				      <input name="telefono" type="text" >
				      
				      <label for="inputEmail" class="control-label">Apodo</label>
				      <input type="text" name="apodo" id="apodo" value="">
				    </div>
				    
				    <div class="form-group">
				      	<label for="inputEmail" class="control-label">Documento Identidad:</label>
				      	<input name="nro_documento" type="text" >
				      	<input type="radio" name="id_tipo_documento" value="1" >Cedula
			            <input type="radio" name="id_tipo_documento" value="2" >Pasaporte
			            <input type="radio" name="id_tipo_documento" value="3" checked>Otro
				    </div>

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Pais:</label>
				      <select name="id_pais">
				      	<?php while($row = mysqli_fetch_array($paises)){ ?>
				      		<option value="<?php echo $row['id_pais']; ?>"><?php echo $row['pais']; ?></option>
				      	<?php } ?>
				      </select>
				    
				      <label for="inputEmail" class="control-label">Provincia:</label>
				      <select name="id_provincia">
				      	<?php while($row = mysqli_fetch_array($provincias)){ ?>
				      		<option value="<?php echo $row['id_provincia']; ?>"><?php echo $row['provincia']; ?></option>
				      	<?php } ?>
				      </select>
				    
				      <label for="inputEmail" class="control-label">Direccion</label>
				      <input name="direccion" type="text" >
				    </div>
				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Fecha Nacimiento</label>
				      <input  name="fch_nacimiento" type="date" >
				    
				      <label for="inputEmail" class="control-label">Fecha Conversion</label>
				      <input  name="fch_conversion" type="date">
				  
				      <label for="inputEmail" class="control-label">Fecha Bautismo</label>
				      <input  name="fch_bautismo" type="date" >
				    </div>
				    
				    <div class="form-group">
				      	<label for="inputEmail" class="control-label">Sociedad que Pertenece:</label>
				       	<input type="radio" name="id_sociedad" value="1" checked >Dama
	                    <input type="radio" name="id_sociedad" value="2" >Caballero
	                    <input type="radio" name="id_sociedad" value="3" >Joven
	                    <input type="radio" name="id_sociedad" value="4" >Juvenil
	                    <input type="radio" name="id_sociedad" value="5" >Nino
				    </div>

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Iglesia:</label>
				      <select name="id_iglesia" >
				      	<?php while($row = mysqli_fetch_array($iglesias)){ ?>
				      		<option value="<?php echo $row['id_iglesia']; ?>"><?php echo $row['distrito']."::".$row['circuito']."::".$row['iglesia']; ?></option>
				      	<?php } ?>
				      </select>
				   
				      <label for="inputEmail" class="control-label">Estatus en la Iglesia:</label>
				      <select name="id_estado" >
				      	<?php while($row = mysqli_fetch_array($estados)){ ?>
				      		<option value="<?php echo $row['id_estado']; ?>"><?php echo $row['estado']; ?></option>
				      	<?php } ?>
				      </select>
				    </div>			     

				   


				    <div class="form-group">
				     	<label for="inputEmail" class="control-label">Estado Civil:</label>
			            <input type="radio" name="id_estado_civil" value="1" checked>Soltero(a)
			            <input type="radio" name="id_estado_civil" value="2" >Casado(a)
			            <input type="radio" name="id_estado_civil" value="3" >Viudo(a)
			            <input type="radio" name="id_estado_civil" value="4" >Divorciado(a)
			            <input type="radio" name="id_estado_civil" value="5" >Union Libre
				    </div>

				     <div class="form-group">
				     	<label for="inputEmail" class="control-label">Rango Ministerial:</label>
			            <input type="radio" name="id_rango_ministerial" value="1" checked>Creyente
			            <input type="radio" name="id_rango_ministerial" value="2" >Laico Registrado
			            <input type="radio" name="id_rango_ministerial" value="3" >Exhortador(a)
			            <input type="radio" name="id_rango_ministerial" value="4" >Evangelista
			            <input type="radio" name="id_rango_ministerial" value="5" >Lic. Predicador(a)
			            <input type="radio" name="id_rango_ministerial" value="6" >Lic. Pastor(a)
			            <input type="radio" name="id_rango_ministerial" value="7" >Ministro Ordenado(a)
			            
				    </div>

				    

				    <div class="form-group">
				      <label for="inputEmail" class="control-label">Imagen</label>
				        <input class="form-control" name="imagen" id="imagen" type="file" >
				    </div>
				    
				    <div class="form-group">
				    	<input type="hidden" name="id_persona" value="">
				    	<button type="submit" class="btn btn-success">Registrar</button>
				        <button type="reset" class="btn btn-warning">Borrar</button>
				        <button class="btn btn-critical" > <a href="<?php echo URL;?>miembros">REGRESAR</a></button>		
				    </div>
				</form>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
	  </div>
	</div>
</div>

