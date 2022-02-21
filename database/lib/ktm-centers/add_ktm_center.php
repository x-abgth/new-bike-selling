<?php

	session_start();
	if(isset($_SESSION['a_id']) && isset($_SESSION['username'])) {

?> 


<!DOCTYPE html>
<html>
<head>
	<title>Add KTM Center</title>
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
						<li><a href="../navigation-bar/create_admin.php">Manage Admin</a></li>
						<li><a href="../navigation-bar/logout.php">Logout</a></li>
					</ul>
				</nav>
			</header>


		<div class="a_banner">

			<h2 id = "admin_head">ADD KTM CENTERS</h2>

			<div class="insert_form">

				
				<form action = "add_ktm_centerDb.php" method = "POST">

				    <div class="row">
				      
				      <div id="label">
				        <label>KTM Center Name :</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "ktm_name" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Username :</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "uname" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Password :</label>
				      </div>

				      <div id="input">
				        <input type = "password" name = "pass" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Address : </label>
				      </div>

				      <div id="input">
						 <textarea cols="50" rows="5" name="ktm_address"></textarea>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Contact Number : </label>
				      </div>

				      <div id="input">
						 <input type="text" name="ktm_contact">
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Enter Latitude : </label>
				      </div>

				      <div id="input">
						 <input type="text" name="ktm_latitude" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Enter Longitude : </label>
				      </div>

				      <div id="input">
						 <input type="text" name="ktm_longitude" required>
				      </div>

				    </div>

				    <div class="row">
				      <input type="submit" name="add_center" value = "ADD KTM CENTER">
				    </div>
  				</form>
			</div>
			
		</div>

		<button id = "center_table_controller">View/hide table</button>

		<div class = "center_table">
		<div class="bike_table">
			
			<table>
					<tr>
						<th>id</th>
						<th>username</th>
						<th>password</th>
						<th>center_name</th>
						<th>center_address</th>
						<th>contact_number</th>
						<th>latitude</th>
						<th>longitude</th>
						<th>operations</th>
					</tr>
					<?php
	
						include "../db_conn.php";

						$sql = "SELECT * FROM ktm_centers";
						$result = $link-> query($sql);

						if($result-> num_rows > 0) {
							while($row = $result-> fetch_assoc()) {
								echo "<tr><td>". $row["id"]."</td><td>".$row["username"]."</td><td>".$row["password"]."</td><td>".$row["center_name"]."</td><td>".$row["center_address"]."</td><td>".$row["contact_number"]."</td><td>".$row["latitude"]."</td><td>".$row["longitude"]."</td><td><a href= 'delete_center.php?d_id=$row[id]' id = 'dlt_link'>Delete</a></td></tr>";
							}
						} else {
							echo "<td colspan = '16' id = 'empty_table'>No records found</td>";
						}
						$link-> close();

					?>
				</table>

		</div>
		</div>
		<div id = "free-space">
			
		</div>

		<script type="text/javascript">
			let btn = document.querySelector('#center_table_controller');
			let table = document.querySelector('.center_table');

			btn.addEventListener('click', () => {
				if(table.style.display != 'none') {
					table.style.display = 'none';
					
				} else {
					table.style.display = 'block';
				}
					
			}) 

		</script>


</body>
</html>

<?php
	
	} else {
		header("Location: login.php");
		exit();
	}

?>