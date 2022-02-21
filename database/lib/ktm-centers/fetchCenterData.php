 <?php
include '../db_conn.php';

$sql = "SELECT `id`, `center_name`, `center_address`, `contact_number`, `latitude`, `longitude` FROM ktm_centers";


$result = $link->query($sql);

if ($result->num_rows >0) {
 
 
 while($row[] = $result->fetch_assoc()) {
 
 $tem = $row;
 
 $json = json_encode($tem);
 
 
 }
 
} else {
 echo "No Results Found.";
}
 echo $json;
$link->close();
?>