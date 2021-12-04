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
        exit();
    }

require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);

$id = $_GET['id'];
$sql = "DELETE FROM pracownicy WHERE id = '".$id."'";

if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Usunięto pracownika';
            header('Location: uzytkownicy.php');
        }
        else {
            $_SESSION['ok'] = 'Usuwanie nie powiodło się';
            header('Location: uzytkownicy.php');
        }
		$polaczenie->close();
?>