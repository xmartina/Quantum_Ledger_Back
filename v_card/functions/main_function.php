<?php
include_once(__DIR__ . '/../include/config.php');

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

$page_url = $_SERVER['REQUEST_URI'];
if (strpos($page_url , 'v_card/auth') === false){
    session_start();
    if (!isset($_SESSION['username'])){
        header("location : ../?a=login");
    }
}