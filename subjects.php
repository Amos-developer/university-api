<?php
header("Content-Type: application/json");
require_once("db.php");

// Get the subjects
$sql = "SELECT subject, year FROM subjects";
$result = $conn->query($sql);

$subjects = [];

if($result->num_rows > 0){
    while($rows = $result->fetch_assoc()){
        $subjects["Year" .$rows["year"]][] = $rows["subject"];
    }
}

echo json_encode($subjects);