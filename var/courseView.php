<?php

session_start();
@mysql_connect("localhost","root",'')

or die("data base connected failed");
@mysql_select_db("yx")

or die("data base selected failed");


$studentId = $_SESSION['userID'];

if(isset($_GET["name"]))
{
	$course=$_GET["name"];
	echo $course;

}

if(isset($_GET["id"]))
$courseID = $_GET['id'];
echo "</br>";
echo "recommeded book list:";

showRecommendedBooks();
echo "</br>";

echo "other book list:";
echo "</br>";
showNotRecommendedBooks();

echo "<p align=\"left\"> <input type=\"submit\" name=\"Submit\" value=\"Submit\" />  </p>";

function showRecommendedBooks()
{
	$query = @mysql_query("select books.book_id,books.book_name from recommend_courses_books , books where 
	books.book_id = recommend_courses_books.book_id")or die("SQL failed");
	while($row = mysql_fetch_array($query))
	{
		 $bookID = $row['book_id'];
		 $bookName = $row['book_name'];
		 echo "</br>";
		 echo $bookID;
		 echo "</br>";
		 echo $bookName;
		 echo "</br>";
	}	
}

function showNotRecommendedBooks()
{
	$query = @mysql_query("select books.book_id,books.book_name from books where 
	books.book_id not in
	(
	    select book_id from recommend_courses_books
	)
	")or die("SQL failed");
	while($row = mysql_fetch_array($query))
	{
		 $bookID = $row['book_id'];
		 $bookName = $row['book_name'];
		 echo "</br>";
		 echo $bookID;
		 echo "</br>";
		 echo $bookName;
		 echo "<input type='button' name='Submit'  /></br>";
	}	
}




?>