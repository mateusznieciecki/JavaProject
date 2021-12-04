<?php

	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true) && (!isset($_SESSION['pass_checker'])))
	{
		if($_SESSION['typ_prac'] == 'rejestrator'){
			header('Location: szpital.php');
		}
		elseif($_SESSION['typ_prac'] == 'lekarz'){
			header('Location: panel.php');
		}
		elseif($_SESSION['typ_prac'] == 'admin'){
			header('Location: admin.php');
		}
		exit();
	}
	if(isset($_SESSION['pass_checker']))
	{
		unset($_SESSION['pass_checker']);
	}
?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
    <link href="style_test.css" rel="stylesheet" />
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Szpital</title>
</head>

<body>
    <div class="logo_holder">
        <img id="logo" src="images/logo_szpital.png">
    </div>
    <div class="logowanie">
	<form action="zaloguj.php" method="post">
        
		LOGIN <br /> <input type="text" name="login" /> <br />
		HASŁO <br /> <input type="password" name="haslo" /> <br /><br />
		<input type="submit" value="Zaloguj się" />
	
	</form>
</div>	
<?php
	if(isset($_SESSION['blad']))
        echo $_SESSION['blad'];
?>

</body>
</html>