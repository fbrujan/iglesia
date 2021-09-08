<?php $distritos=$circuitos->listar_distritos();?>
<?php $provincias=$circuitos->listar_provincias();?>
<div class="box-circuitos-agregar">
	<h3>Circuitos</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Agregar Circuitos</h3>
		</div>
		<div class="panel-body" >
			<form method="post">
				<table class="table table-hover table-condensed">
					<tbody>					
						<tr>
							<th style="text-transform: uppercase;">Seleccione el Distrito:</th>
							<td style="text-align: left;">
								<select name="id_distrito" id="id_distrito">
									<?php while ($row = mysqli_fetch_array($distritos)) { ?>
									<option value="<?php echo $row['id_distrito'];?>"><?php echo $row['distrito'];?>
									</option><?php }?>			
								</select>
							</td>
						</tr>
						<tr>
							<th style="text-transform: uppercase;">Seleccione una Provincia:</th>
							<td style="text-align: left;">
								<select name="id_provincia" id="id_provincia">
									<?php while ($row = mysqli_fetch_array($provincias)) { ?>
									<option value="<?php echo $row['id_provincia'];?>"><?php echo $row['pais']. ' || ' .$row['provincia'];?>
									</option><?php }?>			
								</select>
							</td>
						</tr>
						<tr>
							<th style="text-transform: uppercase;">Circuito:</th>
							<td style="text-align: left;"><input type="text" name="circuito" id="circuito" style="background-color: #ffffcc;"></td>
						</tr>
											
					</tbody>
				</table>
				<button class="btn btn-success" type="submit">Crear</button>
				<button class="btn btn-warning" type="reset">Limpiar</button>
				<button class="btn btn-critical" > <a href="<?php echo URL;?>circuitos">REGRESAR</a></button>
			</form>
		</div>
	</div>
</div>







