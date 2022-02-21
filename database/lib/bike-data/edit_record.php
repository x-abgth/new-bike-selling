<?php

	session_start();
	include "../db_conn.php";
	
	if(isset($_GET['e_id'])) {
		$edit_id = $_GET['e_id'];
		$_SESSION['e_id'] = $edit_id;
		$sql = "SELECT * FROM `bikes` WHERE id = '$edit_id'";
		$data = mysqli_query($link, $sql);
		$row = mysqli_fetch_assoc($data) ;
	} else {
		header("Location: admin_view.php");
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Edit table</title>
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


		<div class="insert_banner">

			<h2 id = "admin_head">KTM DATABASE EDIT SECTION</h2>

			<div class="insert_form">

				
				<form action = "update.php" method = "POST" enctype = "multipart/form-data">

				    <div class="row">
				      
				      <div id="label">
				        <label>Name:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "model_name" value="<?php echo $row['m_name']; ?>" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Colour:</label>
				      </div>

				      <div id="input">
						
						<input type="text" name="color" value="<?php echo $row['m_color']; ?>" required>
				        
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Category:</label>
				      </div>

				      <div id="input">
				        <select id="drop" name="category" required>
						    <option value="" disabled selected>Choose a bike category</option>
						    <option value="Naked Bike" 

						    <?php
						    	if($row['m_category'] == "Naked Bike") {
						    		echo "selected";
						    	}
						    ?>

						    >Naked Bike</option>
						    <option value="Supersport" 

						    <?php
						    	if($row['m_category'] == "Supersport") {
						    		echo "selected";
						    	}
						    ?>

						    >Supersport</option>
						    <option value="Travel" 

						    <?php
						    	if($row['m_category'] == "Travel") {
						    		echo "selected";
						    	}
						    ?>

						    >Travel</option>
						 </select>
				      </div>

				    </div>

				    <div class="insert_form_head">
				    	<label id="cat">KTM Specification</label>
				    </div>
				    
				    <div class="row">
				      
				      <div id="label">
				        <label>Mileage:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "mileage" placeholder="eg: 38.12 kmpl" value = "<?php echo $row['m_mileage']; ?>" required>
				    </div>

				    </div>
				       <div class="row">
				      
				      <div id="label">
				        <label>Displacement:</label>
				      </div>

				      <div id ="input">
				        <input type = "text" name = "displacement" placeholder="eg: 199.5 cc" value = "<?php echo $row['m_displacement']; ?>" required>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Engine-Type:</label>
				      </div>

				      <div id="input">
				          <select id="drop" name="engine">
				          	<option value="" disabled selected>Select an engine type</option>
						    <option value="Single Cylinder, 4 Valve, Liquid Cooled, FI, DOHC"

						    <?php
						    	if($row['m_engine'] == "Single Cylinder, 4 Valve, Liquid Cooled, FI, DOHC") {
						    		echo "selected";
						    	}
						    ?>

						    >Single Cylinder, 4 Valve, Liquid Cooled, FI, DOHC</option>
						    <option value="Single Cylinder, 4 Stroke, 4 V DOHC Engine" 

						    <?php
						    	if($row['m_engine'] == "Single Cylinder, 4 Stroke, 4 V DOHC Engine") {
						    		echo "selected";
						    	}
						    ?>
						    	
						    >Single Cylinder, 4 Stroke, 4 V DOHC Engine</option>
						  </select>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>No. of Cylinders:</label>
				      </div>

				      <div id="input">
				        <input type = "number" name = "cylinders" placeholder="eg: 1" value = "<?php echo $row['m_cylinders']; ?>" required>
				      </div>

				    </div>
				     <div class="row">
				      
				      <div id="label">
				        <label>Max Power:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "power" placeholder="eg: 25 hp" value = "<?php echo $row['m_power']; ?>" required>
				      </div>

				    </div>
				     <div class="row">
				      
				      <div id="label">
				        <label>Max Torque:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "torque" placeholder="eg: 19.5 Nm" value="<?php echo $row['m_torque']; ?>" required>
				      </div>

				    </div>
				     <div class="row">
				      
				      <div id="label">
				        <label>Fuel Capacity:</label>
				      </div>

				      <div id="input">
				        <input type = "text" name = "fuel_tank" placeholder="eg: 13.5 L" value="<?php echo $row['m_fuel_tank']; ?>" required>
				      </div>

				    </div>

				    <div class="insert_form_head">
				    	<label id="cat">KTM Features</label>
				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>ABS:</label>
				      </div>

				      <div id="input">

				      	<label class="radio">
				        <input type = "radio" name = "abs" value="Single Channel"

				        <?php
				        	if($row['m_abs'] == "Single Channel") {
				        		echo "checked";
				        	}
				        ?>

				        >Single Channel
				    	</label>

				    	<label class="radio">
				        <input type = "radio" name = "abs" value="Dual Channel" 

				        <?php
				        	if($row['m_abs'] == "Dual Channel") {
				        		echo "checked";
				        	}
				        ?>

				        >Dual Channel
				      	</label>
				      </div>

				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Key Features:</label>
				      </div>

				      <div id="input">
				        <textarea cols="50" rows="10" name="key_features" placeholder="eg: Quick Shifter: Yes"><?php echo $row['m_key_features']; ?></textarea>
				      </div>

				    </div>

				    <div class="insert_form_head">
				    	<label id="cat">Image & Price</label>
				    </div>

				    <div class="row">
				      
				      <div id="label">
				        <label>Image:<span id="img_lmt"><br>( *the file size should not exceed 1mb )</span></label>
				      </div>

				      <div id="input">
				       
				        <input type = "file" name = "bike_img_A" id="bike_img_A" multiple required>
				        <div class="image_preview" id="img_prev_A">
				        	<img src="" alt="Unsupported file format" class="preview_img">
				        	<span class="preview_text">Image Preview</span>
				        </div>

				        <input type = "file" name = "bike_img_B" id="bike_img_B" multiple required>
				        <div class="image_preview" id="img_prev_B">
				        	<img src="" alt="Unsupported file format" class="preview_img">
				        	<span class="preview_text">Image Preview</span>
				        </div>

				        <input type = "file" name = "bike_img_C" id="bike_img_C" multiple required>
				        <div class="image_preview" id="img_prev_C">
				        	<img src="" alt="Unsupported file format" class="preview_img">
				        	<span class="preview_text">Image Preview</span>
				        </div>
				        
				      </div> 

				    </div>

				     <div class="row">
				      
				      <div id="label">
				        <label>Ex-Showroom Price:</label>
				      </div>

				      <div id="input">
				      	<div class="flex">
				      	<span id = "ruppee">&#8377;</span>
				        <input type = "text" name = "price" placeholder="eg: &#8377;1,80,000" value="<?php echo $row['m_price']; ?>" required>
				         </div>
				      </div>

				    </div>



				    <div class="update_row_bt">
				      <input type="submit" name="cancel_bt" value = "CANCEL" onclick="location.href= 'admin_view.php';">

				      <input type="submit" name="update_bt" value = "UPDATE RECORD">
				    </div>
  				</form>
			</div>
			
		</div>
		
	</div>

	<script>
		const bike_img_A = document.getElementById("bike_img_A");
		const previewContainer_A = document.getElementById("img_prev_A");
		const previewImage_A = previewContainer_A.querySelector(".preview_img");
		const previewText_A = previewContainer_A.querySelector(".preview_text");

		const bike_img_B = document.getElementById("bike_img_B");
		const previewContainer_B = document.getElementById("img_prev_B");
		const previewImage_B = previewContainer_B.querySelector(".preview_img");
		const previewText_B = previewContainer_B.querySelector(".preview_text");


		const bike_img_C = document.getElementById("bike_img_C");
		const previewContainer_C = document.getElementById("img_prev_C");
		const previewImage_C = previewContainer_C.querySelector(".preview_img");
		const previewText_C = previewContainer_C.querySelector(".preview_text");



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

		bike_img_B.addEventListener("change", function() {
			const file = this.files[0];

			if(file) {
				const reader = new FileReader();

				previewText_B.style.display = "none";
				previewImage_B.style.display = "block";

				reader.addEventListener("load", function() {
					previewImage_B.setAttribute("src", this.result);
				});

				reader.readAsDataURL(file);
			} else{
				previewText_B.style.display = null;
				previewImage_B.style.display = null;
				previewImage_B.setAttribute("src", "");
			}
		});

		bike_img_C.addEventListener("change", function() {
			const file = this.files[0];

			if(file) {
				const reader = new FileReader();

				previewText_C.style.display = "none";
				previewImage_C.style.display = "block";

				reader.addEventListener("load", function() {
					previewImage_C.setAttribute("src", this.result);
				});

				reader.readAsDataURL(file);
			} else{
				previewText_C.style.display = null;
				previewImage_C.style.display = null;
				previewImage_C.setAttribute("src", "");
			}
		});
	</script>


</body>
</html>



