
<div class="box-principal">
<h3 class="titulo">Detalle Persona<hr></h3>
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Persona: <?php echo $datos['persona'] ; ?></h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen']; ?>">
        </div>
        <div class="col-md-9">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b><?php echo $datos['nombres']; ?>
            </li>
            <li class="list-group-item">
              <b>Apellidos: </b><?php echo $datos['apellidos']; ?>
            </li>
            <li class="list-group-item">
              <b>Estado Civil: </b><?php echo $datos['estado_civil']; ?>
            </li>
            <li class="list-group-item">
              <b>Sexo: </b><?php if($datos['id_sexo'] == 1){echo 'Masculino';}else{echo 'Femenino';} ?>
            </li>
            <li class="list-group-item">
              <b>Apodo: </b><?php echo $datos['apodo']; ?>
            </li>
            <li class="list-group-item">
              <b>Telefono: </b><?php echo $datos['telefono']; ?>
            </li>
            <li class="list-group-item">
              <b>Fecha Nacimiento: </b><?php echo $datos['fecha_nacimiento']; ?>
            </li>
            <li class="list-group-item">
              <b>Tipo Documento: </b><?php echo $datos['tipo_documento']; ?>
            </li>
            <li class="list-group-item">
              <b>Numero Documento: </b><?php echo $datos['nro_documento_identidad']; ?>
            </li> 
            <li class="list-group-item">
              <b>Direccion: </b><?php echo $datos['direccion'] . ', Provincia ' . $datos['provincia']. ', ' .$datos['pais']; ?>            
            </li> 
            <li class="list-group-item">
              <b>Creado por: </b><?php echo $datos['usuario_creacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              <b>Fecha Creacion: </b><?php echo $datos['fecha_creacion']; ?>
            </li>
            <li class="list-group-item">
              <b>Modificado por: </b><?php echo $datos['usuario_modificacion'] . '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?>
              <b>Fecha Ultima Modificacion: </b><?php echo $datos['ultima_modificacion']; ?>
              </li>
            <li class="list-group-item">
            	<a href="<?php echo URL;?>personas" class=" btn btn-success" >Regresar</a>
          		<a href="<?php echo URL;?>personas/editar/<?php echo $datos['id_persona']; ?>"  class=" btn btn-warning">Editar</a>
            </li>
          </ul>
        </div>

      </div>
    </div>
  </div>
</div>