<?php
@mysql_connect("localhost","root",'')
or die("data base connected failed");
@mysql_select_db("yx")
or die("data base selected failed");
//获取输入的信息
$username = $_POST['username'];
$passcode = $_POST['passcode'];
//获取session的值
$query = @mysql_query("select username,userflag,ID from users where username = '$username' and passcode = '$passcode'")
or die("SQL语句执行失败");
//判断用户以及密码
if($row = mysql_fetch_array($query))
{
	echo $row['ID'];
    session_start();
    //判断权限
    if($row['userflag'] == 1 or $row['userflag'] == 0 or $row['userflag'] == 2){
        $_SESSION['username'] = $row['username'];
        $_SESSION['userflag'] = $row['userflag'];
		$_SESSION['userID'] = $row['ID'];
		
		if($row['userflag'] == 0)
		    echo " Welcome you, administrator~~ ";
	    else if($row['userflag'] == 1)
		    echo " Welcome you, lecturer~~ ";
	    else if($row['userflag'] == 2)
		    echo " Welcome you, student~~ ";
	  
          echo "</br><a href='welcome_session_login.php'>欢迎访问www.cnblogs.com/txw1958</a>";
    }else{
        echo "userflag不正确";
    }

}else{
    echo "username or usercode is not correct";
}
?>
