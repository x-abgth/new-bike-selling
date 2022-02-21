<?php

	if(isset($_POST['submit_bt'])) {

		include "../db_conn.php";

		$trip_name = mysqli_real_escape_string($link, $_REQUEST['trip_name']);
		$trip_desc = mysqli_real_escape_string($link, $_REQUEST['trip_desc']);
		$from = mysqli_real_escape_string($link, $_REQUEST['from']);
		$to = mysqli_real_escape_string($link, $_REQUEST['to']);
		$distance = mysqli_real_escape_string($link, $_REQUEST['distance']);
		$date = mysqli_real_escape_string($link, $_REQUEST['date']);
		$duration = mysqli_real_escape_string($link, $_REQUEST['duration']);
		$co_name = mysqli_real_escape_string($link, $_REQUEST['co_name']);
		$rate = mysqli_real_escape_string($link, $_REQUEST['rate']);




			$sql = "INSERT INTO `comm_trips`(`trip_name`, `trip_desc`, `trip_from`, `trip_to`, `trip_distance`, `trip_date`, `trip_duration`, `trip_codinator`, `trip_rate`) VALUES ('$trip_name','$trip_desc','$from','$to','$distance','$date','$duration','$co_name','$rate')";

			if(mysqli_query($link, $sql)) {

				$sm = 'Records added successfully!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='add_trips.php';
			    		</script>");

			} else {
				echo "Error: could not able execute $sql " . mysqli_error($link);
			}

	mysqli_close($link);

	} else {
		$sm = 'error happened!';
				echo ("<script LANGUAGE='JavaScript'>
			    		window.alert('$sm');
			   			window.location.href='add_trips.php';
			    		</script>");
	}

?>