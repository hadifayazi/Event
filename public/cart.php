<?php
require_once('./../src/db.php');
include('header.php');
session_start();

if (! $_SESSION['userEmail']) {
    header("Location:index.php");
}
if (isset($_POST['add'])) {
    if (!(isset($_SESSION['cart']))) {
        $_SESSION['cart'] ;
    }
    $idScreening = ($_POST['idScrenning']);
    if (isset($_POST['ticket'])) {
        $nbTicket = $_POST['ticket'];
    } else {
        $nbTicket = 1;
    }

    $_SESSION['cart']['idScreening']= [
        "idScreening" => $idScreening,
        "nbTicket" => $nbTicket
    ];

    $query = "SELECT *, events.title as title From screening JOIN events ON screening.event_id = events.idevent WHERE idscreening = :idScreening ";
    $st = $pdo->prepare($query);
    $st->execute([':idScreening' => $idScreening]);
    $screening = $st->fetchAll(PDO::FETCH_ASSOC); ?>
    
    
            <table class="table">
            <thead>
                <tr>
                <th scope="col">Title</th>
                <th scope="col">Auditorium</th>
                <th scope="col">Screening</th>
                <th scope="col">Price</th>
                <th scope="col">Number of seats</th>
                <th scope="col">totale</th>
                </tr>
            </thead>
            <tbody>
                <tr>


    <?php for ($i=0;$i<count($screening);$i++) {?>
        <td><?php echo $screening[$i]['title'] ?></td> <br>
        <td><?php echo $screening[$i]['audit_id'] ?></td> <br>
        <td><?php echo $screening[$i]['screening_start'] ?></td><br> 
        <td><?php echo $screening[$i]['price'] ?></td> <br>
        <td><?php echo $nbTicket ?></td>
        <td><?php echo $screening[$i]['price'] * $nbTicket ?></td><br>
        <td>
            <form action="cart.php" method="post">
            <input type="hidden" name="idScrenning" value="<?php echo $screening[$i]['idscreening']; ?>" />
            <button type="submit" class="btn btn-primary" name="add">Confitm</button>
            </form>
        </td>
        <td>
            <form action="deleteCart.php" method="get">
            <input type="hidden" name = "idScrenning" value="<?php echo $_SESSION['cart'][$idScrenning]; ?>" />
            <button class="btn btn-danger btn-sm btn-round" data-abc="true" type="submit" name="cancellation" value="TRUE">Remove</button>
            </form>
        </td>

        <?php } ?>
    

<?php
} ?>

