
<?php
require_once('./../src/db.php');
include('header.php');
session_start();

if (isset($_GET['idEvent'])) {
    $sql = "SELECT * FROM events WHERE idevent = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':id' =>$_GET['idEvent']]);
    $event = $stmt->fetch();
} else {
    header('location:index.php');
}



?>

<div class="">
    <div class="">
        <img src="https://placehold.jp/200x300.png">
    </div>
        <h1><?php echo $event['title']; ?></h1>
        <p><?php echo"Director: ". $event['director']; ?></p>
        <p><?php echo"Duration: ".$event['duration']."mins"; ?></p>
        <p><?php echo $event['desc']; ?></p><br>
</div>
