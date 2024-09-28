<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['user_logout'])) {

// Destroy all session variables
    $_SESSION = [];

// Destroy the session itself
    session_destroy();
    if (true){
    ?>
    <script type="text/javascript">
        window.location.assign('<?= $base_url ?>?a=logout');
    </script>
    <?php }
    exit();
}