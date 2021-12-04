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
$pr_login = $_POST['login_pr'];
$pr_imie = $_POST['imie_pr'];
$pr_nazwisko = $_POST['nazwisko_pr'];
$pr_typ = $_POST['typ_pr'];
$sql = "UPDATE pracownicy SET login = '".$pr_login."', imie = '".$pr_imie."', nazwisko = '".$pr_nazwisko."', typ_prac = '".$pr_typ."' WHERE id = '".$id."'";

if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Zmodyfikowano pracownika';
            header('Location: uzytkownicy.php');
        }
        else {
            $_SESSION['ok'] = 'Modyfikacja nie powiodło się';
            header('Location: uzytkownicy.php');
        }
		$conn->close();
?>