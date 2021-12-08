<?php
session_start();
require_once "connect.php";

$conn = @new mysqli($host, $db_user, $db_password, $db_name);
$nazwa = $_POST['le'];
$nazwa2 = $_POST['il'];
$nazwa3 = $_SESSION['imie'].' '.$_SESSION['nazwisko'];
    $sql=mysqli_query($conn, "INSERT INTO zamowienia_lekow (id, lek, ilosc_leku, lekarz, status_zamowienia) VALUES (NULL, '".$nazwa."', '".$nazwa2."', '".$nazwa3."', 0)");
?>