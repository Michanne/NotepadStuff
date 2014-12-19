<html>
<head>
	<title>Add Student</title>
</head>
<body>
<?php 
	
		if(isset($_POST['submit']))
		{
		
			$data_missing = array();
			
			if(empty($_POST['first_name']))
			{
			
				$data_missing[] = 'First Name';
			} else {
			
				$f_name = trim($_POST['first_name']);
			}
			
			if(empty($_POST['last_name']))
			{
			
				$data_missing[] = 'Last Name';
			} else {
			
				$l_name = trim($_POST['last_name']);
			}
			
			if(empty($_POST['email']))
			{
			
				$data_missing[] = 'Email';
			} else {
			
				$email = trim($_POST['email']);
			}
			
			if(empty($_POST['street']))
			{
			
				$data_missing[] = 'Street';
			} else {
			
				$street = trim($_POST['street']);
			}
			
			if(empty($_POST['city']))
			{
			
				$data_missing[] = 'City';
			} else {
			
				$city = trim($_POST['city']);
			}
			
			if(empty($_POST['state']))
			{
			
				$data_missing[] = 'State';
			} else {
			
				$state = trim($_POST['state']);
			}
			
			if(empty($_POST['zip']))
			{
			
				$data_missing[] = 'Zip Code';
			} else {
			
				$zip= trim($_POST['zip']);
			}
			
			if(empty($_POST['phone']))
			{
			
				$data_missing[] = 'Phone Number';
			} else {
			
				$phone = trim($_POST['phone']);
			}
			
			if(empty($_POST['birth_date']))
			{
			
				$data_missing[] = 'Birthdate';
			} else {
			
				$birth_date = trim($_POST['birth_date']);
			}
			
			if(empty($data_missing))
			{
			
				require_once('../mysqli_connect.php');
				
				$query = "INSERT INTO students (first_name, last_name,
				email, street, city, state, zip, phone, birth_date, student_id) VALUES
				(?, ?, ?, ?, ?, ?, ?, ?, ?, NULL)";
				 
				$stmt = mysqli_prepare($dbc, $query);
				
				mysqli_stmt_bind_param($stmt, "ssssssiss", $f_name,
				$l_name, $email, $street, $city, $state, $zip, $phone,
				$birth_date);
				
				mysqli_stmt_execute($stmt);
				
				$affected_rows = mysqli_stmt_affected_rows($stmt);
				
				if($affected_rows == 1)
				{
				
					echo 'Student entered!';
					
					mysqli_stmt_close($stmt);
					mysqli_close($dbc);
				}
				
				else
				{
				
					echo 'Error Occurred<br />';
					echo mysqli_error();
					
					mysqli_stmt_close($stmt);
					mysqli_close($dbc);
				}
			}
			
			else
			{
			
				echo 'You need the following data: <br />';
				
				foreach($data_missing as $missing)
				{
				
					echo "$missing<br />";
				}
			}
		}
	
?>
	
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