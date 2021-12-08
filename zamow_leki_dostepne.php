<?php
require_once "connect.php";

$conn = @new mysqli($host, $db_user, $db_password, $db_name);
$nazwa = $_POST['le'];
$nazwa2 = $_POST['il'];
    $sql=mysqli_query($conn, "UPDATE leki SET ilosc=(ilosc-".$nazwa2.") WHERE nazwa='".$nazwa."'");
?>