<?php

	if(isset($_POST['add_center'])) {

		include "../db_conn.php";

		$ktm_name = mysqli_real_escape_string($link, $_REQUEST['ktm_name']);
		$ktm_uname = mysqli_real_escape_string($link, $_REQUEST['uname']);
		$ktm_pass = mysqli_real_escape_string($link, $_REQUEST['pass']);
		$ktm_address = mysqli_real_escape_string($link, $_REQUEST['ktm_address']);
		$ktm_contact = mysqli_real_escape_string($link, $_REQUEST['ktm_contact']);
		$ktm_latitude = mysqli_real_escape_string($link, $_REQUEST['ktm_latitude']);
		$ktm_longitude = mysqli_real_escape_string($link, $_REQUEST['ktm_longitude']);



			$sql = "INSERT INTO ktm_centers (`username`,`password`,`center_name`, `center_address`, `contact_number`, `latitude`, `longitude`) VALUES('$ktm_uname','$ktm_pass','$ktm_name','$ktm_address','$ktm_contact','$ktm_latitude','$ktm_longitude')";

			if(mysqli_query($link, $sql)) {

				$sm = 'KTM Center added successfully!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='add_ktm_center.php';
			    		</script>");

			} else {
				echo "Error: could not able execute $sql " . mysqli_error($link);
			}

	mysqli_close($link);

	} else {
		header("Location: add_ktm_center.php");
		$sm = 'error happened!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='add_ktm_center.php';
			    		</script>");
	}

?>