<?php $cargosActuales = $lideres->cargosActualesMiembro($datos['id_miembro']); ?>
<?php $cargosOcupados = $lideres->cargosMiembro($datos['id_miembro']); ?>
<?php echo $datos['id_miembro'];?>
<div class="box-principal">
<h3 class="titulo"><?php echo $datos['cargo'] . ' de ' . $datos['departamento']; ?><hr></h3>
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title"><?php echo $datos['cargo'] . ' de ' . $datos['departamento'] . ' ' . $datos['periodo']; ?><b></b></h3>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">
          <img class="img-responsive" src="<?php echo URL;?>Views/template/imagenes/avatars/<?php echo $datos['imagen']; ?>">
        </div>
        <div class="col-md-9">
          <ul class="list-group">
            <li class="list-group-item">
              <b>Nombre: </b><?php echo $datos['nombre']; ?>
            </li>
            <li class="list-group-item">
              <b>Apellidos: </b><?php echo $datos['apellidos']; ?>
            </li>
            <li class="list-group-item">
              <b>Sexo: </b><?php echo $datos['sexo']; ?>
            </li>

            <li class="list-group-item">
              <b>Fecha Conversion: </b><?php echo $datos['fch_conversion']; ?>
            </li>
            <li class="list-group-item">
              <b>Sociedad que Pertenece: </b><?php echo $datos['sociedad']; ?>
            </li>
            <li class="list-group-item">
              <b>Cargos que ocupa Actualmente: </b>
                    <?php while($row = mysqli_fetch_array($cargosActuales)){ ?>
                        <a href="<?php echo URL; ?>lideres/ver/<?php echo $row['id'];?>"> 
                        |<?php echo $row['cargo'] . " de " . $row['departamento'] . " " . $row['periodo'] ;?>|</a>                
                    <?php }  ?>
            </li>
            <li class="list-group-item">
              <b>Cargos que ha ocupado: </b>
                    <?php while($row = mysqli_fetch_array($cargosOcupados)){ ?>
                        <a href="<?php echo URL; ?>lideres/ver/<?php echo $row['id'];?>"> 
                        |<?php echo $row['cargo'] . " de " . $row['departamento'] . " " . $row['periodo'] ;?>|</a>                
                    <?php }  ?>
            </li>
            
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>