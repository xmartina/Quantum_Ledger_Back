<?php
include_once(__DIR__ . '/../include/config.php');

session_start();  // Start the session

$page_url = $_SERVER['REQUEST_URI'];

// Only redirect to login if the URL is not related to authentication and the user is not logged in
if (
    strpos($page_url, 'v_card') &&
    strpos($page_url, 'card_request')
) {
    if (!isset($_SESSION['username'])) { ?>
        <script type="text/javascript">
            window.location.href = "<?= $base_url ?>?a=login";
        </script>
<?php
        exit();  // Ensure the script stops after redirection
    }
}
