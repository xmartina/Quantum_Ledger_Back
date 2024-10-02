<?php
$page_name = 'My Card';
include_once (__DIR__ . '/functions/v_card_function.php');
include_once (__DIR__ . '/partials/header.php');
// Check if any records found
if ($result->num_rows > 0) { ?>

        $row["card_id"];
        $row["user_id"];
        $row["card_number"];
        $row["cardholder_name"];
        $row["expiry_date"];
        $row["cvv"];
        $row["balance"];
        $row["status"];
        $row["created_at"];

<?php } else {
    echo "You don't have any virtual cards.";
}

include_once (__DIR__ . '/partials/footer.php');


