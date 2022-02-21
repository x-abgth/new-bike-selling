<?php
	include "../db_conn.php";

	if(isset($_POST['submit_bt'])) {

		$a_filename = $_FILES['bike_img_A']['name'];
		$a_tmpname = $_FILES['bike_img_A']['tmp_name'];
		$a_filesize = $_FILES['bike_img_A']['size'];
		$a_file_error = $_FILES['bike_img_A']['error'];

		$b_filename = $_FILES['bike_img_B']['name'];
		$b_tmpname = $_FILES['bike_img_B']['tmp_name'];
		$b_filesize = $_FILES['bike_img_B']['size'];
		$b_file_error = $_FILES['bike_img_B']['error'];

		$c_filename = $_FILES['bike_img_C']['name'];
		$c_tmpname = $_FILES['bike_img_C']['tmp_name'];
		$c_filesize = $_FILES['bike_img_C']['size'];
		$c_file_error = $_FILES['bike_img_C']['error'];

		$a_fileSizeInMB = ($a_filesize)/(1024*1024);
		$b_fileSizeInMB = ($b_filesize)/(1024*1024);		
		$c_fileSizeInMB = ($c_filesize)/(1024*1024);


		$folder = "../../images/";


		if ($a_file_error === 0 && $b_file_error === 0 && $c_file_error === 0) {
			if($a_fileSizeInMB > 1 && $b_fileSizeInMB > 1 && $c_fileSizeInMB > 1) {
				$em = "Sorry, file is too large!";
				echo ("<script LANGUAGE='JavaScript'>
	    			window.alert('$em');
	   				window.location.href='admin_insert.php';
	    			</script>");
			} else {

				$a_file_ext = pathinfo($a_filename, PATHINFO_EXTENSION);
				$a_file_ext_lc = strtolower($a_file_ext);

				$b_file_ext = pathinfo($b_filename, PATHINFO_EXTENSION);
				$b_file_ext_lc = strtolower($b_file_ext);

				$c_file_ext = pathinfo($c_filename, PATHINFO_EXTENSION);
				$c_file_ext_lc = strtolower($c_file_ext);

				$allowed_ext = array("jpg", "jpeg", "png");

				if(in_array($a_file_ext_lc, $allowed_ext) && in_array($b_file_ext_lc, $allowed_ext) && in_array($c_file_ext_lc, $allowed_ext)) {
					

					$m_name = mysqli_real_escape_string($link, $_REQUEST['model_name']);
					$m_color = mysqli_real_escape_string($link, $_REQUEST['color']);
					$m_category = mysqli_real_escape_string($link, $_REQUEST['category']);
					$m_mileage = mysqli_real_escape_string($link, $_REQUEST['mileage']);
					$m_displacement = mysqli_real_escape_string($link, $_REQUEST['displacement']);
					$m_engine = mysqli_real_escape_string($link, $_REQUEST['engine']);
					$m_cylinders = mysqli_real_escape_string($link, $_REQUEST['cylinders']);
					$m_power = mysqli_real_escape_string($link, $_REQUEST['power']);
					$m_torque = mysqli_real_escape_string($link, $_REQUEST['torque']);
					$m_fuel_tank = mysqli_real_escape_string($link, $_REQUEST['fuel_tank']);
					$m_abs = mysqli_real_escape_string($link, $_REQUEST['abs']);
					$m_key_features = mysqli_real_escape_string($link, $_REQUEST['key_features']);
					$m_price_value = mysqli_real_escape_string($link, $_REQUEST['price']);
					

					$sql = "INSERT INTO bikes (`m_name`, `m_color`, `m_category`, `m_mileage`, `m_displacement`, `m_engine`, `m_cylinders`, `m_power`, `m_torque`, `m_fuel_tank`, `m_abs`, `m_key_features`, `m_image_a`, `m_image_b`, `m_image_c`, `m_price`) 
							VALUES('$m_name','$m_color','$m_category','$m_mileage','$m_displacement','$m_engine','$m_cylinders',
								'$m_power','$m_torque','$m_fuel_tank','$m_abs','$m_key_features','$a_filename', '$b_filename', '$c_filename', '$m_price_value')";

					 move_uploaded_file($a_tmpname, $folder.$a_filename);
					 move_uploaded_file($b_tmpname, $folder.$b_filename);
					 move_uploaded_file($c_tmpname, $folder.$c_filename);

					if(mysqli_query($link, $sql)) {

						$sm = 'Records inserted successfully!';
						echo ("<script LANGUAGE='JavaScript'>
			    			window.alert('$sm');
			   				window.location.href='admin_insert.php';
			    			</script>");

					} else {
						echo "Error: could not able execute $sql " . mysqli_error($link);
					}

					mysqli_close($link);

				} else {
					$em = 'You can\\\'t upload files of this type!';
					echo ("<script LANGUAGE='JavaScript'>
		    			window.alert('$em');
		   				window.location.href='admin_insert.php';
		    			</script>");
				}
			}
			
		} else {
			$em = 'An unknown error occured!';
			echo ("<script LANGUAGE='JavaScript'>
    			window.alert('$em');
   				window.location.href='admin_insert.php';
    			</script>");

		}

	} else {
		$em = 'An unknown error occured!';
		echo ("<script LANGUAGE='JavaScript'>
		    window.alert('$em');
		   	window.location.href='admin_insert.php';
			</script>");
	}

?>