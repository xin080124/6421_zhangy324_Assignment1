<?php
//include("courseList.php");

session_start();
@mysql_connect("localhost","root",'')
or die("data base connected failed");
@mysql_select_db("yx")
or die("data base selected failed");

echo "<textarea  name=\"content\" cols=\"60\" rows=\"9\" ></textarea>";

if(isset($_GET["name"]))
{
	echo "from get";
$book=$_GET["name"];
}
if(isset($_GET["id"]))
$bookID = $_GET['id'];

if(isset($_POST["name"]))
{
	echo "from post";
$book=$_POST["name"];
}
if(isset($_POST["id"]))
$bookID = $_POST['id'];

$studentId = $_SESSION['userID'];

echo $book;
echo "</br>";
echo $bookID;
echo "</br>";

showBookNotes($studentId,$bookID);

function showBookNotes($student_id,$book_id)
{
	echo "</br>enter showBookNotes";
	echo "</br>";
	echo $student_id;
	echo "</br>";
	echo $book_id;
	echo "</br>";
	

	$query = @mysql_query("select * from student_books_notes")or die(" SQL failed");
	
	while($row = mysql_fetch_array($query))
	{
		echo "</br>";
		echo $row['value'];
		
		
	}

}
echo "wwwwwwwwwwwwwwwwwwwwwwwwww";
echo "</br>";
echo "<form action=\"test.php\" target=\"iframe\" method=\"post\">
<input type=\"text\" name=\"password\" /><br/> 
<textarea  name=\"content\" cols=\"60\" rows=\"9\" ></textarea><br/> 
<input type=\"submit\" value=\"log in\" />
</form>";

echo "<form method=\"POST\" action=\"bookView.php?id=".$bookID."&name=".$book."\">
<div>
<textarea name=\"MSG\" cols=40 rows=4>
welcome adding notes
</textarea>
<input type=\"submit\" value=\"add note\" />
</div>
</form>";

?>