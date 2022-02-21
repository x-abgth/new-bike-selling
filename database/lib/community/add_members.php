<?php

	if(isset($_POST['add'])) {

		include "../db_conn.php";

		$username = mysqli_real_escape_string($link, $_REQUEST['name']);
		$u_phone = mysqli_real_escape_string($link, $_REQUEST['ph_no']);
		$u_mail = mysqli_real_escape_string($link, $_REQUEST['mail']);
		$reg_no = mysqli_real_escape_string($link, $_REQUEST['reg_no']);
		$bike_model = mysqli_real_escape_string($link, $_REQUEST['bike_model']);
		



			$sql = "INSERT INTO `comm_members`(`username`, `u_phone`, `u_mail`, `reg_no`, `bike_model`) VALUES ('$username','$u_phone','$u_mail','$reg_no','$bike_model')";

			if(mysqli_query($link, $sql)) {

				$sm = 'Records added successfully!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='comm_members.php';
			    		</script>");

			} else {
				echo "Error: could not able execute $sql " . mysqli_error($link);
			}

	mysqli_close($link);

	} else {
		$sm = 'error happened!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='comm_members.php';
			    		</script>");
	}

?>