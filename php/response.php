<?php
require "connect.php";
function getResponseByHandler($handlerName) {
    global $conn;
    
    $sql = "SELECT phrase,choices FROM responses WHERE handler_name = '$handlerName'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $response = $result->fetch_assoc();
        return $response;
    } else {
        return "Nessuna risposta trovata per questo gestore.";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $handlerName = $_POST["handlerName"];
    $response = getResponseByHandler($handlerName);
    echo json_encode($response); 
}

$conn->close();

