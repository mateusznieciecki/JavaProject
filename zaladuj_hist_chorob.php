<?php
    session_start();
    if (isset($_SESSION['pass_checker']))
	{
		header('Location: zmiana_hasla.php');
        exit();
    }
    require_once "connect.php";
    $conn = @new mysqli($host, $db_user, $db_password, $db_name);
    $nowa_ilosc_wpisow = $_POST['nowa_ilosc_wpisow'];
            $sql2 = "SELECT * FROM historia_chorob WHERE pesel = '".$_SESSION['pesel_pacjenta']."' LIMIT $nowa_ilosc_wpisow";
            $result = mysqli_query($conn, $sql2);
            if (mysqli_num_rows($result) > 0){
                while($row = mysqli_fetch_array($result)){
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
                if (mysqli_num_rows($result) < $nowa_ilosc_wpisow)
            {
                ?>
                    <div class="pacjent">
                    <?php
                    echo 'Koniec historii chorób';
                    ?>
                    </div>
                    <br>
                    <?php
            }
            }
            else{
                ?>
                    <div class="pacjent">
                    <?php
                    echo 'Koniec historii chorób';
                    ?>
                    </div>
                    <br>
                    <?php
            }
            ?>