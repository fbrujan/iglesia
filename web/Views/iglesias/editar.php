<?php $distritos = $iglesias->listar_distritos(); ?>
<?php $circuitos = $iglesias->listar_circuitos(); ?>
<?php $paises = $iglesias->listar_paises(); ?>
<?php $provincias = $iglesias->listar_provincias(); ?>

<div class="box-iglesias-guardar">
  <h3 class="titulo">Edicion de Iglesia<hr></h3>
  <form method="post">
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Iglesia: <?php echo $datos['iglesia'] ; ?></h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen_iglesia']; ?>"  >
          Fundador:
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen_fundador']; ?>"  >
          Pastor Actual:
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen_pastor_actual']; ?>"  >
        </div>
        <div class="col-md-9">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b>
              		<input type="text" size="30" name="iglesia" id="iglesia" value="<?php echo $datos['iglesia']; ?>"> 
            </li>
            <li class="list-group-item">
              <label><b>Pais: </b></label>
                <select name="id_pais">
                  <?php while ($row = mysqli_fetch_array($paises)) { ?>
                    <option value="<?php echo $row['id_pais'];?>" <?php if($row['id_pais'] == $datos['id_pais']){echo 'selected';} ?> > 
                        <?php echo $row['pais'];?></option>
                  <?php } ?>
                </select> 
              <label><b>Distrito: </b></label>
                <select name="id_distrito">
                  <?php while ($row = mysqli_fetch_array($distritos)) { ?>
                    <option value="<?php echo $row['id_distrito'];?>" <?php if($row['id_distrito'] == $datos['id_distrito']){echo 'selected';} ?> > 
                        <?php echo $row['distrito'];?></option>
                  <?php } ?>
                </select>    
              <label><b>&nbsp;&nbsp;&nbsp;&nbsp;Circuito: </b></label>
                <select name="id_circuito">
                  <?php while ($row = mysqli_fetch_array($circuitos)) { ?>
                    <option value="<?php echo $row['id_circuito'];?>" <?php if($row['id_circuito'] == $datos['id_circuito']){echo 'selected';} ?> > 
                        <?php echo $row['circuito'];?></option>
                  <?php } ?>
                </select>
                         
            </li> 
             <li class="list-group-item">
              <b>Direccion: </b>
                <input type="text" size="40" maxlength="100" name="direccion" value="<?php echo $datos['direccion'] ; ?>">
                <label><b>Provincia: </b></label>
                <select name="id_provincia">
                  <?php while ($row = mysqli_fetch_array($provincias)) { ?>
                    <option value="<?php echo $row['id_provincia'];?>" <?php if($row['id_provincia'] == $datos['id_provincia']){echo 'selected';} ?> > 
                        <?php echo $row['provincia'];?></option>
                  <?php } ?>
                </select>    
            <li class="list-group-item">
              <b>Telefono: </b>
              	<input type="text" name="telefono" id="telefono" value="<?php echo $datos['telefono']; ?>">
            </li>
            <li class="list-group-item">
              <b>Fundador: </b>
              	<input type="text" name="fundador" id="fundador" value="<?php echo $datos['fundador']; ?>">
                <b>Fecha Fundacion: </b>
                <input type="date" name="fecha_fundada" id="fecha_fundada" value="<?php echo $datos['fecha_fundada']; ?>">
            </li>
            <li class="list-group-item">
              <b>Registro creado por: </b><?php echo $datos['usuario_creacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              <b>Fecha Creacion: </b><?php echo $datos['fecha_creacion']; ?>
            </li>
            <li class="list-group-item">
              <b>Ultima Modificacion: </b><?php echo $datos['ultima_actualizacion']; ?>
              <b>&nbsp;&nbsp;&nbsp;&nbsp;Por: </b><?php echo $datos['usuario_modificacion'] ; ?>
              </li>
            <div class="form-group" style="text-align: center;">
            	<input type="hidden" name="id_iglesia" value="<?php echo $datos['id_iglesia'];?>">
              <input type="hidden" name="imagen_iglesia" value="<?php echo $datos['imagen_iglesia']; ?>">
              <input type="hidden" name="imagen_fundador" value="<?php echo $datos['imagen_fundador']; ?>">
              <input type="hidden" name="imagen_pastor_actual" value="<?php echo $datos['imagen_pastor_actual']; ?>">
              <a href="<?php echo URL;?>iglesias" class=" btn btn-success" >Regresar</a>
				<button class="btn btn-success" type="submit">Editar</button>
				<button class="btn btn-warning" type="reset">Limpiar</button>
							
			</div>
          </ul>
        </div>

      </div>
    </div>
  </div>
  </form>
</div>