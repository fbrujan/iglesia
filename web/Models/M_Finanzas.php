<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Finanzas{
		// Atributos o Propiedades

		private $id_transaccion;
		private $fecha;
		private $id_tipo_transaccion;
		private $id_concepto;
		private $id_presona;
		private $monto;
		private $comentario;
		private $estado;
		private $con;


		// Metodos
		//Metodo Constructor

		
		public function __construct(){
			$this->con = new Conexion();
		}

		// Metodos SET y GET
		public function set($atributo, $valor){
			$this->$atributo = $valor;
		}

		public function get($atributo){
			return $this->$atributo;
		}

		//Metodo para probar que funciona
		public function hola(){
			echo "Hola soy el Model de la tabla Finanzas";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "INSERT INTO finanzas VALUES (NULL,". 
					"'{$this->id_tipo_transaccion}', '{$this->id_concepto}'," . 
					"'{$this->id_persona}', '{$this->fecha}', '{$this->monto}'," .
					"'{$this->comentario}','{$this->estado}')";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "SELECT f.* ".
						",tp.tipo_transaccion, tp.signo ".
						",cp.concepto_transaccion concepto ". 
						",p. nombres nombre, p.apellidos " . 
						",CONCAT(p.nombres, ' ', p.apellidos) full_name ".
						",f.monto * tp.signo valor ". 
					"FROM finanzas f ". 
						",tipo_transaccion tp ". 
						",conceptos_transaccion cp ". 
						",personas p ".
					"WHERE 1=1 ". 
						"AND f.id_tipo_transaccion = tp.id_tipo_transaccion " . 
						"AND f.id_concepto = cp.id_concepto_transaccion " . 
						"AND f.id_persona = p.id_persona " . 
						"AND upper(f.estado) != 'ANULADO' "	. 
						"ORDER BY f.fecha DESC";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL transaccion_renombrar('{$this->id_transaccion}','{$this->transaccion}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "UPDATE finanzas " . 
					"SET estado = 'Anulado' " .
					"WHERE id_transaccion = '{$this->id_transaccion}'";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "SELECT f.* ".
						",tp.tipo_transaccion, tp.signo ".
						",cp.concepto_transaccion concepto ". 
						",p. nombres nombre, p.apellidos " . 
						",CONCAT(p.nombres, ' ', p.apellidos) full_name ". 
						",f.monto * tp.signo valor ".
					"FROM finanzas f ". 
						",tipo_transaccion tp ". 
						",conceptos_transaccion cp ". 
						",personas p ".
					"WHERE 1=1 ". 
						"AND f.id_tipo_transaccion = tp.id_tipo_transaccion " . 
						"AND f.id_concepto = cp.id_concepto_transaccion " . 
						"AND f.id_persona = p.id_persona " . 
						"AND upper(f.estado) != 'ANULADO' "	.	
						"AND f.id_transaccion = '{$this->id_transaccion}'";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}


		//Obtener listado de personas
		public function personas(){
			$sql = "SELECT * FROM personas";
			$datos = $this->con->consultaRetorno($sql);
			//$this->con->desconectar();
			return $datos;	
		}

		//Obtener listado de transacciones
		public function conceptos(){
			$sql = "SELECT * FROM conceptos_transaccion";
			$datos = $this->con->consultaRetorno($sql);
			//$this->con->desconectar();
			return $datos;	
		}

		//Obtener los tipos de transacciones
		public function tipo_transacciones(){
			$sql = "SELECT * FROM tipo_transaccion";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;	
		}

	}
?>