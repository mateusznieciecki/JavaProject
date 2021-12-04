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
$sql = "SELECT * FROM pracownicy WHERE id = '".$id."'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result);
$sql2 = "UPDATE pracownicy SET haslo = '".$row['login']."' WHERE id = '".$id."'";
if ($conn->query($sql2) === TRUE) {
            $_SESSION['ok'] = 'Zmieniono hasło pracownika';
            header('Location: uzytkownicy.php');
        }
        else {
            $_SESSION['ok'] = 'Zmiana nie powiodła się';
            header('Location: uzytkownicy.php');
        }
		$polaczenie->close();
?>