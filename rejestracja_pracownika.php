<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']) || $_SESSION['typ_prac'] != 'admin')
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
	
	if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
        $pr_login = $_POST['login_pr'];
        $pr_imie = $_POST['imie_pr'];
        $pr_nazwisko = $_POST['nazwisko_pr'];
		$pr_typ = $_POST['typ_pr'];
		$sql = "INSERT INTO pracownicy (id, login, haslo, imie, nazwisko, typ_prac) VALUES (NULL, '".$pr_login."', '".$pr_login."', '".$pr_imie."', '".$pr_nazwisko."', '".$pr_typ."')";
		if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Zarejestrowano nowego pacjenta';
            header('Location: uzytkownicy.php');
        }
        else {
            $_SESSION['ok'] = 'Rejestracja nie powiodła się';
            header('Location: zarejestruj.php');
        }
		$polaczenie->close();
	}
	
?>