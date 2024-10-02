<?php
include_once (__DIR__ . '/main_function.php');
include_once(__DIR__ . '/auth_function.php');
include_once (__DIR__ . '/user_data_function.php');

// Function to generate a random 16-digit number
function generateRandomCardNumber()
{
    $randomNumber = '';
    for ($i = 0; $i < 16; $i++) {
        $randomNumber .= mt_rand(0, 9); // Generate a random digit from 0 to 9
    }
    return $randomNumber;
}

// Generate the random card number on page load
$cardNumber = generateRandomCardNumber();

// Function to generate expiration date in MM/YY format
function generateExpirationDate()
{
    // Get the current date
    $currentDate = new DateTime();

    // Add 4 years to the current date
    $currentDate->modify('+4 years');

    // Format the date as MM/YY
    return $currentDate->format('m/y');
}

// Generate the expiration date on page load
$expirationDate = generateExpirationDate();

// Function to generate expiration date in CVV Code format
function generate_cvv_number()
{
    $randomNumber = '';
    for ($i = 0; $i < 3; $i++) {
        $randomNumber .= mt_rand(0, 9); // Generate a random digit from 0 to 9
    }
    return $randomNumber;
}

$ccv_code = generate_cvv_number();


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['request_card'])) {
    // Retrieve form data
    $cardholder_name = $name; // Assuming the name field is sent in the POST request
    $currentMonth = date('m'); // Get current month
    $currentYear = date('Y'); // Get current year
    $expiry_month = $currentMonth; // Set expiry month to the current month
    $expiry_year = $currentYear + 4; // Set expiry year to current year + 4
    $cvv = $_POST['ccv_code']; // Get the CVV code from the form
    $card_pin = $_POST['card_pin'];

    // Check if a card already exists for the user
    $check_query = "SELECT * FROM virtual_cards WHERE user_id = $user_id";
    $check_result = $conn->query($check_query);

    if ($check_result->num_rows == 0) {
        // No card exists, so we can insert a new one
        $sql = "INSERT INTO virtual_cards (user_id, cardholder_name, card_pin, expiry_month, expiry_year, cvv, status) 
            VALUES ($user_id, '$cardholder_name', '$card_pin', '$expiry_month', $expiry_year, $cvv, 'inactive')";

        // Execute the query
        if ($conn->query($sql) === TRUE) {
            echo "New card inserted successfully!";
        } else {
            echo "Error: " . $conn->error;
        }
    } else {
        echo "A card already exists for this user.";
    }

}

// Close database connection
$conn->close();
