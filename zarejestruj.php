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
    <script src="jquery_min.js"></script>
    <link href="select2_min.css" rel="stylesheet" />
    <script src="select2_min.js"></script>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style.css">
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
     <li><a href="szpital.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
    <?php
    if(isset($_SESSION['pesel'])){
        $pesel = $_SESSION['pesel'];
    }
    if(isset($_SESSION['nazwisko_pacjenta'])){
        $nazwisko = $_SESSION['nazwisko_pacjenta'];
    }
    require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($conn->connect_errno!=0)
	{
		echo "Error: ".$conn->connect_errno;
	}
	else
	{
        $sql = "SELECT * FROM pracownicy WHERE typ_prac = 'lekarz'";
		$result = mysqli_query($conn, $sql);
    }
    ?>
	Brak pacjenta w bazie. 
    <h1>Formularz rejestracji</h1>
<div class="logowanie">
Zarejestruj pacjenta:
    <form action="rejestracja.php" method="post">
        
		PESEL: <br /> <input type="number" name="pesel_p" <?php if(isset($pesel)){ echo 'value="'.$pesel.'"';} ?> required/> <br />
        Imię: <br /> <input type="text" name="imie_p" required/> <br />
        Nazwisko: <br /> <input type="text" name="nazwisko_p" <?php if(isset($nazwisko)){ echo 'value="'.$nazwisko.'"';} ?> required/> <br />
        Data urodzenia: <br /> <input type="date" name="data_p" required/> <br />
        Lekarz prowadzący: <br /> <select name="lek_prow_p">
            <option value="" selected disabled hidden>Wybierz</option>
                    <?php 
                while($row = mysqli_fetch_array($result)){
                echo '<option value="' .$row['imie'].' '.$row['nazwisko'].'">' .$row['imie'].' '.$row['nazwisko'].'</option>';
                }
            $conn->close();
                    ?>
                </select> <br />
        Termin ubezpieczenia: <br /> <input type="date" name="ubezpieczenie_p" required/> <br />
		<input type="submit" value="Zarejestruj" />	
	</form>
    </div>
<?php
	if(isset($_SESSION['ok']))
        echo $_SESSION['ok'];
?>

</body>
</html>