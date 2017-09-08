<?php
echo "<title> drop tpl </title>";
echo "<p1> drop tpl </p1></br>";

session_start();
if(isset($_SESSION['username']))
{
    if($_SESSION['userflag'] == 0)
        echo "Welcome administrator".$_SESSION['username']."login";
    if($_SESSION['userflag'] == 1)
        echo "Welcome lecture".$_SESSION['username']."login";
    if($_SESSION['userflag'] == 2)
        echo "Welcome student".$_SESSION['username']."login";
	}
else
{
    echo "您没有权限访问此页面";
}

echo "</br></br></br>";
echo " <a href=\"courseList.php\">My courses</a>";

?>