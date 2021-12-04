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
	
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Szpital</title>
    <link rel="stylesheet" href="style_test.css">
</head>

<body>
	
 <ul id="menu">
     <li id="powitanie"><?php
	echo "Użytkownik: ".$_SESSION['imie']. ' '.$_SESSION['nazwisko'];
?></li>
     <li><a href="panel.php">Strona główna</a></li>
     <li><a href="poczta.php">Poczta</a></li>
     <li><a href="logout.php">Wyloguj się</a></li>
</ul> 
    <h2>Oczekujący pacjenci</h2>
    <div class="pacjenci">
        <?php
            require_once "connect.php";

            $conn = @new mysqli($host, $db_user, $db_password, $db_name);
            
            if ($conn->connect_errno!=0)
            {
                echo "Error: ".$conn->connect_errno;
            }
            else
            {
                $lek_prow = $_SESSION['imie']. ' '.$_SESSION['nazwisko'];
                $sql = "SELECT * FROM pacjenci WHERE lek_prow = '".$lek_prow."'";
                $result = mysqli_query($conn, $sql);
                if (mysqli_num_rows($result) > 0){
                    while($row = mysqli_fetch_array($result)){
                        ?>
                            <a class="pacjent_link" href=<?php echo 'pacjent.php?id='.$row['id']; ?>>
                                <div class="<?php
                                    if ($row['stan']=='nagly')
                                    {
                                        echo 'pacjent_nagly';
                                    }
                                    elseif ($row['stan']=='pilny')
                                    {
                                        echo 'pacjent_pilny';
                                    }
                                    else
                                    {
                                        echo 'pacjent';
                                    }
                                ?>">
                                    <?php echo '<b>'.$row['imie'].' '.$row['nazwisko'].'</b>'; echo '<br>'; echo $row['pesel']; ?>
                                </div>
                            </a>
                            <br>
                        <?php
                    }
                }
            }
        ?>
    </div>
</body>
</html>