<?php $paises=$distritos->listar_paises();?>
<div class="box-provincias-agregar">
	<h3>Distritos</h3>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Agregar Distritos</h3>
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
							<th style="text-transform: uppercase;">Distrito:</th>
							<td><input type="text" name="distrito" id="distrito" style="background-color: #ffffcc;"></td>
						</tr>
					</tbody>
				</table>
				<button class="btn btn-success" type="submit">Crear</button>
				<button class="btn btn-warning" type="reset">Limpiar</button>
			</form>
		</div>
	</div>
</div>





