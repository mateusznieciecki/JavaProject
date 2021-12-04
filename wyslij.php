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
<?php
    $login = $_SESSION['login'];
    require_once "connect.php";
    $conn = @new mysqli($host, $db_user, $db_password, $db_name);
    $sql = "SELECT * FROM pracownicy";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);
    
    ?>
<div class="logowanie">
    <form action="wyslij_wiadomosc.php?id=<?php echo $row['id']; ?>" method="post">
                <select name="wyb_lek" required>
                    <option value="" selected disabled hidden>Odbiorca</option>
                    <?php 
                $result = mysqli_query($conn, $sql);
                while($row2 = mysqli_fetch_array($result)){
                echo '<option value="' .$row2['login'].'">' .$row2['imie'].' '.$row2['nazwisko'].'</option>';
                }
                    ?>
                </select><br>
        <input type="text" name="temat" placeholder="Temat" required /><br>
        <textarea name="tresc" rows="10" cols="50" placeholder="Napisz wiadomość..."></textarea>
<br>
  <input type="submit" value="Wyślij">
    </form>
</div>
<?php
	if(isset($_SESSION['ok']))
        echo $_SESSION['ok'];
    unset($_SESSION['ok']);
?>
</body>
</html>