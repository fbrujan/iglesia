<?php
	ob_start();
?>
<?php
	define('DS', DIRECTORY_SEPARATOR);
	define('ROOT', realpath(dirname(__FILE__)) . DS);
	define('URL', DS); // De esta manera no me da error al cargar el bootstrap cuando uso docker
	//define('URL', "http://www.iglesiarefugio5to.com/");	
	require_once "Config/Autoload.php";
	Config\Autoload::run();
	require_once "Views/template.php";
	Config\Enrutador::run(new Config\Request());
?>

<?php
	ob_end_flush();
?>
