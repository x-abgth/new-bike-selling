<?php

	if(isset($_POST['add_admin'])) {

		include "../db_conn.php";

		function validate($data) {

			$data = trim($data);
			$data = stripcslashes($data);
			$data = htmlspecialchars($data);
			return $data;
		}

		$a_username = validate( mysqli_real_escape_string($link, $_REQUEST['a_uname']) );
		$a_pass1 = validate( mysqli_real_escape_string($link, $_REQUEST['a_pass1']) );
		$a_pass2 = validate( mysqli_real_escape_string($link, $_REQUEST['a_pass2']) );

		if($a_pass1 === $a_pass2) {

			$sql = "INSERT INTO admin (`username`, `password`) VALUES('$a_username','$a_pass1')";

			if(mysqli_query($link, $sql)) {

				$sm = 'New admin account created successfully!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='create_admin.php';
			    		</script>");

			} else {
				echo "Error: could not able execute $sql " . mysqli_error($link);
			}

		} else {
			$em = 'Passwords doesn\\\'t match!';
			echo ("<script LANGUAGE='JavaScript'>
			    	window.alert('$em');
			   		window.location.href='create_admin.php';
			   		</script>");
		}

	mysqli_close($link);

	} else {
		header("Location: create_admin.php");
	}

?>