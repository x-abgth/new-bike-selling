 <?php
include '../db_conn.php';

$sql = "SELECT * FROM bikes";

$result = $link->query($sql);

if ($result->num_rows >0) {
 
 
	 while($row[] = $result->fetch_assoc()) {
	 
	 	$tem = $row;
	 
	 	$json = json_encode($tem);
	 	
	 }
 
} else {
 	
}
	 echo $json;
	$link->close();
?>