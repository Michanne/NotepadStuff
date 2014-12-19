<html>
	<head>
		<title>Information Gathered</title>
	</head>
	
	<body>
	
	<?php
	
	$usersName = $_POST['username'];
	$streetAddress = $_POST['streetaddress'];
	$cityAddress = $_POST['city'];
	
	echo $usersName . "</br>";
	echo $streetAddress . "</br>";
	echo $cityAddress . "</br>";
	
	$randnum = 5;
	
	$num = 0;
	
	while($num < 20)
	{
	
		echo ++$num . ", ";
	}
	
	function addNums($num1, $num2)
	{
	
		return $num1 + $num2;
	}
	
	echo "</br>" . addNums(7, 8);
	
	?>
	
	</body>
</html>