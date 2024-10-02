<?php
session_start();
$page_name = 'My Card';
include_once (__DIR__ . '/functions/v_card_function.php');
include_once (__DIR__ . '/partials/header.php');
if ($_GET['success'] == 'new_card_inserted_successfully') {
    echo '
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        New card inserted successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>';
}
?>
init_v_card($result_cards, $conn);
include_once (__DIR__ . '/partials/footer.php');


