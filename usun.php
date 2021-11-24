<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id']))
	{
		header('Location: index.php');
		exit();
	}	

require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);

$id = $_GET['id'];
$sql = "DELETE FROM pacjenci WHERE id = '".$id."'";

if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Usunięto pacjenta';
            header('Location: szpital.php');
        }
        else {
            $_SESSION['ok'] = 'Usuwanie nie powiodło się';
            header('Location: szpital.php');
        }
		$polaczenie->close();
?>