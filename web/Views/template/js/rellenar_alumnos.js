$(document).ready(function(){
			$("#matricula").autocomplete({
				source: "buscaralumno.php",
				minlength: 3
			});

			$("#matricula").focusout(function(){
				if ( $("#matricula").val().split('|').length >1){
				$.ajax({
					url:'alumno.php',
					type:'POST',
					dataType:'json',
					//data:{matricula:$('#matricula').val().substr(0,13)}
					data:{matricula:$('#matricula').val().split('|')[0]}
				}).done(function(respuesta){
					$("#nombre").val(respuesta.nombre);
					$("#paterno").val(respuesta.paterno);
					$("#materno").val(respuesta.materno);
					$("#mat").val(respuesta.matricula);	
					$("#matricula").val(respuesta.matricula.toUpperCase());	
				});
				};
			});
		});