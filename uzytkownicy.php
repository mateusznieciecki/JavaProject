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
	
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style_test.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
<?php
    require_once "connect.php";

	$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
        $sql = "SELECT * FROM pracownicy";
		$result = mysqli_query($polaczenie, $sql);
        if (mysqli_num_rows($result) > 0){
            echo '<table><tr><th>Login</th><th>Imię</th><th>Nazwisko</th><th>Typ pracownika<th>Usuń</th><th>Edytuj</th><th>Zresetuj hasło</th>';
            while($row = mysqli_fetch_array($result)){
                echo '<tr><td>' . $row['login'] .  '</td><td>' . $row['imie'] . '</td><td>' . $row['nazwisko'] . '</td><td>' . $row['typ_prac'] . '</td>' 
                ?>
                <td><a href="usun_pracownika.php?id=<?php echo $row['id']; ?>"><i class="material-icons">person_remove</i></a></td>
                <td><a href="edytuj_pracownika.php?id=<?php echo $row['id']; ?>"><i class="material-icons">edit</i></a></td>
                <td><a href="resetuj_haslo.php?id=<?php echo $row['id']; ?>"><i class="material-icons">refresh</i></a></td>
                <?php
                        echo "</tr>";
                        }
                    echo "</table>";
        }
    }
                    ?>
                    <br>
<a class="pacjent_link" href="dodaj_pracownika.php"><i class="material-icons">person_add_alt</i></a>
</body>
</html>