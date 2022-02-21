<?php

	session_start();
	if(isset($_SESSION['id']) && isset($_SESSION['username'])) {

?> 


<!DOCTYPE html>
<html>
<head>
	<title>Community Posts</title>
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

			<h2 id = "admin_head">ADD COMMUNITY POSTS</h2>

			<div class="a_form">

				
				<form action = "add_postsDb.php" method = "POST" enctype = "multipart/form-data">

				    <div class="a_row">
				      
				      <div id="label">
				        <label>Title:</label>
				      </div>

				      <div id="input">
				        <textarea cols="50" rows="5" name="post_title"></textarea>
				      </div>

				    </div>

				    <div class="a_row">
				   		<input type = "file" name = "comm_post" id="comm_post" multiple required>
				        <div class="image_preview" id="img_prev_A">
				        	<img src="" alt="Unsupported file format" class="preview_img">
				        	<span class="preview_text">Image Preview</span>
				        </div>
				    </div>
				    <div class="a_row">
				      <input type="submit" name="add_post" value = "ADD">
				    </div>
  				</form>
			</div>
			
		</div>
	</div>
		<script type="text/javascript">
			const bike_img_A = document.getElementById("comm_post");
			const previewContainer_A = document.getElementById("img_prev_A");
			const previewImage_A = previewContainer_A.querySelector(".preview_img");
			const previewText_A = previewContainer_A.querySelector(".preview_text");

			bike_img_A.addEventListener("change", function() {
				const file = this.files[0];

				if(file) {
					const reader = new FileReader();

					previewText_A.style.display = "none";
					previewImage_A.style.display = "block";

					reader.addEventListener("load", function() {
						previewImage_A.setAttribute("src", this.result);
					});

					reader.readAsDataURL(file);
				} else{
					previewText_A.style.display = null;
					previewImage_A.style.display = null;
					previewImage_A.setAttribute("src", "");
				}
			});

		</script>

</body>
</html>

<?php
	
	} else {
		header("Location: login.php");
		exit();
	}

?>