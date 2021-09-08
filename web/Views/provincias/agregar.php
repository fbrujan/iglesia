<?php $paises=$provincias->listar_paises();?>
<div class="box-provincias-agregar">
	<h3>Provincias</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Agregar Provincias</h3>
		</div>
		<div class="panel-body" >
			<form method="post">
				<table class="table table-hover table-condensed">
					<tbody>					
						<tr>
							<th style="text-transform: uppercase;">Seleccione el Pais:</th>
							<td>
								<select name="id_pais" id="id_pais">
									<?php while ($row = mysqli_fetch_array($paises)) { ?>
									<option value="<?php echo $row['id_pais'];?>"><?php echo $row['pais'];?>
									</option><?php }?>			
								</select>
							</td>
						</tr>
						<tr>
							<th style="text-transform: uppercase;">Provincia:</th>
							<td><input type="text" name="provincia" id="provincia" style="background-color: #ffffcc;"></td>
						</tr>
						<tr>	
							<th style="text-transform: uppercase;">Ciudad Principal:</th>
							<td><input type="text" name="ciudad_cabecera" id="ciudad_cabecera" style="background-color: #ffffcc;"></td>
						</tr>						
					</tbody>
				</table>
				<button class="btn btn-success" type="submit">Crear</button>
				<button class="btn btn-warning" type="reset">Limpiar</button>
				<button class="btn btn-critical" > <a href="<?php echo URL;?>provincias">REGRESAR</a></button>
			</form>
		</div>
	</div>
</div>





