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

$studentID = $_SESSION['userID'];

echo "</br></br>";
$courseID = 0;
//if($row = mysql_fetch_array($query))
//echo $row[1];
while($row = mysql_fetch_array($query))
{
	//echo "</br></br>a new row</br>";
	//echo $row['person_id'];
	echo "</br></br>";
	//echo $row['course_id'];
    $courseID = $row['course_id'];

	$subQuery = @mysql_query("select course_name from courses where course_id = $courseID ")or die("SQL failed");
	
	$res = mysql_fetch_array($subQuery);
	echo "</br>";
	echo $res['course_name'];
	
	showCourseBooks($studentID,$courseID);
	
}	

function showCourseBooks($student_id,$course_id)
{
	echo "</br>enter showCourseBooks";
	//echo "</br>$student_id";
	//echo "</br>$course_id";
    // $query = @mysql_query("select book_id from student_courses_books where student_id = 8 and course_id = 7 ")or die(" SQL failed");
	
	$query = @mysql_query("select book_id from student_courses_books where person_id = $student_id and course_id = $course_id")or die(" SQL failed");

	while($row = mysql_fetch_array($query))
	{
		echo "</br>";
		//echo $row['book_id'];
		
		$bookID = $row['book_id'];
		
		$subQuery = @mysql_query("select book_name from books where book_id = $bookID ")or die("SQL failed");
	
	    $res = mysql_fetch_array($subQuery);
	    //echo "</br>";
	    echo $res['book_name'];
		
		echo "</br>";
	}
	
}

?>