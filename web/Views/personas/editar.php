<?php $provincias = $personas->listar_provincias(); ?>
<?php $paises = $personas->listar_paises(); ?>
<div class="box-personas-guardar">
  <h3 class="titulo">Edicion Personas<hr></h3>
  <form method="post">
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Persona: <?php echo $datos['persona'] ; ?></h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen']; ?>"  >
        </div>
        <div class="col-md-9">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b>
              		<input type="text" name="nombres" id="nombres" value="<?php echo $datos['nombres']; ?>"> 
              <b>Apellidos: </b> 
              		<input type="text" name="apellidos" id="apellidos" value="<?php echo $datos['apellidos']; ?>">
            </li>
            <li class="list-group-item">
              <b>Estado Civil: </b>
              	<input type="radio" name="id_estado_civil" value="1" <?php if($datos['id_estado_civil']==1) { echo 'checked';}?> >Soltero(a)
              	<input type="radio" name="id_estado_civil" value="2" <?php if($datos['id_estado_civil']==2) { echo 'checked';}?> >Casado(a)
              	<input type="radio" name="id_estado_civil" value="3" <?php if($datos['id_estado_civil']==3) { echo 'checked';}?> >Viudo(a)
              	<input type="radio" name="id_estado_civil" value="4" <?php if($datos['id_estado_civil']==4) { echo 'checked';}?> >Divorciado(a)
              	<input type="radio" name="id_estado_civil" value="5" <?php if($datos['id_estado_civil']==5) { echo 'checked';}?> >Union Libre
            </li>
            <li class="list-group-item">
              <b>Sexo:</b>
              <input type="radio" name="id_sexo" value="1" <?php if($datos['id_sexo']==1) { echo 'checked';}?> >Masculino
              <input type="radio" name="id_sexo" value="2" <?php if($datos['id_sexo']==2) { echo 'checked';}?> >Femenino
              		
            </li>
             <li class="list-group-item">
              <b>Clasificacion:</b>
              <input type="radio" name="id_clasificacion" value="1" <?php if($datos['id_clasificacion']==1) { echo 'checked';}?> >Dama
              <input type="radio" name="id_clasificacion" value="2" <?php if($datos['id_clasificacion']==2) { echo 'checked';}?> >Caballero
              <input type="radio" name="id_clasificacion" value="3" <?php if($datos['id_clasificacion']==3) { echo 'checked';}?> >Joven
              <input type="radio" name="id_clasificacion" value="4" <?php if($datos['id_clasificacion']==4) { echo 'checked';}?> >Juvenil
              <input type="radio" name="id_clasificacion" value="5" <?php if($datos['id_clasificacion']==5) { echo 'checked';}?> >Ni&ntilde;o
                  
            </li>
            <li class="list-group-item">
              <b>Apodo: </b>
              	<input type="text" name="apodo" id="apodo" value="<?php echo $datos['apodo']; ?>">
              <b>Telefono: </b>
              	<input type="text" name="telefono" id="telefono" value="<?php echo $datos['telefono']; ?>">
            </li>
            <li class="list-group-item">
              <b>Fecha Nacimiento: </b>
              	<input type="date" name="fecha_nacimiento" id="fecha_nacimiento" value="<?php echo $datos['fecha_nacimiento']; ?>">
            </li>
            <li class="list-group-item">
              <b>Tipo Documento: </b>
              		<input type="radio" name="id_tipo_documento" value="1" <?php if($datos['id_tipo_documento']==1) { echo 'checked';}?> >Cedula
              		<input type="radio" name="id_tipo_documento" value="2" <?php if($datos['id_tipo_documento']==2) { echo 'checked';}?> >Pasaporte
              		<input type="radio" name="id_tipo_documento" value="3" <?php if($datos['id_tipo_documento']==3) { echo 'checked';}?> >Otro
              <?php if ($datos['id_tipo_documento']<3) { ?>
              	 <label ><b> &nbsp;&nbsp;&nbsp;&nbsp;Numero Documento:</label> </b>
              	 <input size="20"  maxlength="15" type="text" name="nro_documento_identidad" id="nro_documento_identidad" value="<?php echo $datos['nro_documento_identidad']; ?>"> 
 			  <?php } else { ?>
 			  	<label hidden><b> &nbsp;&nbsp;&nbsp;&nbsp;Numero Documento:</b></label> 
 			  <?php } ?>		
             
            </li> 
            <li class="list-group-item">
              <b>Direccion: </b>
              	<input type="text" size="60" maxlength="100" name="direccion" value="<?php echo $datos['direccion'] ; ?>">
            </li> 
            <li class="list-group-item">
              <label><b>Provincia: </b></label>
	              <select name="id_provincia">
	              	<?php while ($row = mysqli_fetch_array($provincias)) { ?>
	              		<option value="<?php echo $row['id_provincia'];?>" <?php if($row['id_provincia'] == $datos['id_provincia']){echo 'selected';} ?> > 
	              				<?php echo $row['provincia'];?></option>
	              	<?php } ?>
	              </select>
	           <label><b>&nbsp;&nbsp;&nbsp;&nbsp;Pais: </b></label>
	              <select name="id_pais">
	              	<?php while ($row = mysqli_fetch_array($paises)) { ?>
	              		<option value="<?php echo $row['id_pais'];?>" <?php if($row['id_pais'] == $datos['id_pais']){echo 'selected';} ?> > 
	              				<?php echo $row['pais'];?></option>
	              	<?php } ?>
	              </select>                
            </li> 
            <li class="list-group-item">
              <b>Registro creado por: </b><?php echo $datos['usuario_creacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              <b>Fecha Creacion: </b><?php echo $datos['fecha_creacion']; ?>
            </li>
            <li class="list-group-item">
              <b>Fecha Ultima Modificacion: </b><?php echo $datos['ultima_modificacion']; ?>
              <b>&nbsp;&nbsp;&nbsp;&nbsp;Por: </b><?php echo $datos['usuario_modificacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              </li>
            <div class="form-group" style="text-align: center;">
            	<input type="hidden" name="id_persona" value="<?php echo $datos['id_persona'];?>">
              <input type="hidden" name="imagen" value="<?php echo $datos['imagen']; ?>">
				<button class="btn btn-success" type="submit">Editar</button>
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