<?php

	session_start();
	if(isset($_SESSION['id']) && isset($_SESSION['username'])) {

?> 

<!DOCTYPE html>
<html>
	<head>
		<title>Bookings</title>

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
					<li><a href="bookings_page.php">Bookings</a></li>
					<li><a href="sh_home.php">Add Services</a></li>
					<li><a href="../navigation-bar/logout.php">Logout</a></li>
				</ul>
			</nav>
		</header>

		<div class="b-hero">
			<div class="b-btn-box">
				<ul class="tabs">
					<li data-tab-target="#content-1" class="active tab">Bike</li>
					<li data-tab-target="#content-2" class="tab">Service</li>
					<li data-tab-target="#content-3" class="tab">Test-Drive</li>
				</ul>
			</div>
			<div id="tab-content">
				<div id="content-1" class="active" data-tab-content>
					<h2>Bike Bookings</h2>
					<p>
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
												echo "<tr><td>". $row["booking_id"]."</td><td>".$row["u_id"]."</td><td>".$row["center_id"]."</td><td>".$row["u_name"]."</td><td>".$row["u_address"]."</td><td>".$row["bike_model"]."</td><td>".$row["bike_year"]."</td><td>".$row["bike_color"]."</td><td>".$row["booked_date"]."</td><td>".$row["center_name"]."</td><td>".$row["action"]."</td><td><a href= 'edit_record.php?e_id=$row[id]' id = 'edit_link'>Approve</a><a href= 'delete_record.php?d_id=$row[id]' id = 'dlt_link'>Reject</a></td></tr>";
											}
										} else {
											echo "<td colspan = '16' id = 'empty_table'>No records found</td>";
										}
										$link-> close();

									?>
								</table>
						</div>
					</p>
				</div>
				<div id="content-2" data-tab-content>
					<h2>Service Bookings</h2>
					<p>
						<div class="bike_table">
							<table>
									<tr>
										<th>s_booking_id</th>
										<th>u_id</th>
										<th>username</th>
										<th>bike_model</th>
										<th>reg_no</th>
										<th>km_read</th>
										<th>center_id</th>
										<th>center_name</th>
										<th>action</th>
									</tr>
									<?php
					
										include "../db_conn.php";

										$sql = "SELECT * FROM service_bookings";
										$result = $link-> query($sql);

										if($result-> num_rows > 0) {
											while($row = $result-> fetch_assoc()) {
												echo "<tr><td>". $row["s_booking_id"]."</td><td>".$row["u_id"]."</td><td>".$row["username"]."</td><td>".$row["bike_model"]."</td><td>".$row["reg_no"]."</td><td>".$row["km_read"]."</td><td>".$row["center_id"]."</td><td>".$row["center_name"]."</td><td>".$row["action"]."</td><td><a href= 'edit_record.php?e_id=$row[id]' id = 'edit_link'>Approve</a><a href= 'delete_record.php?d_id=$row[id]' id = 'dlt_link'>Reject</a></td></tr>";
											}
										} else {
											echo "<td colspan = '16' id = 'empty_table'>No records found</td>";
										}
										$link-> close();

									?>
								</table>
						</div>
					</p>
				</div>
				<div id="content-3" data-tab-content>
					<h2>Test-Drive Bookings</h2>
					<p>
						<div class="bike_table">
							<table>
									<tr>
										<th>td_id</th>
										<th>u_id</th>
										<th>username</th>
										<th>u_phone</th>
										<th>bike_model</th>
										<th>center_id</th>
										<th>center_name</th>
										<th>action</th>
									</tr>
									<?php
					
										include "../db_conn.php";

										$sql = "SELECT * FROM test_drive_bookings";
										$result = $link-> query($sql);

										if($result-> num_rows > 0) {
											while($row = $result-> fetch_assoc()) {
												echo "<tr><td>". $row["td_id"]."</td><td>".$row["u_id"]."</td><td>".$row["username"]."</td><td>".$row["u_phone"]."</td><td>".$row["bike_model"]."</td><td>".$row["center_id"]."</td><td>".$row["center_name"]."</td><td>".$row["action"]."</td><td><a href= 'edit_record.php?e_id=$row[id]' id = 'edit_link'>Approve</a><a href= 'delete_record.php?d_id=$row[id]' id = 'dlt_link'>Reject</a></td></tr>";
											}
										} else {
											echo "<td colspan = '16' id = 'empty_table'>No records found</td>";
										}
										$link-> close();

									?>
								</table>
						</div>
					</p>
				</div>
			</div>
			
		</div>

	</div>
	<script type="text/javascript">
		const tabs = document.querySelectorAll('[data-tab-target]')
		const tabContents = document.querySelectorAll('[data-tab-content')
	
		tabs.forEach(tab =>{
			tab.addEventListener('click', () => {
				const target = document.querySelector(tab.dataset.tabTarget)
				tabContents.forEach(tabContent => {
					tabContent.classList.remove('active')
				})
				tabs.forEach(tab => {
					tab.classList.remove('active')
				})
				tab.classList.add('active')
				target.classList.add('active')
			})
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