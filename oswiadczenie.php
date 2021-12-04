<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id']))
	{
		header('Location: index.php');
		exit();
	}
	if (isset($_SESSION['pass_checker']))
	{
		header('Location: zmiana_hasla.php');
        exit();
    }
require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);
$id = $_GET['id'];
$sql = "SELECT * FROM pacjenci WHERE id = '".$id."'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result);
    
echo "Oświadczam, że posiadam ubezpieczenie " . $row['imie'] . " " . $row['nazwisko'];
?>