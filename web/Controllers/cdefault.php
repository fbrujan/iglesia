<?php namespace Controllers;
	use Models\M_Default as CDefaults;

	class cdefault{
		// Atributos o Propiedades
		private $i_default;

		//Metodos
		//Metodo Constructor
		public function __construct(){
			$this->i_default = new CDefaults;
		}

		public function index(){
			// Este metodo se llama por defecto ... lo utilizo para invocar al modelo
			
			//echo 'Alcance al Controlador Default';
		}

	}	

?>