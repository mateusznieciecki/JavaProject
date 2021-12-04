<?php

	session_start();
	
	if ((!isset($_POST['login'])) || (!isset($_POST['haslo'])))
	{
		header('Location: index.php');
		exit();
	}

	require_once "connect.php";

	$conn = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if ($conn->connect_errno!=0)
	{
		echo "Error: ".$conn->connect_errno;
	}
	else
	{
		$login = $_POST['login'];
		$haslo = $_POST['haslo'];
		
		$login = htmlentities($login, ENT_QUOTES, "UTF-8");
		$haslo = htmlentities($haslo, ENT_QUOTES, "UTF-8");
	
		if ($result = @$conn->query(
		sprintf("SELECT * FROM pracownicy WHERE login='%s' AND haslo='%s'",
		mysqli_real_escape_string($conn,$login),
		mysqli_real_escape_string($conn,$haslo))))
		{
			$ilu_userow = $result->num_rows;
			if($ilu_userow>0)
			{
				$_SESSION['zalogowany'] = true;
				
				$row = $result->fetch_assoc();
				$_SESSION['id'] = $row['id'];
				$_SESSION['login'] = $row['login'];
				$_SESSION['haslo'] = $row['haslo'];
				$_SESSION['imie'] = $row['imie'];
				$_SESSION['nazwisko'] = $row['nazwisko'];
				$_SESSION['typ_prac'] = $row['typ_prac'];
				
				unset($_SESSION['blad']);
				$result->free_result();
				if($_SESSION['login'] == $_SESSION['haslo'])
				{
					$_SESSION['pass_checker'] = 1;
					header('Location: zmiana_hasla.php');
				}
				else{
					if($row['typ_prac'] == 'rejestrator'){
						header('Location: szpital.php');
					}
					elseif($row['typ_prac'] == 'lekarz'){
						header('Location: panel.php');
					}
					elseif($row['typ_prac'] == 'admin'){
						header('Location: admin.php');
					}
				}
				
				
			} else {
				
				$_SESSION['blad'] = 'Błędny login lub hasło';
				header('Location: index.php');
				
			}
			
		}
		
		$conn->close();
	}
	
?>