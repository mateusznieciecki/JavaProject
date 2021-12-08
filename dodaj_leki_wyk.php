<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']) || !isset($_POST['lek']) || !isset($_POST['ilosc']) || $_SESSION['typ_prac'] != 'admin')
	{
		header('Location: index.php');
		exit();
	}
	if (isset($_SESSION['pass_checker']))
	{
		header('Location: zmiana_hasla.php');
	}
	require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($conn->connect_errno!=0)
	{
		echo "Error: ".$conn->connect_errno;
	}
	else
	{
        $lek = $_POST['lek'];
        $ilosc = $_POST['ilosc'];
		$sql = "SELECT * FROM leki WHERE nazwa = '".$lek."'";
        $result = mysqli_query($conn, $sql);
            if (mysqli_num_rows($result) > 0){
                $row = mysqli_fetch_array($result);
                $nowa_ilosc = $row['ilosc'] + $_POST['ilosc'];
                $sql = "UPDATE leki SET ilosc = '".$nowa_ilosc."' WHERE nazwa = '".$lek."'";
                if ($conn->query($sql) === TRUE) {
                    $_SESSION['ok'] = 'Dodano icd';
                     
                }
                else {
                    $_SESSION['ok'] = 'Dodawanie nie powiodło się';
                     
            }
        }
        else{
            $sql = "INSERT INTO leki (id, nazwa, ilosc) VALUES (NULL, '".$lek."', '".$ilosc."')";
            if ($conn->query($sql) === TRUE) {
                $_SESSION['ok'] = 'Dodano icd';
                 
            }
            else {
                $_SESSION['ok'] = 'Dodawanie nie powiodło się';
                 
        }
    }
    $sql2 = "SELECT * FROM leki WHERE nazwa = '".$lek."'";
    $sql3 = "SELECT * FROM zamowienia_lekow WHERE status_zamowienia=0 AND lek = '".$lek."'";
    $result2 = mysqli_query($conn, $sql2);
    if (mysqli_num_rows($result2) > 0){
        $row2 = mysqli_fetch_array($result2);
    }
    $result3 = mysqli_query($conn, $sql3);
        if (mysqli_num_rows($result3) > 0){
            while($row3 = mysqli_fetch_array($result3)){
                if($row2['ilosc'] > $row3['ilosc_leku'])
                {
                    $sql4 = mysqli_query($conn, "UPDATE leki SET ilosc = ilosc-".$row3['ilosc_leku']." WHERE nazwa = '".$row2['nazwa']."'");
                    $sql5 = mysqli_query($conn, "UPDATE zamowienia_lekow SET status_zamowienia = 1 WHERE id = '".$row3['id']."'");
                    $sql2 = mysqli_query($conn, "SELECT * FROM leki WHERE nazwa = '".$lek."'");
                    if (mysqli_num_rows($sql2) > 0){
                        $row2 = mysqli_fetch_array($sql2);
                    }
                }
        }
	}
    $conn->close();
    header('Location: dodaj_leki.php');
}
	
?>