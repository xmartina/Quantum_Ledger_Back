<?php
$page_name = 'My Card';
include_once (__DIR__ . '/functions/v_card_function.php');
include_once (__DIR__ . '/partials/header.php');
echo $user_id;
init_v_card();
include_once (__DIR__ . '/partials/footer.php');


