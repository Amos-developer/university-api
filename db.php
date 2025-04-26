<?php
$server_name = 'database';
$username = 'root';
$password = 'amos123';
$dbname = 'university_db';

// Create connection
$conn = new mysqli($server_name, $username, $password, $dbname);

// Check connection
if($conn->connect_error){
    die(json_encode(["error" => "Database connection failed: " .$conn->connect_error]));
}

