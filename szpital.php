<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
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
	
 <ul>
     <li id="powitanie"><?php
	echo "Użytkownik: ".$_SESSION['imie']. ' '.$_SESSION['nazwisko'];
?></li>
     <li><a href="szpital.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
    
<div class="contener">
    <div class="logowanie">
    Szukaj pacjenta po numerze PESEL lub nazwisku:
        <form action="szukaj.php" method="post">

            PESEL <br /> <input type="number" name="pesel" /> <br />
            NAZWISKO <br /> <input type="text" name="nazwisko" /> <br />
            <input type="submit" value="Szukaj" />	
        </form>
        </div>
    </div>
<?php
	if(isset($_SESSION['ok']))
        echo $_SESSION['ok'];
    unset($_SESSION['ok']);
?>
</body>
</html>