<?php
	session_start();
	
	if (!isset($_SESSION['zalogowany']) or !isset($_GET['id_pacjenta']))
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
$wyb_icd = $_POST['wyb_icd'];
$tresc = $_POST['tresc'];

$sql2 = "INSERT INTO historia_chorob (id_choroby, pesel, icd, opis_slowny, data_badania) VALUES (NULL, '".$_SESSION['pesel_pacjenta']."', '".$wyb_icd."', '".$tresc."', SYSDATE())";

if ($conn->query($sql2) === TRUE) {
            $_SESSION['ok'] = 'Wysłano wiadomość';
            header('Location: panel.php');
        }
        else {
            $_SESSION['ok'] = 'Ustawianie lekarza nie powiodło się';
            header('Location: panel.php');
        }
		$conn->close();
?>