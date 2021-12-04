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
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style_test.css">
</head>

<body>
	
 <ul id="menu">
     <li id="powitanie"><?php
	echo "Użytkownik: ".$_SESSION['imie']. ' '.$_SESSION['nazwisko'];
?></li>
     <li><a href="admin.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="uzytkownicy.php">Użytkownicy</a></li>
     <li><a href="icd.php">ICD</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
    <h2>Panel administratora</h2>
</body>
</html>