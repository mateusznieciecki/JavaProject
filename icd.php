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
<h3>Szukaj ICD</h3>
<form action="icd.php" method="post">
<input type="text" name="szukane" placeholder='Treść wyszukiwania...' required/> <br />
<input type="submit" value="Szukaj" /><br>
<a href="dodaj_icd.php"><i class="material-icons">add</i>Dodaj</a>
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
        if(isset($_POST['szukane'])){
            $sql = "SELECT * FROM rozpoznanie WHERE icd LIKE '%".$szukane."%' OR opis LIKE '%".$szukane."%'";
        }
        else{
            $sql = "SELECT * FROM rozpoznanie";
        }
		$result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0){
            echo '<table><tr><th>ICD</th><th>Opis</th><th>Usuń</th><th>Edytuj</th>';
            while($row = mysqli_fetch_array($result)){
                echo '<tr><td>' . $row['icd'] .  '</td><td>' . $row['opis'] . '</td>';
                ?>
                <td><a href="usun_icd.php?id=<?php echo $row['id']; ?>"><i class="material-icons">delete</i></a></td>
                <td><a href="edytuj_icd.php?id=<?php echo $row['id']; ?>"><i class="material-icons">edit</i></a></td>
                <?php
            }
        }
    }
    ?>
</body>
</html>