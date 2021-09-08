<?php namespace Controllers;
	use Models\M_Asistencia		as Asistencias;
	use Models\M_Lideres		as Lider;
	use Models\M_Personas 		as Personas;
	use Models\M_Servicios	 	as Servicios;
	use Models\M_Iglesias		as Iglesias;
	use Models\M_Departamentos	as Departamento;
	
	class asistencia{
		// Atributos o Propiedades
		private $asistencias;
		private $lider;
		private $personas;
		private $servicios;
		private $iglesias;
		private $departamento;		

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->asistencias 		= new Asistencias;
			$this->lider 			= new Lider;
			$this->personas 		= new Personas;
			$this->servicios 		= new Servicios;	
			$this->iglesias			= new Iglesias;
			$this->departamento		= new Departamento;					
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla miembros";
			$datos = $this->asistencias->lists();
			return $datos;
		}

		public function ver($id){
			$this->asistencias->set("id_asistencia", $id);
			$datos = $this->asistencias->view();
			return $datos; 
		}

		public function eliminar($id){
			$this->asistencias->set("id_asistencia", $id);
			$this->asistencias->delete();
			header("Location: " . URL . "asistencia");
		}

		public function editar($id){
			if($_POST){
					$this->asistencias->set("id_asistencia", $id);
					$this->asistencias->set("id_persona", $_POST['id_persona']);
					$this->asistencias->set("id_servicio", $_POST['id_servicio']);
					$this->asistencias->set("id_tanda", $_POST['id_tanda']);
					$this->asistencias->set("fecha", $_POST['fecha']);
					$this->asistencias->set("usuario", $_POST['usuario']);
					$this->asistencias->add();
					$this->asistencias->edit();
				header('Location: ' . URL . "asistencia");
			}else{
				$this->asistencias->set("id", $id);
				$datos = $this->asistencias->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
					$this->asistencias->set("id_persona", $_POST['id_persona']);
					$this->asistencias->set("id_servicio", $_POST['id_servicio']);
					$this->asistencias->set("id_tanda", $_POST['id_tanda']);
					$this->asistencias->set("fecha", $_POST['fecha']);
					$this->asistencias->set("usuario", $_POST['usuario']);
					//$this->asistencias->set("id_clasificacion", $_POST['id_clasificacion']);
					$this->asistencias->add();
					//header('Location: ' . URL . "asistencia");

			}
		}

		public function agregar_multiple(){
			if($_POST){
					
					$idServicio=$_POST['id_servicio'];
					$idTanda=$_POST['id_tanda'];
					$Fecha= $_POST['fecha'];
					$Usuario=$_POST['usuario'];
					//$this->asistencias->set("id_clasificacion", $_POST['id_clasificacion']);
					foreach($_POST['id_persona'] as $id_persona) {
							$this->asistencias->set("id_servicio", $idServicio);
							$this->asistencias->set("id_tanda", $idTanda);
							$this->asistencias->set("fecha",$Fecha);
							$this->asistencias->set("usuario", $Usuario);
   							$this->asistencias->set("id_persona", $id_persona);
   							$this->asistencias->add_multiple();
						
					}
					
					
					//header('Location: ' . URL . "asistencia");

			}
		}

		
		public function listarPersonas(){
			$datos = $this->personas->lists();
			return $datos;
		}

		public function listarServicios(){
			$datos = $this->servicios->lists();
			return $datos;
		}

		public function listarIglesias(){
			$datos = $this->iglesias->lists();
			return $datos;
		}

		public function cargosMiembro($id_miembro){
			$this->lider->set('id_miembro',$id_miembro);
			$datos = $this->lider->cargosMiembro();
			return $datos;
		}

		public function cargosActualesMiembro($id_miembro){
			$this->lider->set('id_miembro',$id_miembro);
			$datos = $this->lider->listarCargosActualesMiembro();
			return $datos;
		}

		public function listarDepartamentos(){
			$datos = $this->departamento->lists();
			return $datos;
		}
	}

	$asistencia = new asistencia();

?>