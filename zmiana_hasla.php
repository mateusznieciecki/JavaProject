<?php

	session_start();
	
	if (!isset($_SESSION['pass_checker']))
	{
		header('Location: index.php');
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
	<form action="zmien_haslo.php" method="post">
        HASŁO MUSI ZOSTAĆ ZMIENIONE <br><br>
        NOWE HASŁO <br /> <input type="password" name="haslo" required/>
		<input type="submit" value="Potwierdź" />
	
	</form>
</div>	

</body>
</html>