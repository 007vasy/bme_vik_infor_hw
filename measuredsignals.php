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
				<form action="" method="post" >
<?php
		
					$con = mysqli_connect("localhost","root","")
					or die("Connection Error".mysql_error());
					
					mysqli_query($con,"SET names 'utf8'");
					
					mysqli_select_db($con, "info2");
					
					echo('
							<tr class="wh">
									<td>Building</td>
									<td>TimepointStart</td>
									<td>TimepointEnd</td>
									</tr>
							');
					$data=mysqli_query($con,"SELECT Name FROM buildings");
					echo('<tr>
								<td>
							  <input list="bname" name="bname">
							  
							  <datalist id="bname">
														  
							');
					while($row = mysqli_fetch_array($data))
							{
								echo('
										
											<option value="'.$row["Name"].'">
											
										
									');
							}
					$timestart=mysqli_query($con,"SELECT Min(Timepoint) AS TS FROM msignal");
					
					$timeend=mysqli_query($con,"SELECT Max(Timepoint) AS TE FROM msignal");
					while($times=mysqli_fetch_array($timestart))
					echo('
							<td><input value="'.$times["TS"].'" type="text" name="TS" /></td>
						');
					while($timee=mysqli_fetch_array($timeend))
					echo('
							<td><input value="'.$timee["TE"].'" type="text" name="TE" /></td>
						');
					echo('
							<td><input type="submit" value="Submit" /></td>
							</datalist>
							
							</tr>
							</form>
							</table>
						');
						
					if(!empty($_POST))
					{	
						echo('
								<table align="center">
								<tr></tr>
								<tr class="wh">
									<td>Building</td>
									<td>Timepoint</td>
									<td>RoomID</td>
									<td>Signal</td>
									<td>Data</td>
								</tr>						
							');																																																																																															
						$sresult=mysqli_query($con,"SELECT buildings.Name AS Bname,Timepoint,RID,asignal.Name AS Sname,Data FROM msignal INNER JOIN buildings ON msignal.BID=buildings.ID INNER JOIN asignal on msignal.SID=asignal.ID WHERE msignal.BID=(SELECT ID FROM buildings WHERE Name='".mysqli_real_escape_string($con,$_POST["bname"])."') AND (Timepoint BETWEEN '".mysqli_real_escape_string($con,$_POST["TS"])."' AND '".mysqli_real_escape_string($con,$_POST["TE"])."')Group by Sname,RID Order by Timepoint ASC ")or die("Select Error".mysql_error());
						while($r = mysqli_fetch_array($sresult))
							{
								echo('
										<tr>
											<td>'.$r["Bname"].'</td>
											<td>'.$r["Timepoint"].'</td>
											<td>'.$r["RID"].'</td>
											<td>'.$r["Sname"].'</td>
											<td>'.$r["Data"].'</td>												
										</tr>
									');
							}
					}
					
					mysqli_close($con);
				?>	
				
				</table>
<?php
include('basicfoot.php');
?>		
	
</body>
</html>