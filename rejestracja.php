<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}

	require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($polaczenie->connect_errno!=0)
	{
		echo "Error: ".$polaczenie->connect_errno;
	}
	else
	{
        $p_pesel = $_POST['pesel_p'];
        $p_imie = $_POST['imie_p'];
        $p_nazwisko = $_POST['nazwisko_p'];
        $p_data = $_POST['data_p'];
        $p_lek_prow = $_POST['lek_prow_p'];
        $p_ubezpieczenie = $_POST['ubezpieczenie_p'];
		$sql = "INSERT INTO pacjenci (pesel, imie, nazwisko, data_urodzenia, lek_prow, ubezpieczenie) VALUES ('".$p_pesel."', '".$p_imie."', '".$p_nazwisko."', '".$p_data."', '".$p_lek_prow."', '".$p_ubezpieczenie."')";
		if ($conn->query($sql) === TRUE) {
            $_SESSION['ok'] = 'Zarejestrowano nowego pacjenta';
            header('Location: zarejestruj.php');
        }
        else {
            $_SESSION['ok'] = 'Rejestracja nie powiodła się';
            header('Location: zarejestruj.php');
        }
		$polaczenie->close();
	}
	
?>