<?php namespace Controllers;
	use Models\M_Lideres		as Lider;
	use Models\M_Miembros 		as Miembro;
	use Models\M_Sociedades 	as Sociedad;
	use Models\M_Cargos 		as Cargo;
	use Models\M_Departamentos	as Departamento;
	
	class lideres{
		// Atributos o Propiedades
		private $lider;
		private $miembro;
		private $sociedad;
		private $cargo;
		private $departamento;		

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->lider 			= new Lider;
			$this->miembro 			= new Miembro;
			$this->sociedad 		= new Sociedad;	
			$this->cargo 			= new Cargo;
			$this->departamento		= new Departamento;					
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			//print "soy el index de la tabla miembros";
			$datos = $this->lider->lists();
			return $datos;
		}

		public function ver($id){
			$this->lider->set("id", $id);
			$datos = $this->lider->view();
			return $datos; 
		}

		public function listar_todos(){
			$datos = $this->lider->listsAll();
			return $datos;
			header("Location: " . URL . "lideres");
		}

		public function eliminar($id){
			$this->lider->set("id", $id);
			$this->lider->delete();
			header("Location: " . URL . "lideres");
		}

		public function editar($id){
			if($_POST){
					$this->lider->set("id_lider", $id);
					$this->lider->set("id_miembro", $_POST['id_miembro']);
					$this->lider->set("id_cargo", $_POST['id_cargo']);
					$this->lider->set("id_departamento", $_POST['id_departamento']);
					$this->lider->set("fch_inicio", $_POST['fch_inicio']);
					$this->lider->set("fch_fin", $_POST['fch_fin']);
					$this->lider->set("vigente", $_POST['vigente']);
					$this->lider->edit();
				header('Location: ' . URL . "lideres");
			}else{
				$this->lider->set("id_lider", $id);
				$datos = $this->lider->view();
				return $datos;
			}
		}

		public function agregar(){
			if($_POST){
					$this->lider->set("id_miembro", $_POST['id_miembro']);
					$this->lider->set("id_cargo", $_POST['id_cargo']);
					$this->lider->set("id_departamento", $_POST['id_departamento']);
					$this->lider->set("fch_inicio", $_POST['fch_inicio']);
					$this->lider->set("fch_fin", $_POST['fch_fin']);
					$this->lider->set("vigente", $_POST['vigente']);
					$this->lider->add();
					header('Location: ' . URL . "lideres");

			}
		}

		
		public function listarMiembros(){
			$datos = $this->miembro->lists();
			return $datos;
		}

		public function listarMiembrosActuales(){
			$datos = $this->miembro->listsMiembros();
			return $datos;
		}

		public function listarSociedades(){
			$datos = $this->sociedad->lists();
			return $datos;
		}

		public function listarCargos(){
			$datos = $this->cargo->lists();
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
	$lideres = new lideres();

?>