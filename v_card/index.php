<?php
session_start();
$page_name = 'My Card';
include_once (__DIR__ . '/functions/v_card_function.php');
include_once (__DIR__ . '/partials/header.php');
init_v_card($result_cards, $conn);
include_once (__DIR__ . '/partials/footer.php');


