<?php

	session_start();
	if(isset($_SESSION['id']) && isset($_SESSION['username'])) {

?> 


<!DOCTYPE html>
<html>
<head>
	<title>Trips</title>
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
						<li><a href="../sh_home.php">Home</a></li>
						<li><a href="../bookings/bookings_page.php">Bookings</a></li>
						<li><a href="sh_home.php">Add Services</a></li>
						<li><a href="../navigation-bar/logout.php">Logout</a></li>
					</ul>
				</nav>
			</header>


		<div class="insert_banner">

			<h2 id = "admin_head">KTM COMMUNITY TRIPS</h2>

			<div class="insert_form">

				
				<form action = "add_tripsDb.php" method = "POST">

				    <div class="row">
				      
				      <div id="label">
				        <label>Trip Name:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "trip_name" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Trip Description:</label>
				      </div>

				      <div id="input">
				        <textarea cols="50" rows="5" name="trip_desc"></textarea>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>From:</label>
				      </div>

				      <div id="input">
						 <input type="text" name="from" required>
				      </div>

				    </div>
				    
				    <div class="row">
				      
				      <div id="label">
				        <label>To:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "to" required>
				    </div>

				    </div>
				       <div class="row">
				      
				      <div id="label">
				        <label>Distance in KM:</label>
				      </div>

				      <div id ="input">
				        <input type = "text" name = "distance" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Flag off day:</label>
				      </div>

				      <div id="input">
				        <input type = "date" name = "date" required>
				      </div>

				    </div>
				     <div class="row">
				      
				      <div id="label">
				        <label>Trip duration:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "duration" required>
				      </div>

				    </div>
				     <div class="row">
				      
				      <div id="label">
				        <label>Cordinator name:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "co_name" required>
				      </div>

				    </div>
				     <div class="row">
				      
				      <div id="label">
				        <label>Trip rate:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "rate" required>
				      </div>

				    </div>

				    <div class="row">
				      <input type="submit" name="submit_bt" value = "ADD TRIP">
				    </div>
  				</form>
			</div>
			
		</div>
		
	</div>

</body>
</html>

<?php
	
	} else {
		header("Location: ../login.php");
		exit();
	}

?>

