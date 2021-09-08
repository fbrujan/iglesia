
<div class="box-principal">
<h3 class="titulo">Detalle Iglesia<hr></h3>
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Iglesia: <?php echo $datos['iglesia'] ; ?></h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">

          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen_iglesia']; ?>">
           Fundador:
           <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen_fundador']; ?>">
           Pastor actual:
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen_pastor_actual']; ?>">
        </div>
        <div class="col-md-9">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b><?php echo $datos['iglesia']; ?>
            </li>
            <li class="list-group-item">
              <b>Direccion: </b><?php echo $datos['direccion'] . ', Provincia ' . $datos['provincia']. ', ' .$datos['pais']; ?>            
            </li>
            <li class="list-group-item">
              <b>Distrito: </b><?php echo $datos['distrito']; ?>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Circuito: </b><?php echo $datos['circuito']; ?>
            </li>
           <li class="list-group-item">
              <b>Telefono: </b><?php echo $datos['telefono']; ?>
            </li>
            <li class="list-group-item">
              <b>Fundador: </b><?php echo $datos['fundador']; ?>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Fecha Fundada: </b><?php echo $datos['fecha_fundada']; ?>
            </li>
           <li class="list-group-item">
              <b>Creado por: </b><?php echo $datos['usuario_creacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              <b>Fecha Creacion: </b><?php echo $datos['fecha_creacion']; ?>
            </li>
            <li class="list-group-item">
              <b>Modificado por: </b><?php echo $datos['usuario_modificacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              <b>Ultima Modificacion: </b><?php echo $datos['ultima_actualizacion']; ?>
              </li>
            <li class="list-group-item">
            	<a href="<?php echo URL;?>iglesias" class=" btn btn-success" >Regresar</a>
          		<a href="<?php echo URL;?>iglesias/editar/<?php echo $datos['id_iglesia']; ?>"  class=" btn btn-warning">Editar</a>
            </li>
          </ul>
        </div>

      </div>
    </div>
  </div>
</div>