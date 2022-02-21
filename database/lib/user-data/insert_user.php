<?php
	include "../db_conn.php";

	$u_id = mysqli_real_escape_string($link, $_POST['id']);
	$u_name = mysqli_real_escape_string($link, $_POST['name']);
	$u_address = mysqli_real_escape_string($link, $_POST['address']);
	$u_dob = mysqli_real_escape_string($link, $_POST['dob']);
	$u_phone = mysqli_real_escape_string($link, $_POST['phone']);
	$u_mail = mysqli_real_escape_string($link, $_POST['mail']);
	$u_password = mysqli_real_escape_string($link, $_POST['password']);

	$sql = "INSERT INTO `users`(`u_id`,`u_name`, `u_address`, `u_dob`, `u_phone`, `u_mail`, `u_password`) VALUES ('$u_id','$u_name','$u_address','$u_dob','$u_phone','$u_mail','$u_password')";

	$results = mysqli_query($link, $sql);

	if($results > 0) {
		echo "user added successfully";
	}		
?>
