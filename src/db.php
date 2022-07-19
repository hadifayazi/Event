<?php
try {
    $pdo = new PDO("mysql:host=localhost;dbname=movie-resa", 'root', 'risha22');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Could not connect to mysql". $e->getMessage();
    die();
}
