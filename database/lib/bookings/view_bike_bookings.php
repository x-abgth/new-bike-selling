<?php

	session_start();
	if(isset($_SESSION['a_id']) && isset($_SESSION['username'])) {

?>

<!DOCTYPE html>
<html>
<head>
	<title>View bike bookings</title>
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

			<h2 id = "admin_head">KTM BIKE BOOKINGS</h2>

			<div class="bike_table">

				<table>
					<tr>
						<th>booking_id</th>
						<th>u_id</th>
						<th>center_id</th>
						<th>u_name</th>
						<th>u_address</th>
						<th>bike_model</th>
						<th>bike_year</th>
						<th>bike_color</th>
						<th>booked_date</th>
						<th>center_name</th>
						<th>action</th>

					</tr>
					<?php
	
						include "../db_conn.php";

						$sql = "SELECT * FROM bike_bookings";
						$result = $link-> query($sql);

						if($result-> num_rows > 0) {
							while($row = $result-> fetch_assoc()) {
								echo "<tr><td>". $row["booking_id"]."</td><td>".$row["u_id"]."</td><td>".$row["center_id"]."</td><td>".$row["u_name"]."</td><td>".$row["u_address"]."</td><td>".$row["bike_model"]."</td><td>".$row["bike_year"]."</td><td>".$row["bike_color"]."</td><td>".$row["m_power"]."</td><td>".$row["m_torque"]."</td><td>".$row["booked_date"]."</td><td>".$row["center_name"]."</td><td>".$row["action"]."</td><td></tr>";
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

