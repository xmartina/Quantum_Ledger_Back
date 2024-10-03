<?php
include_once (__DIR__ . '/main_function.php');

$get_card_sql = "SELECT * FROM virtual_cards WHERE status = 'inactive'";
$result = $conn->query($get_card_sql);