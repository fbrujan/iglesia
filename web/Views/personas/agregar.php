<?php $provincias = $personas->listar_provincias(); ?>
<?php $paises = $personas->listar_paises(); ?>
<div class="box-personas-guardar">
  <h3 class="titulo">Agregar Persona<hr></h3>
  <form method="post">
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Persona:</h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">
          <img class="img-responsive" src=""  >
        </div>
        <div class="col-md-9">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b>
              		<input type="text" name="nombres" id="nombres" value=""> 
              <b>Apellidos: </b> 
              		<input type="text" name="apellidos" id="apellidos" value="">
            </li>
            <li class="list-group-item">
              <b>Estado Civil: </b>
              	<input type="radio" name="id_estado_civil" value="1" checked >Soltero(a)
              	<input type="radio" name="id_estado_civil" value="2" >Casado(a)
              	<input type="radio" name="id_estado_civil" value="3" >Viudo(a)
              	<input type="radio" name="id_estado_civil" value="4" >Divorciado(a)
              	<input type="radio" name="id_estado_civil" value="5" >Union Libre
            </li>
            <li class="list-group-item">
              <b>Sexo:</b>
              <input type="radio" name="id_sexo" value="1" checked>Masculino
              <input type="radio" name="id_sexo" value="2" >Femenino
              		
            </li>
            <li class="list-group-item">
              
             <b> Clasificacion:</b>
                    <input type="radio" name="id_clasificacion" value="1" checked>Dama
                    <input type="radio" name="id_clasificacion" value="2" >Caballero
                    <input type="radio" name="id_clasificacion" value="3" >Joven
                    <input type="radio" name="id_clasificacion" value="4" >Juvenil
                    <input type="radio" name="id_clasificacion" value="5" >Nino
           
            </li>
            <li class="list-group-item">
              <b>Apodo: </b>
              	<input type="text" name="apodo" id="apodo" value="">
              <b>Telefono: </b>
              	<input type="text" name="telefono" id="telefono" value="">
            </li>
            <li class="list-group-item">
              <b>Fecha Nacimiento: </b>
              	<input type="date" name="fecha_nacimiento" id="fecha_nacimiento" value="">
            </li>
            <li class="list-group-item">
              <b>Tipo Documento: </b>
              		<input type="radio" name="id_tipo_documento" value="1"  >Cedula
              		<input type="radio" name="id_tipo_documento" value="2"  >Pasaporte
              		<input type="radio" name="id_tipo_documento" value="3" checked>Ninguno
              <label ><b> &nbsp;&nbsp;&nbsp;&nbsp;Numero Documento:</label> </b>
              <input size="20"  maxlength="15" type="text" name="nro_documento_identidad" id="nro_documento_identidad" value=""> 
             
            </li> 
            <li class="list-group-item">
              <b>Direccion: </b>
              	<input type="text" size="60" maxlength="100" name="direccion" value="">
            </li> 
            <li class="list-group-item">
              <label><b>Pais: </b></label>
	              <select name="id_pais">
	              	<?php while ($row = mysqli_fetch_array($paises)) { ?>
	              		<option value="<?php echo $row['id_pais'];?>" <?php if($row['id_pais'] == $datos['id_pais']){echo 'selected';} ?> > 
	              				<?php echo $row['pais'];?></option>
	              	<?php } ?>
	              </select>   
	           <label><b>&nbsp;&nbsp;&nbsp;&nbsp;Provincia: </b></label>
	              <select name="id_provincia">
	              	<?php while ($row = mysqli_fetch_array($provincias)) { ?>
	              		<option value="<?php echo $row['id_provincia'];?>" <?php if($row['id_provincia'] == $datos['id_provincia']){echo 'selected';} ?> > 
	              				<?php echo $row['provincia'];?></option>
	              	<?php } ?>
	              </select>
            </li> 
            <div class="form-group" style="text-align: center;">
            	<input type="hidden" name="imagen" value="">
				<button class="btn btn-success" type="submit">Crear</button>
				<button class="btn btn-warning" type="reset">Limpiar</button>			
        <button class="btn btn-critical" > <a href="<?php echo URL;?>personas">REGRESAR</a></button>				
			</div>
          </ul>
        </div>

      </div>
    </div>
  </div>
  </form>
</div>