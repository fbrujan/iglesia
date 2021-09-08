<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Miembros 				as Miembro;
	use Models\M_Servicios 				as Servicio;
	use Models\M_Registros 				as Registro;
	use Models\M_Personas 				as Persona;
	use Models\M_Sociedades 			as Sociedad;
	use Models\M_ComiteTemporero 		as Comite;
	use Models\M_Cargos 				as Cargo;
	use Models\M_Estados 				as Estado;
	use Models\M_Sexo 					as Sexo;
	use Models\M_Paises 				as Pais;
	use Models\M_Distritos 				as Distrito;
	use Models\M_Circuitos				as Circuito;
	use Models\M_Iglesias				as Iglesia;
	use Models\M_Provincias 			as Provincia;
	use Models\M_Tipo_Documento			as Tipo_Documento;
	use Models\M_Lideres				as CargosOcupados;
	use Models\M_RangoMinisterial		as RangoMinisterial;
	use  Models\M_Asistencia					as Asistencia;

	class registros{
		// Atributos o Propiedades
		private $registro;
		private $servicio;
		private $miembro;
		private $comite;
		private $cargo;
		private $persona;
		private $sociedad;
		private $estado;
		private $sexo;
		private $tipo_documento;
		private $cargosOcupados;
		private $distrito;
		private $circuito;
		private $iglesia;
		private $rango_ministerial;
		private $pais;
		private $provincia;
		private $asistencias;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->registro					= new Registro;
			$this->servicio					= new Servicio;
			$this->comite					= new Comite;
			$this->cargo					= new Cargo;
			$this->miembro 					= new Miembro;
			$this->persona 					= new Persona;
			$this->sociedad 				= new Sociedad;
			$this->estado 					= new Estado;
			$this->sexo 					= new Sexo;
			$this->pais 					= new Pais;
			$this->provincia 				= new Provincia;
			$this->tipo_documento 			= new Tipo_Documento;
			$this->cargosOcupados 			= new CargosOcupados;
			$this->distrito 				= new Distrito;
			$this->circuito 				= new Circuito;
			$this->iglesia 					= new Iglesia;
			$this->rango_ministerial 		= new RangoMinisterial;
			$this->asistencias					= new Asistencia;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla miembros";
			$datos = $this->registro->lists();
			return $datos;
		}

		public function ver($id){
			$this->registro->set("id_registro", $id);
			$datos = $this->registro->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->registro->set("id_registro", $id);
			$this->registro->delete();
			header("Location: " . URL . "registros");
		}

		public function editar($id){
			if($_POST){
				$permitidos = array("image/jpeg", "image/png", "image/gif", "image/jpg");
				$limite = 700;
				if(in_array($_FILES['imagen']['type'],$permitidos) && $_FILES['imagen']['size']<=$limite * 1024){
					$img_nombre = $_FILES['imagen']['name'];
					$ruta = "Views" . DS . "template" . DS . "imagenes" . DS . "avatars" . DS . $img_nombre;
					move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);
				}else{$img_nombre = $_POST['imagen'];}


				$this->miembro->set("id_miembro", $id);
				$this->miembro->set("nombre", $_POST['nombre']);
				$this->miembro->set("apellidos", $_POST['apellidos']);
				$this->miembro->set("fecha_nacimiento", $_POST['fch_nacimiento']);
				$this->miembro->set("fecha_conversion", $_POST['fch_conversion']);
				$this->miembro->set("fecha_bautismo", $_POST['fch_bautismo']);
				$this->miembro->set("id_sociedad", $_POST['id_sociedad']);
				$this->miembro->set("id_persona", $_POST['id_persona']);
				$this->miembro->set("id_estado_condicion", $_POST['id_estado']);
				$this->miembro->set("id_rango_ministerial", $_POST['id_rango_ministerial']);
				$this->miembro->set("id_iglesia", $_POST['id_iglesia']);
				$this->miembro->set("imagen", $_POST['imagen']);
				$this->miembro->set("id_sexo", $_POST['id_sexo']);
				$this->miembro->set("fecha_inicio", $_POST['fch_inicio']);
				$this->miembro->set("fecha_fin", $_POST['fch_fin']);
				$this->miembro->set("fecha_creacion", $_POST['fch_creacion']);
				$this->miembro->set("id_tipo_documento", $_POST['id_tipo_documento']);
				$this->miembro->set("nro_documento", $_POST['nro_documento']);
				$this->miembro->edit();
				//header('Location: ' . URL . "miembros");
			}else{
				$this->miembro->set("id_miembro", $id);
				$datos = $this->miembro->view();
				return $datos;
			}
		}

	public function agregar(){
			if($_POST){
								$permitidos = array("image/jpeg", "image/png", "image/gif", "image/jpg");
								$limite = 700;
								
								if(in_array($_FILES['imagen']['type'],$permitidos) && $_FILES['imagen']['size']<=$limite * 1024){
											$img_nombre = $_FILES['imagen']['name'];
											$ruta = "Views" . DS . "template" . DS . "imagenes" . DS . "avatars" . DS . $img_nombre;
											move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);
								}else{
									$img_nombre = 'aaa.jpeg';
								}
							
								if (isset($_POST['es_exonerado'])) {$exonerado=1;} else { $exonerado=0; }
								if (isset($_POST['es_visita'])) {$visita=1;} else { $visita=0; }
								if (isset($_POST['es_delegado'])) {$delegado=1;$exonerado=0; $visita=0;} else { $delegado=0; }
								if (isset($_POST['es_miembro_ministerial'])) {$miembro_ministerial=1;$delegado=0;$visita=0;} else {$miembro_ministerial=0; }
								if (isset($_POST['es_pastor'])) {$pastor=1; $miembro_ministerial=1;$delegado=0;$visita=0;} else { $pastor=0; }
								if (isset($_POST['es_presbitero'])) {$presbitero=1;$pastor=1;$miembro_ministerial=1;$delegado=0;$visita=0;} else { $presbitero=0; }
								
								if (isset($_POST['trabaja_comite'])) {$trabajaComite=1;} else { $trabajaComite=0; }
								if (isset($_POST['es_miembro_iglesia'])) {$miembro_iglesia=1;} else { $miembro_iglesia=0; }
								if (isset($_POST['es_lider'])) {$lider=1;} else { $lider=0; }

								if (isset($_POST['id_rango_ministerial'])) {
									if ($_POST['id_rango_ministerial']>1) {
										$miembro_ministerial=1;$delegado=0;$visita=0;
									}									
								} 

					// Validacion de datos necesarios para hacer el registro
								if ($_POST['id_servicio']== "0") { echo "Debe Elegir un servicio";}
								elseif ($_POST['id_distrito']=="0") {echo "Debe Elegir un Distrito o la opcion 'SIN ESPECIFICAR";}
								elseif ($_POST['id_circuito']=="0") {echo "Debe Elegir un Circuito o la opcion 'SIN ESPECIFICAR"; }
								elseif ($_POST['id_iglesia']=="0") {echo "Debe Elegir una iglesia... o la opcion 'SIN ESPECIFICAR'";}					
								elseif ($_POST['id_persona']!="") {
											$this->registro->set("id_servicio", $_POST['id_servicio']);
											$this->registro->set("id_distrito", $_POST['id_distrito']);
											$this->registro->set("id_circuito", $_POST['id_circuito']);
											$this->registro->set("id_iglesia", $_POST['id_iglesia']);
											$this->registro->set("id_persona",$_POST['id_persona']);
											$this->registro->set("es_miembro_iglesia", $miembro_iglesia);
											$this->registro->set("es_lider",  $lider);
											$this->registro->set("es_miembro_ministerial", $miembro_ministerial);
											$this->registro->set("es_pastor", $pastor);
											$this->registro->set("es_presbitero",  $presbitero);
											$this->registro->set("es_delegado", $delegado);
											$this->registro->set("es_visita", $visita);
											$this->registro->set("trabaja_comite",$trabajaComite);
											$this->registro->set("es_exonerado", $exonerado);

											$datos=$this->registro->add();
											if ($datos) {
													$_POST['usuario']='fbrujan';
													date_default_timezone_set('America/Santo_Domingo');
													// Crear una asistencia para el registro recien realizado
													$this->asistencias->set("id_persona", $_POST['id_persona']);
													$this->asistencias->set("id_servicio", $_POST['id_servicio']);
													$this->asistencias->set("id_tanda", '1');
													$this->asistencias->set("fecha", date("Y-m-d"));
													$this->asistencias->set("usuario", $_POST['usuario']);
													$this->asistencias->add();

													unset($_POST['nombre']);
													unset($_POST['es_delegado']);
													unset($_POST['es_pastor']);
													unset($_POST['es_exonerado']);
													unset($_POST['apellidos']);
													unset($_POST['fch_nacimiento']);
													unset($_POST['fch_conversion']);
													unset($_POST['fch_bautismo']);
													unset($_POST['id_sexo']);
													unset($_POST['id_estado_civil']);
													unset($_POST['es_presbitero']);
													unset($_POST['trabaja_comite']);
													unset($_POST['es_miembro_ministerial']);
													unset($_POST['es_miembro_iglesia']);
													unset($_POST['id_persona']);
													unset($_POST['id_iglesia']);
													unset($_POST['id_circuito']);
													unset($_POST['id_tipo_documento']);
													unset($_POST['nro_documento']);
													unset($_POST['telefono']);
													unset($_POST['direccion']);
													unset($_POST['apodo']);
													unset($_POST['id_cargo']);
													unset($_POST['id_comite_temporero']);
													unset($_POST['id_estado_civil']);
													unset($_POST['id_sociedad']);								
													unset($_POST['id_rango_ministerial']);
											}
								} else{

											// Creamos la Persona
									 		$this->persona->set("nombres", $_POST['nombre']);
											$this->persona->set("apellidos", $_POST['apellidos']);
											$this->persona->set("fecha_nacimiento", $_POST['fch_nacimiento']);
											$this->persona->set("telefono", $_POST['telefono']);
											$this->persona->set("direccion", $_POST['direccion']);
											$this->persona->set("id_provincia", $_POST['id_provincia']);
											$this->persona->set("id_pais", $_POST['id_pais']);
											$this->persona->set("id_sexo", $_POST['id_sexo']);
											$this->persona->set("id_estado_civil", $_POST['id_estado_civil']);
											$this->persona->set("id_clasificacion", $_POST['id_sociedad']);
											$this->persona->set("id_tipo_documento", $_POST['id_tipo_documento']);
											$this->persona->set("nro_documento_identidad", $_POST['nro_documento']);
											$this->persona->set("imagen", $img_nombre);
											$this->persona->set("apodo", $_POST['apodo']);
											$datos=$this->persona->add();								

									// Creamos en la tabla de Miembros
											$datos=$this->miembro->BuscaIdPersona($_POST['nombre'], $_POST['apellidos']);
											$idPersona=$datos['id_persona'];							

											$this->miembro->set("id_persona", $idPersona);
											$this->miembro->set("id_iglesia", $_POST['id_iglesia']);
											$this->miembro->set("id_sociedad", $_POST['id_sociedad']);
											$this->miembro->set("id_estado_condicion", $_POST['id_estado']);
											$this->miembro->set("fecha_conversion", $_POST['fch_conversion']);
											$this->miembro->set("fecha_bautismo", $_POST['fch_bautismo']);
											$this->miembro->set("id_rango_ministerial", $_POST['id_rango_ministerial']);
											$this->miembro->add();

												// Lo registramos en la actividad

											$this->registro->set("id_servicio", $_POST['id_servicio']);
											$this->registro->set("id_distrito", $_POST['id_distrito']);
											$this->registro->set("id_circuito", $_POST['id_circuito']);
											$this->registro->set("id_iglesia", $_POST['id_iglesia']);
											$this->registro->set("id_persona",$idPersona);
											$this->registro->set("es_miembro_iglesia", '1');
											$this->registro->set("es_lider",  $lider);
											$this->registro->set("es_miembro_ministerial", $miembro_ministerial);
											$this->registro->set("es_pastor", $pastor);
											$this->registro->set("es_presbitero",  $presbitero);
											$this->registro->set("es_delegado", $delegado);
											$this->registro->set("es_visita", $visita);
											$this->registro->set("trabaja_comite",$trabajaComite);
											$this->registro->set("es_exonerado", $exonerado);

											$datos=$this->registro->add();
											if ($datos) {
														$_POST['usuario']='fbrujan';
														date_default_timezone_set('America/Santo_Domingo');
														// Crear una asistencia para el registro recien realizado
														$this->asistencias->set("id_persona", $idPersona);
														$this->asistencias->set("id_servicio", $_POST['id_servicio']);
														$this->asistencias->set("id_tanda", '1');
														$this->asistencias->set("fecha", date("Y-m-d"));
														$this->asistencias->set("usuario", $_POST['usuario']);
														$datos=$this->asistencias->add();
												
														unset($_POST['nombre']);
														unset($_POST['es_delegado']);
														unset($_POST['es_pastor']);
														unset($_POST['es_exonerado']);
														unset($_POST['apellidos']);
														unset($_POST['fch_nacimiento']);
														unset($_POST['fch_conversion']);
														unset($_POST['fch_bautismo']);
														unset($_POST['id_sexo']);
														unset($_POST['id_estado_civil']);
														unset($_POST['es_presbitero']);
														unset($_POST['trabaja_comite']);
														unset($_POST['es_miembro_ministerial']);
														unset($_POST['es_miembro_iglesia']);
														unset($_POST['id_persona']);
														unset($_POST['id_iglesia']);
														unset($_POST['id_circuito']);
														unset($_POST['id_tipo_documento']);
														unset($_POST['nro_documento']);
														unset($_POST['telefono']);
														unset($_POST['direccion']);
														unset($_POST['apodo']);
														unset($_POST['id_cargo']);
														unset($_POST['id_comite_temporero']);
														unset($_POST['id_estado_civil']);
														unset($_POST['id_sociedad']);								
														unset($_POST['id_rango_ministerial']);
														

														
											}
									}
			}

	}	


		public function listarPaises(){
			$datos = $this->pais->lists();
			return $datos;
		}
		public function listarProvincias(){
			$datos = $this->provincia->lists();
			return $datos;
		}

		public function listarEstados(){
			$datos = $this->estado->lists();
			return $datos;
		}

		public function listarSexos(){
			$datos = $this->sexo->lists();
			return $datos;
		}

		public function listarServicios(){
			$datos = $this->servicio->lists2();
			return $datos;
		}


		public function listarCargos(){
			$datos = $this->cargo->lists();
			return $datos;
		}

		public function listarComites(){
			$datos = $this->comite->lists();
			return $datos;
		}

		public function listarTipoDocumento(){
			$datos = $this->tipo_documento->lists();
			return $datos;
		}

		public function listarDistritos(){
			$datos = $this->distrito->lists();
			return $datos;
		}
		public function listarCircuitos(){
			$datos = $this->circuito->lists();
			return $datos;
		}
		public function listarIglesias(){
			$datos = $this->iglesia->lists();
			return $datos;
		}

		public function listarRangosMinisteriales(){
			$datos = $this->rango_ministerial->lists();
			return $datos;
		}
	}
	$registros = new registros();

?>