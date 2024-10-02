<?php
include_once (__DIR__ . '/../functions/main_function.php');
$sql = "SELECT * FROM virtual_cards WHERE user_id = $user_id";
$user_id = 1;
// Execute the query
$result = $conn->query($sql);

// Check if any records found
if ($result->num_rows > 0) {
    // Output data for each card
    while($row = $result->fetch_assoc()) {
        echo "Card ID: " . $row["card_id"] . "<br>";
        echo "User ID: " . $row["user_id"] . "<br>";
        echo "Card Number: " . $row["card_number"] . "<br>";
        echo "Cardholder Name: " . $row["cardholder_name"] . "<br>";
        echo "Expiry Date: " . $row["expiry_date"] . "<br>";
        echo "CVV: " . $row["cvv"] . "<br>";
        echo "Balance: " . $row["balance"] . "<br>";
        echo "Status: " . $row["status"] . "<br>";
        echo "Created At: " . $row["created_at"] . "<br><br>";
    }
} else {
    echo "You don't have any virtual cards.";
}
