<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']) || $_SESSION['typ_prac'] != 'lekarz')
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
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
    <script src="sweetalert2.all.min.js"></script>
    <script src="jquery_min.js"></script>
    <link href="select2_min.css" rel="stylesheet" />
    <script src="select2_min.js"></script>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style_test.css">
</head>

<body>
<script>
        $(document).ready(function () {
            $("select").select2();
            document.getElementById("dodajLek").onclick = function() {getname()};

function dodajLek_funkcja() {
    Swal.fire("The form was submitted");
}
function getname() {
    var lek=$('select option').filter(':selected').text();
    var ilosc=$("#ilosc").val();   
    $.ajax({
        type:"post",
        dataType:"text",
        data:{'lek' : lek, 'ilosc': ilosc},
        url:"sprawdz_stan.php",   
        success:function(response)
        { 
            //$("#test").html(response.lek); 
            //console.log(response);
            if(response == 0){
                Swal.fire({
                title: 'Brak leku w magazynie. Czy chcesz złożyć zamówienie?',
                showDenyButton: true,
                showCancelButton: false,
                confirmButtonText: 'Zamów',
                denyButtonText: 'Odrzuć',
                }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    Swal.fire('Złożono zamówienie', '', 'success');
                    jQuery.ajax({
                    type: "POST",
                    url: 'zamow_leki_niedostepne.php',
                    dataType: 'text',
                    data: {'le' : lek, 'il': ilosc},

                    success: function () {
                    }
                    });
                } else if (result.isDenied) {
                }
                })
                            }
            else{
                Swal.fire({
                title: "Czy chcesz zarezerwować "+lek+" w ilości "+ilosc+"?",
                showDenyButton: true,
                showCancelButton: false,
                confirmButtonText: 'Zarezerwuj',
                denyButtonText: 'Odrzuć',
                }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    Swal.fire('Zamówiono', '', 'success');
                    jQuery.ajax({
                    type: "POST",
                    url: 'zamow_leki_dostepne.php',
                    dataType: 'text',
                    data: {'le' : lek, 'il': ilosc},

                    success: function () {
                    }
                    });
                } else if (result.isDenied) {
                }
                })

                            }
        }
    });
}
        });
    </script>
 <ul id="menu">
     <li id="powitanie"><?php
	echo "Użytkownik: ".$_SESSION['imie']. ' '.$_SESSION['nazwisko'];
?></li>
     <li><a href="panel.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="poczta.php">Zamów leki</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
        <?php
            
            if ($conn->connect_errno!=0)
            {
                echo "Error: ".$conn->connect_errno;
            }
            else
            {
                $sql = "SELECT * FROM leki";
            }
        ?>
        <form>
                <select id="wybor_lek" name="wybor_lek" required>
                    <option value="" selected disabled hidden>Lek</option>
                    <?php 
                $result = mysqli_query($conn, $sql);
                while($row = mysqli_fetch_array($result)){
                echo '<option value="' .$row['nazwa'].'">' .$row['nazwa'].'</option>';
                }
                echo '<input type="number" name="ilosc" id="ilosc" placeholder="Ilość" required/> <br />';
                    ?>
                </select><br>
    </form>
    <button id="dodajLek">Zatwierdź</button>

</body>
</html>