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


include_once 'login.class.php';

$securearea = new Login();

$response = $securearea->session_check();

?>
<?php if(isset($response)) echo "<h4>" . $response . "</h4>"; ?>
<p>
    	You've reached the page that stores all of the secret 	launch codes!
</p>
<a href="sample.php?val=0">Log Out</a>