<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


unset($_SESSION["cart"][$_GET["idScreening"]]);

header('location: index.php');
