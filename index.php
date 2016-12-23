<?php
/*
 * file name : login.class.php
 * class name : login
 * pupose: for login module, database connectibity, query execution and fetch data from database
 * author : saeed ahmed
 * contact email: saeed.sas@gmail.com
 * website: http://saeed05.wordpress.com
 * License : GPL http://www.gnu.org/licenses/gpl.html
 */

require_once __DIR__.'/functions/registry.php';

$obj = new Login();

if(isset($_GET['val']) && $_GET['val'] == '0') {
	$obj->logout();
}

if(isset ($_POST[submit])) {
       $response = $obj->login_user($_POST['username'],$_POST['username']);
}
?>

<form action="sample.php" method="POST">
    username : <input name = "username" type="text" /><br/>
    password : <input name = "password" type ="password" /><br/>
    <input name ="submit" type ="submit" value ="login" />
</form>

<?php if(isset($response)) echo "<h4>" . $response . "</h4>"; ?>