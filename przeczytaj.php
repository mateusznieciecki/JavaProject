<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id_wiadomosci']))
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
 <div class="vertical-menu">
  <a href="poczta.php">Skrzynka</a>
  <a href="wyslij.php">Wyślij</a>
  <a href="wyslane.php">Wysłane</a>
</div> 
<?php
    $id_w = $_GET['id_wiadomosci'];
    require_once "connect.php";
    $conn = @new mysqli($host, $db_user, $db_password, $db_name);
    $sql = "SELECT * FROM wiadomosci WHERE id_wiadomosci = '" .$id_w."'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);
    
    $sql2 = "UPDATE wiadomosci SET status = 1 WHERE id_wiadomosci = '".$id_w."'";
    $conn->query($sql2);
    ?>
<div class="logowanie">
    <?php 
        echo "Wiadomość od: " .$row['od'];
        echo "<br>";
        echo "Temat: " .$row['temat'];
    ?>
    <div class="wiadomosc_box">
        <?php
        echo $row['tresc'];
    ?>
    </div>
</div>
<?php
	if(isset($_SESSION['ok']))
        echo $_SESSION['ok'];
    unset($_SESSION['ok']);
?>
</body>
</html>