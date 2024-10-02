<?php
ob_start();
session_start(); // Ensure the session is started
include_once(__DIR__ . '/main_function.php');

$page_url = $_SERVER['REQUEST_URI'];

// Check if 'auth' is in the URL
if (strpos($page_url, 'auth') !== false) {
    // Do nothing; skip the next block of code
} else { // If 'auth' is not found, check the next condition
    if (
        strpos($page_url, 'v_card') !== false || // Check if 'v_card' is found
        strpos($page_url, 'card_request') !== false // Check if 'card_request' is found
    ) {
        if (!isset($_SESSION['username'])) { // If not authenticated
            ?>
            <script type="text/javascript">
                window.location.href = "<?= $base_url ?>?a=login"; // Redirect to login
            </script>
            <?php
            exit();  // Ensure the script stops after redirection
        }
    }
}

// Check if the request method is POST and the form is submitted
if (isset($_POST['card_auth'])) {
    // Get the username from the form
    $username = trim($_POST['username']);

    // Check if the username is not empty
    if (!empty($username)) {
        // Prepare SQL query to find the username in the hm2_users table
        $query = "SELECT id, username FROM hm2_users WHERE username = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("s", $username);  // bind the username to the query
        $stmt->execute();
        $result = $stmt->get_result();

        // If a row is returned, the username exists
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc(); // Fetch the row

            // Store the user_id and username in the session
            $_SESSION['user_id'] = $row['id'];
            $user_id = $_SESSION['user_id'];
            $_SESSION['username'] = $row['username'];
            header("Location: " . $base_url . "v_card");
            // Redirect to the v_card page
            exit();  // Always stop script execution after redirection
        } else { ?>
            <script type="text/javascript">
                window.location.assign('<?= $base_url ?>v_card/auth/?error=invalid_username'); // Redirect with error
            </script>
            <?php
            exit();  // Stop script execution after redirect
        }
    } else { ?>
        <script type="text/javascript">
            window.location.assign('<?= $base_url ?>v_card/auth/?error=enter_a_username'); // Redirect with error
        </script>
        <?php
        exit();  // Stop script execution after redirect
    }
}

ob_end_flush();
