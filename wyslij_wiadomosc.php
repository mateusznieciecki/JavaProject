<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id']))
	{
		header('Location: index.php');
		exit();
	}
    if (isset($_SESSION['pass_checker']))
	{
		header('Location: zmiana_hasla.php');
        exit();
    }

require_once "connect.php";
$conn = @new mysqli($host, $db_user, $db_password, $db_name);

$wyb_lek = $_POST['wyb_lek'];
$tresc = $_POST['tresc'];
$temat = $_POST['temat'];
echo $tresc;
echo $_SESSION['login'];
echo $wyb_lek;
$sql2 = "INSERT INTO wiadomosci (id_wiadomosci, temat, tresc, od, do, status) VALUES (NULL, '".$temat."', '".$tresc."', '".$_SESSION['login']."', '".$wyb_lek."', 0)";

if ($conn->query($sql2) === TRUE) {
            $_SESSION['ok'] = 'Wysłano wiadomość';
            header('Location: szpital.php');
        }
        else {
            $_SESSION['ok'] = 'Ustawianie lekarza nie powiodło się';
            header('Location: szpital.php');
        }
		$conn->close();
?>