<?php
$server_name = 'mysql';
$username = 'root';
$password = '';
$dbname = 'university';

// Create connection
$conn = new mysqli($server_name, $username, $password, $dbname);

// Check connection
if($conn->connect_error){
    die(json_encode(["error" => "Databas connection failed: " .$conn->connect_error]));
}

