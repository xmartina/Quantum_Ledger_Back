<?php
include_once (__DIR__ . '/main_function.php');

$get_card_sql = "SELECT card_id, cardholder_name, card_number, expiry_month, expiry_year, cvv, balance FROM cards WHERE status = 'inactive'";
$result = $conn->query($get_card_sql);