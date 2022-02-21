<?php

	session_start();
	if(isset($_SESSION['a_id']) && isset($_SESSION['username'])) {

?> 

<!DOCTYPE html>
<html>
<head>
	<title>Admin Home Page</title>
	<style>
		<?php include "style.css" ?>
	</style>
</head>
<body>

	<div id="ktmlogobg">
		<img src="../assets/ktm_logo.png" id="ktmlogo">
	</div>

	<div class="header_wrapper">
		<header>
			<img class="user" src="../assets/user.jpg" alt="user">
			<p id= "home_admin"><?php echo $_SESSION['username']; ?></p>

			<nav>
				<ul class="home_nav_links">
					<li><a href="admin_home.php">Home</a></li>
					<li><a href="navigation-bar/create_admin.php">Manage Admin</a></li>
					<li><a href="navigation-bar/logout.php">Logout</a></li>
				</ul>
			</nav>
		</header>
	</div>


	<div class="widgets">
		<div class = "home-widget-row">
			<div class = "home-card">
				<h2><b>ADD NEW BIKE</b></h2>
				<p>Click the button below to add new model of KTM Bikes to the database.</p>
				<input type="submit" name="addNew" value="Add to database" onclick="location.href= 'bike-data/admin_insert.php';">
			</div>

			<div class = "home-card">
				<h2><b>EDIT BIKES DATABASE</b></h2>
				<p>Click the below button to view or edit or delete KTM Bikes from the database.</p>
				<input type="submit" name="editDb" value="View/Edit database" onclick="location.href= 'bike-data/admin_view.php';">
			</div>

			<div class = "home-card">
				<h2><b>MANAGE KTM CENTERS</b></h2>
				<p>Click the button below to add/delete KTM Centers (showrooms) landmark to the database.</p>
				<input type="submit" name="ktmCenter" value="Add KTM Center" onclick="location.href= 'ktm-centers/add_ktm_center.php';">
			</div>
		</div>

		<div class="a-footer-nav">
			<ul>
				<li><a href="ktm-centers/view_bike_bookings.php">View bike bookings</a></li>
				<li><a href="#">View user feedbacks</a></li>
			</ul>
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