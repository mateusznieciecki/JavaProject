<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
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
    $lekarz = $_SESSION['imie']. ' ' .$_SESSION['nazwisko'];
	if ($conn->connect_errno!=0)
            {
                echo "Error: ".$conn->connect_errno;
            }
            else
            {
                $id_pacjenta = $_GET['id'];
                $sql = "SELECT * FROM pacjenci WHERE id = '".$id_pacjenta."'";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0){
                    $row = mysqli_fetch_array($result);
                    if ($row['lek_prow'] != $lekarz)
                        {
                            header('Location: index.php');
                        }
                    }
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
    <script>
        $(document).ready(function () {
            $("select").select2();
        });
    </script>
    <script>
        $(document).ready(function(){
            var ilosc_wpisow = 2;
            $("button").click(function(){
                ilosc_wpisow = ilosc_wpisow + 2;
                $("#historia_chorob").load("zaladuj_hist_chorob.php", {
                    nowa_ilosc_wpisow: ilosc_wpisow
                });
            });
        });
    </script>
 <ul id="menu">
     <li id="powitanie"><?php
	echo "Użytkownik: ".$_SESSION['imie']. ' '.$_SESSION['nazwisko'];
?></li>
     <li><a href="panel.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
    <div class="pacjenci">
        <h2>Pacjent</h2>
        <div class="pacjent">
        <?php
            
            if ($conn->connect_errno!=0)
            {
                echo "Error: ".$conn->connect_errno;
            }
            else
            {
                $id_pacjenta = $_GET['id'];
                $sql = "SELECT * FROM pacjenci WHERE id = '".$id_pacjenta."'";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0){
                    while($row = mysqli_fetch_array($result)){
                        echo $row['imie'].' '.$row['nazwisko'];
                        echo '<br>';
                        echo $row['pesel'];
                        echo '<br>';
                        echo 'Data urodzenia: '.$row['data_urodzenia'];
                        $_SESSION['pesel_pacjenta'] = $row['pesel'];
                    }
                }
            }
        ?>
        </div>
        <h2>Rozpoznanie</h2>
        <form action="wstaw_rozpoznanie.php?id_pacjenta=<?php echo $id_pacjenta; ?>" method="post">
                <select class="wybor_icd" name="wyb_icd" required>
                    <option value="" selected disabled hidden>Rozpoznanie</option>
                    <?php 
                $sql3 = "SELECT * FROM rozpoznanie";
                $result = mysqli_query($conn, $sql3);
                while($row2 = mysqli_fetch_array($result)){
                echo '<option value="' .$row2['icd'].' '.$row2['opis'].'">' .$row2['icd'].' '.$row2['opis'].'</option>';
                }
                    ?>
                </select><br>
        <textarea name="tresc" rows="10" cols="50" placeholder="Opis słowny stanu pacjenta"></textarea>
<br>
  <input type="submit" value="Zatwierdź pacjenta">
    </form>
        <h2>Historia chorób</h2>
        <div id="historia_chorob">
        <?php
            $sql2 = "SELECT * FROM historia_chorob WHERE pesel = '".$_SESSION['pesel_pacjenta']."' LIMIT 2";
            $result = mysqli_query($conn, $sql2);
            $startowa_liczba_chorob = mysqli_num_rows($result);
            if (mysqli_num_rows($result) > 0){
                while($row = mysqli_fetch_assoc($result)){
                    ?>
                    <div class="pacjent">
                    <?php
                    echo 'Data zgłoszenia: ' .$row['data_badania'];
                    echo '<br>';
                    echo '<b>' .$row['icd']. '</b>';
                    echo '<br>';
                    echo $row['opis_slowny'];
                    ?>
                    </div>
                    <br>
                    <?php
                }
            }
            else{
                echo 'Brak historii chorób';
            }
        ?>
        </div>
        <?php
            if($startowa_liczba_chorob < 2){
            }
            else{
        echo '<button>Załaduj starsze wpisy</button>';
            }
            ?>
    </div>
</body>
</html>