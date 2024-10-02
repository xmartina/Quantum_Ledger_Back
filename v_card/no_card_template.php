<?php
// Fetch card status from the database for the current user
$check_query = "SELECT * FROM virtual_cards WHERE user_id = " . $_SESSION['user_id'];
$check_result = $conn->query($check_query);

// Fetch the status row
$status_row = $check_result->fetch_assoc();
$card_status = isset($status_row['status']) ? $status_row['status'] : 'not_applied'; // Set a default if no status

?>
<div class="row">
    <div class="col-lg-6 offset-lg-3">
        <div class="wrapper p-4 d-flex justify-content-center flex-row align-items-center bg-white rounded shadow-sm">

            <?php if ($card_status == 'inactive') { ?>
                <!-- Card is pending approval -->
                <div class="card text-center mt-5">
                    <div class="card-header h4 font-weight-bold text-danger">
                        Your Card is Pending Approval
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            Your card will appear here when approved.
                        </p>
                    </div>
                </div>

            <?php } elseif ($card_status == 'not_applied' || $check_result->num_rows == 0) { ?>
                <!-- No card applied for -->
                <div class="h4 text-dark mb-4">
                    You don't have any virtual card.
                </div>
                <div class="d-flex w-50 justify-content-center">
                    <div onclick="location.href='<?= $base_url ?>card_request'" class="btn btn-warning px-3 py-3 text-center">
                        Apply for Card
                    </div>
                </div>

            <?php } ?>
        </div>
    </div>
</div>
