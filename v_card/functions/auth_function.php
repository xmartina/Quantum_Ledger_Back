<?php
session_start();

// If the user is already authenticated, redirect to v_card page
if (isset($_SESSION['username'])) {
header("Location: ../v_card");
exit();
}

include_once (__DIR__ . '/main_function.php');

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['card_auth'])) {
// Get the username from the form
$username = trim($_POST['username']);

// Check if the username is not empty
if (!empty($username)) {
// Prepare SQL query to find the username in the hm2_users table
$query = "SELECT username FROM hm2_users WHERE username = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $username);  // bind the username to the query
$stmt->execute();
$result = $stmt->get_result();

// If a row is returned, the username exists
if ($result->num_rows > 0) {
// Store the username in the session
$_SESSION['username'] = $username;

// Redirect to the v_card page
header("Location: ../v_card");
exit();
} else {
$error = "Invalid username!";
}
} else {
$error = "Please enter a username!";
}
}
