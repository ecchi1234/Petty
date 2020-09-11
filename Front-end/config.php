<?php 
define('DB_SERVER', 'us-cdbr-east-02.cleardb.com');
define('DB_USERNAME', 'b463aa2097ea0d');
define('DB_PASSWORD', '055973f0');
define('DB_NAME','heroku_94dabfed4faccc7');

define('MAX_PRODUCT_IN_PAGE', 20);
define('MAX_PAGE_NUMBER_IN_PAGE', 5);
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 mysqli_set_charset($link, 'UTF8');
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 ?>
