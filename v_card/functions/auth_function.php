<?php
session_start();

include_once(__DIR__ . '/main_function.php');

if (isset($_SESSION['username'])) { ?>
    <script type="text/javascript">
        window.location.href = "<?= $base_url ?>v_card";
    </script>
<?php }

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
            { ?>

                <script type="text/javascript">
                    window.location.href = "<?= $base_url ?>v_card";
                </script>

            <?php }
            exit();
        } else { ?>

            <script type="text/javascript">
                window.location.href = "<?= $base_url ?>v_card/auth?=invalid_username";
            </script>
       <?php }
    } else { ?>
        <script type="text/javascript">
            window.location.href = "<?= $base_url ?>v_card/auth?=enter_a_username";
        </script>
   <?php }
}
