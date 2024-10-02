<?php
error_reporting(E_ALL); // Report all PHP errors
ini_set('display_errors', 1); // Display errors on the page
ini_set('display_startup_errors', 1);
if (!isset($_SESSION['username'])){
    header("location:". $base_url . "?a=login");
}
include_once (__DIR__ . '/main_function.php');
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


if (isset($_POST['request_card'])) {
    // Make sure the user_id is set and valid
    if (isset($user_id) && !empty($user_id)) {
        // Retrieve form data
        $cardholder_name = $_POST['card_user_name'];
        $currentMonth = date('m'); // Get current month
        $currentYear = date('Y'); // Get current year
        $expiry_month = $currentMonth;
        $expiry_year = $currentYear + 4;
        $cvv = $_POST['ccv_code'];
        $card_pin = $_POST['card_pin'];

        // Check if a card already exists for the user
        $check_query = "SELECT * FROM virtual_cards WHERE user_id = $user_id";
        $check_result = $conn->query($check_query);

        if ($check_result->num_rows == 0) {
            // No card exists, insert a new one
            $insert_sql = "INSERT INTO virtual_cards (user_id, cardholder_name, card_pin, expiry_month, expiry_year, cvv, status) 
                VALUES ($user_id, '$cardholder_name', '$card_pin', '$expiry_month', '$expiry_year', '$cvv', 'inactive')";

            // Execute the query
            if ($conn->query($insert_sql) === TRUE) {
                header("location:".$base_url."v_card/card_request/?success=new_card_inserted_successfully");
                echo "New card inserted successfully!";
            } else {
                echo "Error: " . $conn->error;
            }
        } else {
            header("location:".$base_url."v_card/?success=new_card_inserted_successfully");
            echo "A card already exists for this user.";
        }
    } else {
        echo "User ID is missing.";
    }
}



// Close database connection
$conn->close();
