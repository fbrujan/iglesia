$(document).ready(function(){
			/*$("#div_id_servicio").show();
			$("#div_id_distrito").hide();
			$("#div_id_circuito").hide();
			$("#div_id_iglesia").hide()
			$("#div_funcion_ministerial").hide()
			$("#div_trabaja_comite_temporero").hide()
			$("#div_es_exonerado").hide()
			$("#div_id_estado").hide();;
			$("#div_nombre").show();	
			$("#div_fch_nacimiento").hide();	
			$("#div_fch_conversion").hide();	
			$("#div_fch_bautismo").hide();	
			$("#div_id_sexo").hide();	
			$("#div_id_estado_civil").hide();	
			$("#div_id_sociedad").hide();	
			$("#div_id_tipo_documento").hide();	
			$("#div_telefono").hide();	
			$("#div_apodo").hide();	
			$("#div_id_pais").hide();	
			$("#div_id_provincia").hide();	
			$("#div_direccion").hide();	
			$("#div_id_rango_ministerial").hide();	
			$("#div_id_comite_temporero").hide();
			$("#div_id_cargo").hide();
			$("#div_imagen").hide();
*/
			$("#nombre").autocomplete({
				source: "../../../Scripts/busca_miembro.php",
				minlength: 1
			});

			$("#nombre").focusout(function(){
				if ( $("#nombre").val().split('|').length >1){
					$.ajax({
						url:'../../../Scripts/miembro.php',
						type:'POST',
						dataType:'json',
						data:{id_persona:$('#nombre').val().split('|')[0]}
					}).done(function(respuesta){

						
						$("#div_id_servicio").show();
						$("#div_id_distrito").show();
						$("#div_id_circuito").show();
						$("#div_id_iglesia").show()
						$("#div_id_estado").show();;
						$("#div_nombre").show();	
						$("#div_funcion_ministerial").show()
						$("#div_trabaja_comite_temporero").show()
						$("#div_fch_nacimiento").hide();	
						$("#div_fch_conversion").hide();	
						$("#div_fch_bautismo").hide();	
						$("#div_id_sexo").hide();	
						$("#div_id_estado_civil").hide();	
						$("#div_id_sociedad").hide();	
						$("#div_id_tipo_documento").hide();	
						$("#div_telefono").hide();	
						$("#div_apodo").hide();	
						$("#div_id_pais").hide();	
						$("#div_id_provincia").hide();	
						$("#div_direccion").hide();	
						$("#div_id_rango_ministerial").hide();	
						$("#div_id_comite_temporero").hide();
						$("#div_id_cargo").hide();
						$("#div_imagen").hide();
// alert('llegue');
						/*if (respuesta.nombres == ''){
							// $("#nombre").val(respuesta.nombres);
							$("#apellidos").val('');
							$("#telefono").val('');
							$("#apodo").val('');
							$("#fch_nacimiento").val('');
							$("#direccion").val('');
							$("#id_sexo").val('');
							$("#fch_nacimiento").val('');
							$("#nro_documento").val('');
							$("#id_persona").val('');
							$("#test1").hide();	
						} else {*/
							
							$("#nombre").val(respuesta.nombres);
							$("#apellidos").val(respuesta.apellidos);
							$("#telefono").val(respuesta.telefono);
							$("#apodo").val(respuesta.apodo);
							$("#fch_nacimiento").val(respuesta.fchNacimiento);
							$("#direccion").val(respuesta.direccion);
							//$("#id_sexo"+respuesta.id_sexo).attr('checked', true);
							$("#fch_nacimiento").val(respuesta.fchNacimiento);
							$("#nro_documento").val(respuesta.nro_documento);
							$("#id_persona").val(respuesta.id_persona);	
							$("#div_id_servicio").show();
							$("#test2").show();	
							$("#test3").show();	
							$("#test4").show();		
							$("#test5").show();		
							$("#test6").show();		
							$("#test7").show();		
							$("#test8").show();		
							$("#test9").show();		
							$("#test10").show();		
							$("#test11").show();		
							$("#test12").show();		
							$("#test13").show();		
							$("#test14").show();			
						//}									
					});
				}else{

						$("#div_id_servicio").show();
						$("#div_id_distrito").show();
						$("#div_id_circuito").show();
						$("#div_id_iglesia").show()
						$("#div_id_estado").show();;
						$("#div_nombre").show();	
						$("#div_funcion_ministerial").show()
						$("#div_trabaja_comite_temporero").show()
						$("#div_fch_nacimiento").show();	
						$("#div_fch_conversion").show();	
						$("#div_fch_bautismo").show();	
						$("#div_id_sexo").show();	
						$("#div_id_estado_civil").show();	
						$("#div_id_sociedad").show();	
						$("#div_id_tipo_documento").show();	
						$("#div_telefono").show();	
						$("#div_apodo").show();	
						$("#div_id_pais").show();	
						$("#div_id_provincia").show();	
						$("#div_direccion").show();	
						$("#div_id_rango_ministerial").show();	
						$("#div_id_comite_temporero").show();
						$("#div_id_cargo").show();
						$("#div_imagen").show();
						$("#div_es_exonerado").show();

						$("#apellidos").val('');
						$("#telefono").val('');
						$("#apodo").val('');
						$("#fch_nacimiento").val('');
						$("#direccion").val('');
						$("#id_sexo").val('');
						$("#fch_nacimiento").val('');
						$("#nro_documento").val('');
						$("#id_persona").val('');
						$(".id_sexo").attr('checked', false);

				};
			});
		});