<?php

	session_start();
	if(isset($_SESSION['a_id']) && isset($_SESSION['username'])) {

?>

<!DOCTYPE html>
<html>
<head>
	<title>Add to database</title>
	<style>
		<?php include "../style.css" ?>
	</style>
</head>
<body>

	<div class="view_wrapper">

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


		<div class="view_banner">

			<h2 id = "admin_head">KTM BIKE TABLE</h2>
			<div class="bike_table">
				<a href="admin_insert.php" id = "new_record">Add new record</a>

				<table>
					<tr>
						<th>id</th>
						<th>m_name</th>
						<th>m_color</th>
						<th>m_category</th>
						<th>m_mileage</th>
						<th>m_displacement</th>
						<th>m_engine</th>
						<th>m_cylinders</th>
						<th>m_power</th>
						<th>m_torque</th>
						<th>m_fuel_tank</th>
						<th>m_abs</th>
						<th>m_key_features</th>
						<th>m_image_a</th>
						<th>m_image_b</th>
						<th>m_image_c</th>
						<th>m_price</th>
						<th>operations</th>

					</tr>
					<?php
	
						include "../db_conn.php";

						$sql = "SELECT * FROM bikes";
						$result = $link-> query($sql);

						if($result-> num_rows > 0) {
							while($row = $result-> fetch_assoc()) {
								echo "<tr><td>". $row["id"]."</td><td>".$row["m_name"]."</td><td>".$row["m_color"]."</td><td>".$row["m_category"]."</td><td>".$row["m_mileage"]."</td><td>".$row["m_displacement"]."</td><td>".$row["m_engine"]."</td><td>".$row["m_cylinders"]."</td><td>".$row["m_power"]."</td><td>".$row["m_torque"]."</td><td>".$row["m_fuel_tank"]."</td><td>".$row["m_abs"]."</td><td>".$row["m_key_features"]."</td><td>".$row["m_image_a"]."</td><td>".$row["m_image_b"]."</td><td>".$row["m_image_c"]."</td><td>".$row["m_price"]."</td><td><a href= 'edit_record.php?e_id=$row[id]' id = 'edit_link'>Edit</a><a href= 'delete_record.php?d_id=$row[id]' id = 'dlt_link'>Delete</a></td></tr>";
							}
						} else {
							echo "<td colspan = '16' id = 'empty_table'>No records found</td>";
						}
						$link-> close();

					?>
				</table>
			
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

