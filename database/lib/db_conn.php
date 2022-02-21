<?php
	
	$sname = "localhost";
	$db_uname = "root";
	$db_pass = "";
	$db_name = "ktm";

	$link = mysqli_connect($sname, $db_uname, $db_pass, $db_name);

	if($link === false) {
		die("Error: Could not able to connect to database".mysqli_connect_error());
	} 

?>
