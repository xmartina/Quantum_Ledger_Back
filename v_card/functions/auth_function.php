<?php
ob_start();
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
        if (!isset($_SESSION['username'])) { ?>
            <script type="text/javascript">
                window.location.href = "<?= $base_url ?>?a=login";
            </script>
            <?php
            exit();  // Ensure the script stops after redirection
        }
    }
}

// If the user is already authenticated, redirect to v_card
if (isset($_SESSION['username'])) { ?>
    <script type="text/javascript">
        window.location.href = "<?= $base_url ?>v_card";
    </script>
    <?php
    exit();  // Make sure to stop executing PHP after redirect
}

// Check if the request method is POST and the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['card_auth'])) {
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
            $_SESSION['username'] = $row['username'];

            // Redirect to the v_card page
            ?>
            <script type="text/javascript">
                window.location.assign('<?= $base_url ?>v_card');
            </script>
            <?php
            exit();  // Always stop script execution after redirection
        } else { ?>
            <script type="text/javascript">
                window.location.assign('<?= $base_url ?>v_card/auth/?error=invalid_username');
            </script>
            <?php
            exit();  // Stop script execution after redirect
        }
    } else { ?>
        <script type="text/javascript">
            window.location.assign('<?= $base_url ?>v_card/auth/?error=enter_a_username');
        </script>
        <?php
        exit();  // Stop script execution after redirect
    }
}

ob_end_flush();