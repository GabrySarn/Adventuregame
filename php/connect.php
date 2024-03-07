<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "adventuregame";
$dbport = 3306;

$conn = new mysqli($dbhost,$dbuser,$dbpass,$dbname,$dbport);
if($conn->error){
    echo "errore connessione";
}else{
    // echo conn a buon fine
}