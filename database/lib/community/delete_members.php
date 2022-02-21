<?php
	
	include "../db_conn.php";

	$dlt_id = $_GET['d_id'];

	$sql = "DELETE FROM `comm_members` WHERE mem_id = '$dlt_id'";

	$data = mysqli_query($link, $sql);

	if($data) {
		$sm = "Record deleted from database";
		echo ("<script LANGUAGE='JavaScript'>
	    		window.alert('$sm');
	   			window.location.href='comm_members.php';
	    		</script>");
	} else {
		$em = "Unable to delete record from database";
		echo ("<script LANGUAGE='JavaScript'>
	    		window.alert('$em');
	   			window.location.href='comm_members.php';
	    		</script>");
	}

?>