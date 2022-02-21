<?php

	session_start();
	if(isset($_SESSION['id']) && isset($_SESSION['username'])) {

?> 


<!DOCTYPE html>
<html>
<head>
	<title>Community Members</title>
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


		<div class="a_banner">

			<h2 id = "admin_head">ADD COMMUNITY MEMBERS</h2>

			<div class="insert_form">

				
				<form action = "add_members.php" method = "POST">

				    <div class="row">
				      
				      <div id="label">
				        <label>Name:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "name" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Phone Number: </label>
				      </div>

				      <div id="input">
						<input type = "text" name = "ph_no" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>E-Mail Id: </label>
				      </div>

				      <div id="input">
						 <input type="text" name="mail" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Registration No:</label>
				      </div>

				      <div id="input">
						 <input type="text" name="reg_no" placeholder="XX-XX-XX-XXXX" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Bike Model: </label>
				      </div>

				      <div id="input">
						 <input type="text" name="bike_model" required>
				      </div>

				    </div>

				    <div class="row">
				      <input type="submit" name="add" value = "ADD USER">
				    </div>
  				</form>
			</div>
			
		</div>

		<button id = "center_table_controller">View/hide table</button>

		<div class = "center_table">
		<div class="bike_table">
			
			<table>
					<tr>
						<th>mem_id</th>
						<th>username</th>
						<th>u_phone</th>
						<th>u_mail</th>
						<th>reg_no</th>
						<th>bike_model</th>
						<th>operations</th>
					</tr>
					<?php
	
						include "../db_conn.php";

						$sql = "SELECT * FROM comm_members";
						$result = $link-> query($sql);

						if($result-> num_rows > 0) {
							while($row = $result-> fetch_assoc()) {
								echo "<tr><td>". $row["mem_id"]."</td><td>".$row["username"]."</td><td>".$row["u_phone"]."</td><td>".$row["u_mail"]."</td><td>".$row["reg_no"]."</td><td>".$row["bike_model"]."</td><td><a href= 'delete_members.php?d_id=$row[mem_id]' id = 'dlt_link'>Delete</a></td></tr>";
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