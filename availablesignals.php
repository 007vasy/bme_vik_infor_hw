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
				<table align="center">
					<tr class="wh">
						
						<td>Name</td>
						<td>Max</td>
						<td>Min</td>
						<td><a class="button" href="newasignal.php"> New </a></td>
					</tr>
				<?php
					
					
				
	
					$con = mysqli_connect("localhost","root","")
					or die("Connection Error".mysql_error());
					
					mysqli_query($con,"SET names 'utf8'");
					
					mysqli_select_db($con, "info2");
					
					if(!empty($_GET))
					{
						mysqli_query($con,'DELETE FROM asignal WHERE ID="'.mysqli_real_escape_string($con,$_GET["ID"]).'" ')or die("Update Error".mysql_error());
					}
					
					if(!empty($_POST))
					{
						if(isset($_POST["ID"]))
						{
							mysqli_query($con,"UPDATE asignal SET Name='".mysqli_real_escape_string($con,$_POST["Name"])."', Max='".mysqli_real_escape_string($con,$_POST["Max"])."', Min='".mysqli_real_escape_string($con,$_POST["Min"])."' WHERE ID='".mysqli_real_escape_string($con,$_POST["ID"])."' ")or die("Update Error".mysql_error());
						}
						else
						{	
							mysqli_query($con,"INSERT INTO asignal (Name,Max,Min) VALUES ('".mysqli_real_escape_string($con,$_POST["Name"])."', '".mysqli_real_escape_string($con,$_POST["Max"])."', '".mysqli_real_escape_string($con,$_POST["Min"])."')")or die("Update Error".mysql_error());
						}
					}
					
					$data=mysqli_query($con,"SELECT * FROM asignal ORDER BY ID ASC");
					
							while($row = mysqli_fetch_array($data))
							{
								echo ('
									<tr>
										
										<td>'.$row["Name"].'</td>
										<td>'.$row["Max"].'</td>
										<td>'.$row["Min"].'</td>
										<td> <a class="button" href="updateasignal.php?azon='.$row["ID"].'"> Update </a></td>
									</tr>');
							}
					
					mysqli_close($con);
				?>	
				</table>
<?php
include('basicfoot.php');
?>	
		
</body>
</html>