<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
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
    <script src="jquery_min.js"></script>
    <link href="select2_min.css" rel="stylesheet" />
    <script src="select2_min.js"></script>

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
    <div class="tabela_pacjentow">
<?php
    require_once "connect.php";

	$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
        $pesel = $_POST['pesel'];
        $nazwisko = $_POST['nazwisko'];

        $sql = "SELECT * FROM pacjenci WHERE pesel = '".$pesel."' OR nazwisko = '".$nazwisko."'";
        $sql2 = "SELECT * FROM pracownicy WHERE typ_prac = 'lekarz'";
		$result = mysqli_query($polaczenie, $sql);
		$datas = array();
        if (mysqli_num_rows($result) > 0){
            echo "<table><tr><th>PESEL</th><th>Imię</th><th>Nazwisko</th><th>Data urodzenia</th><th>Lekarz prowadzący</th><th>Ustaw lekarza prowadzącego</th><th>Ubezpieczenie</th><th>Usuń</th>";
            while($row = mysqli_fetch_array($result)){
                echo "<tr><td>" . $row['pesel'] . " </td><td> " . $row['imie'] . " </td><td> " . $row['nazwisko'] . " </td><td> " . $row['data_urodzenia'] . " </td><td> " . $row['lek_prow'] . " </td>"
        ?><td><form action="ustaw.php?id=<?php echo $row['id']; ?>" method="post">
                <select name="wyb_lek">
                    <option value="" selected disabled hidden>Wybierz</option>
                    <?php 
                $result2 = mysqli_query($polaczenie, $sql2);
                while($row2 = mysqli_fetch_array($result2)){
                echo '<option value="' .$row2['imie'].' '.$row2['nazwisko'].'">' .$row2['imie'].' '.$row2['nazwisko'].'</option>';
                }
                    ?>
                </select>
                <input type="submit" value="Zatwierdź" class="pacjent_table"/>	
	</form></td>
    <td><?php 
        if ($row['ubezpieczenie'] > date("Y-m-d")){
            echo "Pacjent ubezpieczony";
        }
        else{
            ?> Pacjent nieubezpieczony <form target="_blank" action="oswiadczenie.php?id=<?php echo $row['id']; ?>" method="post">
        <input type="submit" value="Drukuj oświadczenie" /></form> <?php
        }
        ?></td><td><a href="usun.php?id=<?php echo $row['id']; ?>"><i class="material-icons">person_remove</i></a></td>
    <?php
            echo "</tr>";
            }
        echo "</table>";
        }
        else{
            $polaczenie->close();
            if(isset($pesel)){
                $_SESSION['pesel'] = $pesel;
            }
            if(isset($nazwisko)){
                $_SESSION['nazwisko_pacjenta'] = $nazwisko;
            }
            header('Location: zarejestruj.php');
            $_SESSION['ok'] = '';
        }
        $polaczenie->close();
	}
	
?>
    </div>
</body>
</html>
