<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link rel="shortcut icon" href="favicon.ico">
	<?php
	include('metahead.php');
	?>
</head>
<body>
<?php
include('basichead.php');
?>
				<form action="availablesignals.php" method="post" >
				<table align="center">
					<tr class="wh">
						
						<td>Name</td>
						<td>Max</td>
						<td>Min</td>
					</tr>
				<?php
					
					
				
	
					$con = mysqli_connect("localhost","root","")
					or die("Connection Error".mysql_error());
					
					mysqli_query($con,"SET names 'utf8'");
					
					mysqli_select_db($con, "info2");
					
					echo ('
									<tr>
									<td></td>
									<td><input value="" type="text" name="Name" /></td>
									<td><input value="" type="text" name="Max" /></td>
									<td><input value="" type="text" name="Min" /></td>
									
									<td><input type="submit" value="Submit" /></td>
									
									</tr>
									');
					
					mysqli_close($con);
				?>	
				</table>
				</form>
<?php
include('basicfoot.php');
?>
</body>
</html>