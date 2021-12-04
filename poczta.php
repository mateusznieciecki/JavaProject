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
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
	
 <ul id="menu">
     <li id="powitanie"><?php
	echo "Użytkownik: ".$_SESSION['imie']. ' '.$_SESSION['nazwisko'];
?></li>
     <li><a <?php if($_SESSION['typ_prac'] == 'rejestrator'){
			echo 'href="szpital.php"';
		}
		elseif($_SESSION['typ_prac'] == 'lekarz'){
			echo 'href="panel.php"';
        }
        elseif($_SESSION['typ_prac'] == 'admin'){
            echo 'href="admin.php"';
		}?>>Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <?php if($_SESSION['typ_prac'] == 'admin'){
         echo '<li><a href="uzytkownicy.php">Użytkownicy</a></li>';
         echo '<li><a href="icd.php">ICD</a></li>';
     }
     ?>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
 <div class="vertical-menu">
  <a href="poczta.php">Skrzynka</a>
  <a href="wyslij.php">Wyślij</a>
  <a href="wyslane.php">Wysłane</a>
</div> 
    <h2>Skrzynka odbiorcza</h2>
<?php
    $login = $_SESSION['login'];
    require_once "connect.php";
    $conn = @new mysqli($host, $db_user, $db_password, $db_name);
    $sql = "SELECT * FROM wiadomosci WHERE do = '" .$login."' ORDER BY id_wiadomosci DESC";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
        if ($row['status'] == 0){    
    ?>
    <b><a href="przeczytaj.php?id_wiadomosci=<?php echo $row['id_wiadomosci']; ?>">Wiadomość od: <?php echo $row['od']; ?> Temat: <?php echo $row['temat']; ?></a></b><br>
    <?php
        }
        else{
            ?>
            <a href="przeczytaj.php?id_wiadomosci=<?php echo $row['id_wiadomosci']; ?>">Wiadomość od: <?php echo $row['od']; ?> Temat: <?php echo $row['temat']; ?></a><br>
    <?php
        }
        }
    }
    ?>
</body>
</html>