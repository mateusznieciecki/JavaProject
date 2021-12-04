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
    <link rel="stylesheet" href="style_test.css">
</head>

<body>

<?php
require_once "connect.php";

$conn = @new mysqli($host, $db_user, $db_password, $db_name);

if ($conn->connect_errno!=0)
{
    echo "Error: ".$conn->connect_errno;
}
else
{
    $id = $_GET['id'];
    $sql = "SELECT * FROM pracownicy WHERE id = '$id'";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0){
        $row = mysqli_fetch_array($result);
    }
    $conn->close();
}

?>

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
    <h2>Edytuj pracownika</h2>
    <form action="edycja_pracownika.php?id=<?php echo $id; ?>" method="post">
        
		Login:  <input type="text" name="login_pr" <?php echo 'value="'.$row['login'].'"'; ?> required/> <br />
        Imię: <input type="text" name="imie_pr" <?php echo 'value="'.$row['imie'].'"'; ?> required/> <br />
        Nazwisko: <input type="text" name="nazwisko_pr" <?php echo 'value="'.$row['nazwisko'].'"'; ?> required/> <br />
        Typ pracownika: <select name="typ_pr" required>
        <option value="rejestrator" <?php if($row['typ_prac'] == 'rejestrator'){echo 'selected';} ?>>Rejestrator</option>
        <option value="lekarz" <?php if($row['typ_prac'] == 'lekarz'){echo 'selected';} ?>>Lekarz</option>
        <option value="admin" <?php if($row['typ_prac'] == 'admin'){echo 'selected';} ?>>Admin</option>
        </select> <br />
		<input type="submit" value="Zarejestruj" />	
	</form>
    </div>
</body>
</html>