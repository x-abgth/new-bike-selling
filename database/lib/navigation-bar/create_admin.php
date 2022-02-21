<?php

	session_start();
	if(isset($_SESSION['a_id']) && isset($_SESSION['username'])) {

?> 


<!DOCTYPE html>
<html>
<head>
	<title>Add Admin</title>
	<style>
		<?php include "../style.css" ?>
	</style>
</head>
<body>

	<div class="insert_wrapper">

		<div id="ktmlogobg">
			<img src="../../assets/ktm_logo.png" id="ktmlogo">
		</div>

			<header>
				<img class="user" src="../../assets/user.jpg" alt="user">
				<p id= "admin"><?php echo $_SESSION['username']; ?></p>

				<nav>
					<ul class="nav_links">
						<li><a href="../admin_home.php">Home</a></li>
						<li><a href="create_admin.php">Manage Admin</a></li>
						<li><a href="./logout.php">Logout</a></li>
					</ul>
				</nav>
			</header>


		<div class="a_banner">

			<h2 id = "admin_head">ADD ADMIN</h2>

			<div class="a_form">

				
				<form autocomplete="off" action = "create_adminDb.php" method = "POST">

				    <div class="a_row">
				      
				      <div id="label">
				        <label>Admin Username:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "a_uname" autocomplete = "false" required>
				      </div>

				    </div>

				    <div class="a_row">
				      
				      <div id="label">
				        <label>Enter Password:</label>
				      </div>

				      <div id="input">
						 <input type="password" name="a_pass1" required>
				      </div>

				    </div>

				    <div class="a_row">
				      
				      <div id="label">
				        <label>Re-Enter Password:</label>
				      </div>

				      <div id="input">
						 <input type="password" name="a_pass2" required>
				      </div>

				    </div>

				    <div class="a_row">
				      <input type="submit" name="add_admin" value = "ADD ADMIN">
				    </div>
  				</form>
			</div>
			
		</div>

</body>
</html>

<?php
	
	} else {
		header("Location: login.php");
		exit();
	}

?>