<?php namespace Config;
// Este autoload es para cargar todas las clases y poder utilizarlas sin necesidad de hacer un require_once de cada una
	class Autoload{
		public static function run(){
			spl_autoload_register(function($class){
				$ruta = str_replace("\\", "/", $class) . ".php";
					include_once $ruta;
					//print $ruta . "<br />";
			});
		}
	}
?>