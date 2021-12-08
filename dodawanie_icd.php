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
	}
	require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($conn->connect_errno!=0)
	{
		echo "Error: ".$conn->connect_errno;
	}
	else
	{
        $icd = $_POST['icd'];
        $opis_icd = $_POST['opis_icd'];
		$sql = "INSERT INTO rozpoznanie (id, icd, opis) VALUES (NULL, '".$icd."', '".$opis_icd."')";
		if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Dodano icd';
            header('Location: icd.php');
        }
        else {
            $_SESSION['ok'] = 'Dodawanie nie powiodło się';
            header('Location: icd.php');
        }
		$conn->close();
	}
	
?>