<?php

    $server='localhost';
    $user='root';
    $pass='';
    $db='palls';


// connect to mysql
$conn = mysqli_connect($server,$user,$pass,$db);
// you can also do the following: $con = mysqli_connect("localhost","root","","onlinetestingsystem");


// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to Connect to MySQL: ";
}
else{
echo "Connection Successful";
}
?>