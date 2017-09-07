<?php
echo "<title> drop tpl </title>";
echo "<p1> drop tpl </p1></br>";

session_start();
if(isset($_SESSION['username']))
{
    if($_SESSION['userflag'] == 1)
        echo "欢迎管理员".$_SESSION['username']."登陆";
    if($_SESSION['userflag'] == 0)
        echo "欢迎用户".$_SESSION['username']."登陆";
}
else
{
    echo "您没有权限访问此页面";
}
?>