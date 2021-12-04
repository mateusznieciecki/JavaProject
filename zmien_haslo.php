<?php
	session_start();
	
	if (!isset($_SESSION['pass_checker']))
	{
		header('Location: index.php');
	}	

require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);
$haslo = $_POST['haslo'];
$sql = "UPDATE pracownicy SET haslo = '".$haslo."' WHERE id = '".$_SESSION['id']."'";

if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Zmodyfikowano pracownika';
            unset($_SESSION['pass_checker']);
            if($_SESSION['typ_prac'] == 'rejestrator'){
                header('Location: szpital.php');
            }
            elseif($_SESSION['typ_prac'] == 'lekarz'){
                header('Location: panel.php');
            }
            elseif($_SESSION['typ_prac'] == 'admin'){
                header('Location: admin.php');
            }
        }
        else {
            $_SESSION['ok'] = 'Modyfikacja nie powiodło się';
            header('Location: index.php');
        }
		$conn->close();
?>