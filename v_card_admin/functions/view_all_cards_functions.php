<?php
include_once (__DIR__ . '/main_function.php');

$get_sql = "SELECT * FROM virtual_cards";
$result = $conn->query($get_sql);