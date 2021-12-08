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
    <script src="jquery_min.js"></script>
    <link href="select2_min.css" rel="stylesheet" />
    <script src="select2_min.js"></script>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style_test.css">
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
     <li><a href="admin.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="uzytkownicy.php">Użytkownicy</a></li>
     <li><a href="icd.php">ICD</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul>
<h3>Dodaj leki</h3>
<form action="dodaj_leki_wyk.php" method="post">
<input type="text" name="lek" placeholder='Nazwa leku' required/> <br />
<input type="number" name="ilosc" placeholder='Ilość' required/> <br />
<input type="submit" value="Dodaj" /><br>
    </form>
<form action="dodaj_leki.php" method="post">
<input type="text" name="szukane" placeholder='Treść wyszukiwania...' required/> <br />
<input type="submit" value="Szukaj" /><br>
    </form>
    <h3>Lista leków</h3>
<?php
    if(isset($_POST['szukane'])){
        $szukane = $_POST['szukane'];
    }
    
    require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($conn->connect_errno!=0)
	{
		echo "Error: ".$conn->connect_errno;
	}
	else
	{
        if(isset($_GET['sort'])){
            if($_GET['sort']==1){
                $sql = "SELECT * FROM leki ORDER BY nazwa ASC";
            }
            elseif($_GET['sort']==2){
                $sql = "SELECT * FROM leki ORDER BY nazwa DESC";
            }
            elseif($_GET['sort']==3){
                $sql = "SELECT * FROM leki ORDER BY ilosc ASC";
            }
            elseif($_GET['sort']==4){
                $sql = "SELECT * FROM leki ORDER BY ilosc DESC";
            }
        }
        elseif(isset($_POST['szukane'])){
            $sql = "SELECT * FROM leki WHERE nazwa LIKE '%".$szukane."%' OR ilosc LIKE '%".$szukane."%'";
            $_SESSION['pomocnicza'] = 1;
        }
        else{
            $sql = "SELECT * FROM leki";
        }
		$result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0){
            echo '<table><tr><th>Nazwa<a href="dodaj_leki.php?sort=1"><i class="material-icons">keyboard_arrow_up</i></a><a href="dodaj_leki.php?sort=2"><i class="material-icons">keyboard_arrow_down</i></a></th><th>ilosc<a href="dodaj_leki.php?sort=3"><i class="material-icons">keyboard_arrow_up</i></a><a href="dodaj_leki.php?sort=4"><i class="material-icons">keyboard_arrow_down</i></a></th></tr>';
            while($row = mysqli_fetch_array($result)){
                echo '<tr><td>' . $row['nazwa'] .  '</td><td>' . $row['ilosc'] . '</td></tr>';
            }
        echo '</table>';
        }
    }
    ?>
    <h3>Zamówienia leków</h3>
    <?php
        $sql2 = "SELECT * FROM zamowienia_lekow WHERE status_zamowienia=0";
        $result2 = mysqli_query($conn, $sql2);
        if (mysqli_num_rows($result2) > 0){
            echo '<table><tr><th>Nazwa</th><th>Ilość leku</th><th>Lekarz zamawiający</th></tr>';
            while($row2 = mysqli_fetch_array($result2)){
                echo '<tr><td>' . $row2['lek'] .  '</td><td>' . $row2['ilosc_leku'] . '</td><td>' . $row2['lekarz'] . '</td></tr>';
            }
        echo '</table>';
        }
        else{
            echo "Brak zamówień";
        }
    ?>
</body>
</html>