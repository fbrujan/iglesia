<div class="box-principal">
<h3 class="titulo">Servicio: <?php echo $datos['servicio']; ?><hr></h3>
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">Detalles del Servicio: </h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-1">
          
        </div>
        <div class="col-md-10">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b><?php echo $datos['servicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Fecha: </b><?php echo $datos['fecha_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Hora: </b><?php echo $datos['hora_inicio']; ?>
            </li>          
            <li class="list-group-item">
              <b>Tipo Servicio: </b><?php echo $datos['tipo_servicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Departamento que Dirige: </b><?php echo $datos['departamento']; ?>
            </li>
            <li class="list-group-item">
              <b>Lider a Cargo: </b><?php echo $datos['lider']; ?>
            </li>
            <li class="list-group-item">
              <b>Descripcion o Detalles o Comentarios: </b><?php echo $datos['descripcion']; ?>
            </li>
            <li class="list-group-item">
              <b>Costo Participacion: </b><?php echo "RD$ " . $datos['costo']; ?>
            </li>
            <li class="list-group-item">
              <b>Asistencia Miembros: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Asistencia Amigos: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Asistencia Lideres: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Asistencia Total: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Exhonerados: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Pagaron Entrada: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Recaudado por Asistencia: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Ofrenda Colectada: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Total Recaudado: </b><?php echo $datos['hora_inicio']; ?>
            </li>
            <li class="list-group-item">
              <b>Registrado Por: </b><?php echo $datos['hora_inicio']; ?>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<?php //-- estos datos deben traerse de una vista. Crear vista para este fin ?>