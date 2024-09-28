<?php
// Start session
session_start();

// Check if the form was submitted via POST and if the user_logout variable is set
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['user_logout'])) {

    // Destroy all session variables
    $_SESSION = [];

    // Destroy the session itself
    session_destroy();

    // Redirect to the homepage or login page after logout
    header("Location: " . $base_url . "?a=logout");
    exit();
}
?>
