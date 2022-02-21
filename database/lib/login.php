<!DOCTYPE html>
<html>
<head>
	<title>Login</title>

	<script type="text/javascript">
		function preventBack() {
			window.history.forward();
		}
		setTimeout("preventBack()",0);
		window.onunload = function() {
			null
		};
	</script>

	<style>
		<?php include "style.css" ?>
	</style>
</head>
<body>

	<div class = "wrapper">

		<div id="ktmlogobg">
			<img src="../assets/ktm_logo.png" id="ktmlogo">
		</div>


		<div class="banner">
			
			<div class = "login_form">

				<div class = "btn-box">
					<div id ="bg-btn"></div>
					<button type = "button" class="toggle-btn" onclick="showroom()">Staff</button>
					<button type = "button" class="toggle-btn" onclick="admin()">Admin</button>
				</div>
				
				<div class="log-sections">
					<div id = "sh-login">
						<form class = "input-group" action="s_login.php" method="post">

							<img src="../assets/user2.jpg" alt="user logo" id="user">
							<h2>Staff</h2>
							
							<?php if(isset($_GET['error'])) {?>
								<p id = "login_error"><?php echo $_GET['error'];?></p>
							<?php }?>

							<div class="input-1">
								<img src="../assets/person.png" alt="user" id ="user_icon">	
								<input type="text" name="loginUname" placeholder="Enter your username here">
							</div>
							<br/>
							
							<div class="input-2">
								<img src="../assets/pass.png" alt="password" id ="pass_icon">	
								<input type="password" name="loginPass" placeholder="Enter your password here">
							</div>
							<br/>
					
							<input type="submit" name="loginBt" value="LOGIN">

						</form>
					</div>
					
					<div id="admin-login">
						<form class = "input-group" action="a_login.php" method="post">

						<img src="../assets/user2.jpg" alt="user logo" id="user">
						<h2>Admin</h2>
						
						<?php if(isset($_GET['error'])) {?>
							<p id = "login_error"><?php echo $_GET['error'];?></p>
						<?php }?>

						<div class="input-1">
								<img src="../assets/person.png" alt="user" id ="user_icon">	
								<input type="text" name="loginUname" placeholder="Enter your username here">
							</div>
							<br/>
							
							<div class="input-2">
								<img src="../assets/pass.png" alt="password" id ="pass_icon">	
								<input type="password" name="loginPass" placeholder="Enter your password here">
							</div>
							<br/>
				
						<input type="submit" name="loginBt" value="LOGIN">

					</form>

					</div>
					
				</div>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var x = document.getElementById("sh-login");
		var y = document.getElementById("admin-login");
		var z = document.getElementById("bg-btn");

		function admin() {
			x.style.marginLeft = "-300px";
			y.style.marginLeft = "110px";
			z.style.left = "150px";
		}
		function showroom() {
			x.style.marginLeft = "60px";
			y.style.marginLeft = "100px";
			z.style.left = "0px";
		}

	</script>
</body>
</html>