<?php
session_start();
$page_name = 'My Card';
include_once (__DIR__ . '/functions/v_card_function.php');
include_once (__DIR__ . '/partials/header.php');

// Check if 'success' is set in the URL parameters
if ($_GET['success'] == 'new_card_inserted_successfully') {
    echo '
    <div class="media align-items-center d-flex justify-content-between alert alert-success mb-4">
    <div class="text-white">
    <i class="fas fa-exclamation-triangle h3"></i>New card Created Successfully!!
    </div>
    </div>
    ';
}


init_v_card($result_cards, $conn);
include_once (__DIR__ . '/partials/footer.php');


