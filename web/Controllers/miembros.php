<?php namespace Controllers;
ini_set("display_errors","1");
error_reporting(E_ALL);

	use Models\M_Miembros 		as Miembro;
	use Models\M_Personas 		as Persona;
	use Models\M_Sociedades 	as Sociedad;
	use Models\M_Estados 		as Estado;
	use Models\M_Sexo 			as Sexo;
	use Models\M_Paises 		as Pais;
	use Models\M_Provincias 	as Provincia;
	use Models\M_Tipo_Documento	as Tipo_Documento;
	use Models\M_Lideres		as CargosOcupados;
	use Models\M_Iglesias		as Iglesias;
	use Models\M_RangoMinisterial		as RangoMinisterial;

	class miembros{
		// Atributos o Propiedades
		private $miembro;
		private $persona;
		private $sociedad;
		private $estado;
		private $sexo;
		private $tipo_documento;
		private $cargosOcupados;
		private $iglesia;
		private $rango_ministerial;
		private $pais;
		private $provincia;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->miembro 			= new Miembro;
			$this->persona 			= new Persona;
			$this->sociedad 		= new Sociedad;
			$this->estado 			= new Estado;
			$this->sexo 			= new Sexo;
			$this->pais 			= new Pais;
			$this->provincia 		= new Provincia;
			$this->tipo_documento 	= new Tipo_Documento;
			$this->cargosOcupados 	= new CargosOcupados;
			$this->iglesia 			= new Iglesias;
			$this->rango_ministerial 	= new RangoMinisterial;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla miembros";
			$datos = $this->miembro->lists();
			return $datos;
		}

		public function ver($id){
			$this->miembro->set("id_miembro", $id);
			$datos = $this->miembro->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->miembro->set("id_miembro", $id);
			$this->miembro->delete();
			header("Location: " . URL . "miembros");
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
						move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);}else{$img_nombre = 'aaa.jpeg';}

					
					if ($_POST['id_persona']!="") {
						// Exclusivo para la tabla de Miembros.... cuando se tiene el id_persona
						$_POST['id_persona'];
						$this->miembro->set("id_persona",$_POST['id_persona']);
						$this->miembro->set("id_iglesia", $_POST['id_iglesia']);
						$this->miembro->set("id_sociedad", $_POST['id_sociedad']);
						$this->miembro->set("id_estado_condicion", $_POST['id_estado']);
						$this->miembro->set("fecha_conversion", $_POST['fch_conversion']);
						$this->miembro->set("fecha_bautismo", $_POST['fch_bautismo']);
						$this->miembro->set("id_rango_ministerial", $_POST['id_rango_ministerial']);
						$this->miembro->add();
						//header('Location: ' . URL . "miembros");


					}else{
						
						$datos=$this->miembro->BuscaIdPersona($_POST['nombre'], $_POST['apellidos']);
						$idPersona=$datos['id_persona'];
						if ($idPersona) {
							$this->miembro->set("id_persona", $idPersona);
							$this->miembro->set("id_iglesia", $_POST['id_iglesia']);
							$this->miembro->set("id_sociedad", $_POST['id_sociedad']);
							$this->miembro->set("id_estado_condicion", $_POST['id_estado']);
							$this->miembro->set("fecha_conversion", $_POST['fch_conversion']);
							$this->miembro->set("fecha_bautismo", $_POST['fch_bautismo']);
							$this->miembro->set("id_rango_ministerial", $_POST['id_rango_ministerial']);
							$this->miembro->add();
						}else{
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
							/*if ($datos) {
								# code...
								$row = mysqli_fetch_array($datos);
								$idPersona=$row[0];

							}else{
								*/
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
						}
						// Se Agrega primero como persona y luego se llena la tabla miembro						

						
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

		public function listarCargos($id){
			$this->cargosOcupados->set('id_miembro',$id);
			$datos = $this->cargosOcupados->cargosMiembro();
			return $datos;
		}

		public function listarTipoDocumento(){
			$datos = $this->tipo_documento->lists();
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
	$miembros = new miembros();

?>