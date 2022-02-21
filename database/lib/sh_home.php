<?php

	session_start();
	if(isset($_SESSION['id']) && isset($_SESSION['username'])) {

?> 

<!DOCTYPE html>
<html>
<head>
	<title>Showroom Home Page</title>
	<style>
		<?php include "style.css" ?>
	</style>
</head>
<body>

	<div id="ktmlogobg">
		<img src="../assets/ktm_logo.png" id="ktmlogo">
	</div>

	<div class="showroom_wrapper">
		<header>
			<img class="user" src="../assets/user.jpg" alt="user">
			<p id= "home_admin"><?php echo $_SESSION['username']; ?></p>

			<nav>
				<ul class="home_nav_links">
					<li><a href="sh_home.php">Home</a></li>
					<li><a href="bookings/bookings_page.php">Bookings</a></li>
					<li><a href="sh_home.php">Add Services</a></li>
					<li><a href="navigation-bar/logout.php">Logout</a></li>
				</ul>
			</nav>
		</header>
	</div>


	<div class="widgets">
		<div class = "home-widget-row">
			<div class = "home-card">
				<h2><b>ADD POSTS</b></h2>
				<p>Click the button below to add posts to the community</p>
				<input type="submit" name="addNew" value="Add posts" onclick="location.href= 'community/add_posts.php';">
			</div>

			<div class = "home-card">
				<h2><b>ADD TRIPS</b></h2>
				<p>Click the below button to add new trips to the community</p>
				<input type="submit" name="editDb" value="Add trip" onclick="location.href= 'community/add_trips.php';">
			</div>

			<div class = "home-card">
				<h2><b>ADD/REMOVE MEMBERS</b></h2>
				<p>Click the below button to add / remove members from the community</p>
				<input type="submit" name="viewDb" value="Add/Remove" onclick="location.href= 'community/comm_members.php';">
			</div>
		</div>
	</div>
	<div class="a-footer-nav">
			<ul>
				<li><a href="#">View users</a></li>
				<li><a href="#">View bikes</a></li>
			</ul>
		</div>


</body>
</html>

<?php
	
	} else {
		header("Location: login.php");
		exit();
	}

?>