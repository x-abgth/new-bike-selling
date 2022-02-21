<?php
	session_start();
	if(isset($_SESSION['id']) && isset($_SESSION['username'])) {
	include "../db_conn.php";

	if(isset($_POST['add_post'])) {

		$center_name = $_SESSION['username'];

		$c_filename = $_FILES['comm_post']['name'];
		$c_tmpname = $_FILES['comm_post']['tmp_name'];
		$c_filesize = $_FILES['comm_post']['size'];
		$c_file_error = $_FILES['comm_post']['error'];

		$c_fileSizeInMB = ($c_filesize)/(1024*1024);

		$folder = "../../images/";


		if ($c_file_error === 0) {
			if($c_fileSizeInMB > 3) {
				$em = "Sorry, file is too large!";
				echo ("<script LANGUAGE='JavaScript'>
	    			window.alert('$em');
	   				window.location.href='add_posts.php';
	    			</script>");
			} else {

				$c_file_ext = pathinfo($c_filename, PATHINFO_EXTENSION);
				$c_file_ext_lc = strtolower($c_file_ext);

				$allowed_ext = array("jpg", "jpeg", "png");

				if(in_array($c_file_ext_lc, $allowed_ext)) {
					

					$c_title = mysqli_real_escape_string($link, $_REQUEST['post_title']);
					
					

					$sql = "INSERT INTO comm_media (`m_title`, `m_post`, `center_name`) 
							VALUES('$c_title', '$c_filename', '$center_name')";

					 move_uploaded_file($c_tmpname, $folder.$c_filename);

					if(mysqli_query($link, $sql)) {

						$sm = 'Records inserted successfully!';
						echo ("<script LANGUAGE='JavaScript'>
			    			window.alert('$sm');
			   				window.location.href='add_posts.php';
			    			</script>");

					} else {
						echo "Error: could not able execute $sql " . mysqli_error($link);
					}

					mysqli_close($link);

				} else {
					$em = 'You can\\\'t upload files of this type!';
					echo ("<script LANGUAGE='JavaScript'>
		    			window.alert('$em');
		   				window.location.href='add_posts.php';
		    			</script>");
				}
			}
			
		} else {
			$em = 'An unknown error occured!';
			echo ("<script LANGUAGE='JavaScript'>
    			window.alert('$em');
   				window.location.href='add_posts.php';
    			</script>");

		}

	} else {
		$em = 'An unknown error occured!';
		echo ("<script LANGUAGE='JavaScript'>
		    window.alert('$em');
		   	window.location.href='add_posts.php';
			</script>");
	}
	} else {
		header("Location: login.php");
		exit();
	}

?>