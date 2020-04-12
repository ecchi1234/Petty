<?php 
define('DB_SERVER', 'us-cdbr-iron-east-01.cleardb.net');
define('DB_USERNAME', 'b1fbaebb89d93f');
define('DB_PASSWORD', '827328ff521c86e');
define('DB_NAME','heroku_fecc8a230da62cd');
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 ?>