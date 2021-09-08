<?php $cargos = $miembros->listarCargos($datos['id_miembro']); ?>
<div class="box-principal">
<h3 class="titulo">Miembro: <?php echo $datos['nombres']; ?><hr></h3>
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Perfil del Miembro: <?php echo $datos['nombres'] . " " . $datos['apellidos']; ?><b></b></h3>
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
              <b>Estado: </b><?php echo $datos['estado']; ?>
            </li>
            <li class="list-group-item">
              <b>Sexo: </b><?php echo $datos['sexo']; ?>
            </li>

            <li class="list-group-item">
              <b>Fecha Nacimiento: </b><?php echo $datos['fecha_nacimiento']; ?>
            </li>
            <li class="list-group-item">
              <b>Fecha Conversion: </b><?php echo $datos['fecha_conversion']; ?>
            </li>
            <li class="list-group-item">
              <b>Fecha Bautismo: </b><?php echo $datos['fecha_bautismo']; ?>
            </li>
            <li class="list-group-item">
              <b>Tipo Documento: </b><?php echo $datos['tipo_documento']; ?>
            </li>
            <li class="list-group-item">
              <b>Numero Documento: </b><?php echo $datos['nro_documento_identidad']; ?>
            </li> 
            <li class="list-group-item">
              <b>Sociedad que Pertenece: </b><?php echo $datos['sociedad']; ?>            
            </li> 
            <li class="list-group-item">
              <b>Fecha de Creacion: </b><?php echo $datos['fecha_creacion']; ?>
            </li>
            <li class="list-group-item">
              <b>Fecha Ultima Modificacion: </b><?php echo $datos['fecha_creacion']; ?>
            </li>
            <li class="list-group-item">
              <b> Cargos que ha Ocupado:</b>
                <?php while($row = mysqli_fetch_array($cargos)){ ?>
                <a href="<?php echo URL; ?>lideres/ver/<?php echo $row['id_lider'];?>"> 
                  |<?php echo $row['cargo'] . " de " . $row['departamento'] . " " . $row['periodo'] ;?>|</a>                
                <?php }  ?>

            </li>
            <li class="list-group-item">
              <b>Registrado Por: </b><?php echo $datos['nombres']; ?>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>