<?php
$page_name = 'My Card';
include_once (__DIR__ . '/functions/v_card_function.php');
include_once (__DIR__ . '/partials/header.php');
// Check if any records found
init_v_card();
include_once (__DIR__ . '/partials/footer.php');


