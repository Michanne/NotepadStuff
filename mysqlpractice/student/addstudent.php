<html>
<head>
	<title>Add Student</title>
</head>
<body>
	
<form action="http://localhost:9002/student/studentadded.php" method="post">
	
	<b>Add a New Student</b>
	
	<p>First Name:
	<input type="text" name="first_name" size=30 />
	</p>
	
	<p>Last Name:
	<input type="text" name="last_name" size=30 />
	</p>
	
	<p>Email:
	<input type="text" name="email" size=30 />
	</p>
	
	<p>Street:
	<input type="text" name="street" size=30 />
	</p>
	
	<p>City:
	<input type="text" name="city" size=30 />
	</p>
	
	<p>State:
	<input type="text" name="state" size=30 maxlength=2 />
	</p>
	
	<p>Zip Code:
	<input type="text" name="zip" size=30 maxlength=5 />
	</p>
	
	<p>Phone Number:
	<input type="text" name="phone" size=30 />
	</p>
	
	<p>Birthdate:
	<input type="text" name="birth_date" size=30 />
	</p>
	
	<p>
	<input type="submit" name="submit" value="Submit" />
	</p>
</form>

<form action="http://localhost:9002/student/getstudentinfo.php" method="link">
<button type="submit" value="Info">Info</button>
</form>
	
</body>
</html>