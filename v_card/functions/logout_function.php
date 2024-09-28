<?php
// Start session
session_start();

    // Destroy all session variables
    $_SESSION = [];

    // Destroy the session itself
    session_destroy();

    // Redirect to the homepage or login page after logout
    header("Location: ../../?a=logout");
    exit();

