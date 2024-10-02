<?php
session_start();  // Start the session
$page_name = 'Card Request';
include_once(__DIR__ . '/../functions/card_request_function.php');
include_once(__DIR__ . '/../partials/header.php');
?>
<?php
// Check if 'success' is set in the URL parameters
if (isset($_GET['success']) && $_GET['success'] == 'new_card_inserted_successfully') {
    echo '
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        New card request submitted successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>';
} elseif (isset($_GET['error']) && $_GET['error'] == 'card_exists') {
    echo '
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        A card already exists for this user.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>';
} elseif (isset($_GET['error']) && $_GET['error'] == 'missing_user_id') {
    echo '
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        User ID is missing.
    </div>';
} ?>
<div class="row remove_block">

    <div class="col-lg-6">
        <?php include_once(__DIR__ . '/../card_request/card_template.php'); ?>
    </div>
    <div class="col-lg-6">
        <form method="POST" action="">
            <div class="mb-3">
                <div class="row justify-content-center">
                    <div class="col-sm-10">
                        <div class="mb-3">
                            <label for="card_name" class="form-label">Cardholder Name</label>
                            <input id="card_name" maxlength="20" name="card_user_name" type="text" class="form-control" required>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="expirationdate" class="form-label">Expiration (mm/yy)</label>
                                    <input id="expirationdate" type="text" name="expirationDate" value="<?php echo date('m/y'); ?>" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="securitycode" class="form-label">Security Code</label>
                                    <input id="securitycode" type="text" name="ccv_code" class="form-control" required maxlength="3">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="card_pin" class="form-label">Enter Your Card Pin</label>
                            <input id="card_pin" minlength="4" maxlength="6" name="card_pin" type="text" class="form-control" required>
                        </div>
                        <div class="col-sm-5">
                            <button type="submit" class="w-100 btn btn-primary" name="request_card">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>

<?php include_once(__DIR__ . '/../partials/footer.php'); ?>


