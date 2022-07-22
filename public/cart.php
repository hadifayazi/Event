<?php
require_once('./../src/db.php');
include('header.php');
session_start();

if (isset($_POST[''])) {
    if (!(isset($_SESSION['cart']))) {
        $_SESSION['cart'] ;
    }
}

var_dump($_SESSION['cart']);
