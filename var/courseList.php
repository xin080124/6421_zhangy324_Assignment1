<?php

//include('connect.php');
//include('loginchg.php');

echo "<title> my courses </title>";
echo "<p1>  my courses </p1></br>";

session_start();

@mysql_connect("localhost","root",'')
or die("data base connected failed");
@mysql_select_db("yx")
or die("data base selected failed");

$query = @mysql_query("select person_id, course_id from person_courses where person_id = 8 ")or die("SQL failed");

echo "db success</br></br>";
echo $_SESSION['username'];

echo "</br></br>";
if($row = mysql_fetch_array($query))
echo $row[1];
	//$result = mysql_query("SELECT *person_courses");

//while($row = mysql_fetch_array($query))
//{}

?>