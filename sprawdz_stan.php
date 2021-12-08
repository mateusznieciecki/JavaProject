<?php
    require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
    $lek=$_POST['lek'];
    $ilosc=$_POST['ilosc'];
    $_SESSION['lek'] = $lek;
    $_SESSION['ilosc'] = $ilosc;
    $sql=mysqli_query($conn, "select ilosc from leki where nazwa='$lek'");
    $result=mysqli_fetch_row($sql);
    if($result[0] < $ilosc){
        echo 0;
    }
    else{
        echo 1;
    }   
    exit;
?>