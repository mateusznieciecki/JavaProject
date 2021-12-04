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
    <script src="jquery_min.js"></script>
    <link href="select2_min.css" rel="stylesheet" />
    <script src="select2_min.js"></script>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style_test.css">
</head>

<body>
<script>
        $(document).ready(function () {
            $("select").select2();
        });
    </script>
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
    <h2>Zarejestruj pracownika</h2>
    <form action="rejestracja_pracownika.php" method="post">
        
		Login:  <input type="text" name="login_pr" required/> <br />
        Imię: <input type="text" name="imie_pr" required/> <br />
        Nazwisko: <input type="text" name="nazwisko_pr"  required/> <br />
        Typ pracownika: <select name="typ_pr" required>
        <option value="" selected disabled hidden>Wybierz</option>
        <option value="rejestrator">Rejestrator</option>
        <option value="lekarz">Lekarz</option>
        <option value="admin">Admin</option>
        </select> <br />
		<input type="submit" value="Zarejestruj" />	
	</form>
    </div>
</body>
</html>