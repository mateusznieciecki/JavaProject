<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id']) or $_SESSION['typ_prac'] != 'admin')
	{
		header('Location: index.php');
		exit();
	}	
    if (isset($_SESSION['pass_checker']))
	{
		header('Location: zmiana_hasla.php');
	}
require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);
$id = $_GET['id'];
$icd_e = $_POST['icd_e'];
$opis_icd_e = $_POST['opis_icd_e'];
$sql = "UPDATE rozpoznanie SET icd = '".$icd_e."', opis = '".$opis_icd_e."' WHERE id = '".$id."'";

if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Zmodyfikowano icd';
            header('Location: icd.php');
        }
        else {
            $_SESSION['ok'] = 'Modyfikacja nie powiodło się';
            header('Location: icd.php');
        }
		$conn->close();
?>