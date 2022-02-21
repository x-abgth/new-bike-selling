<?php
	
	session_start();
	include "db_conn.php";

	if(isset($_POST['loginUname']) && isset($_POST['loginPass'])) {

		function validate($data) {

			$data = trim($data);
			$data = stripcslashes($data);
			$data = htmlspecialchars($data);
			return $data;
		}
		$uname = validate($_POST['loginUname']);
		$pass = validate($_POST['loginPass']);

		if(empty($uname)) {
			header("Location: login.php?error=username is required");
			exit();
		} else if(empty($pass)) {
			header("Location: login.php?error=password is required");
			exit();
		} else {
			$sql = "SELECT * FROM ktm_centers WHERE username='$uname' AND password='$pass'";

			$result = mysqli_query($link, $sql);

			if(mysqli_num_rows($result) === 1) {
				
				$row = mysqli_fetch_assoc($result);
				if($row['username'] === $uname && $row['password'] === $pass)
				{

					$_SESSION['username'] = $row['username'];
					$_SESSION['id'] = $row['id'];
					header("Location: sh_home.php");
					exit();

				} else {
					header("Location: login.php?error=Incorrect username or password");
					exit();
				}
			} else {
				header("Location: login.php?error=Incorrect username or password");
				exit();
			}
		}

	} else {
		header("Location: login.php");
		exit();
	}
?>