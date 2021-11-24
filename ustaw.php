<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id']))
	{
		header('Location: index.php');
		exit();
	}	

require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);

$wyb_lek = $_POST['wyb_lek'];
$id = $_GET['id'];
$sql = "UPDATE pacjenci SET lek_prow = '".$wyb_lek."' WHERE id = '".$id."'";

if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Ustawiono lekarza';
            header('Location: szpital.php');
        }
        else {
            $_SESSION['ok'] = 'Ustawianie lekarza nie powiodło się';
            header('Location: szpital.php');
        }
		$polaczenie->close();
?>