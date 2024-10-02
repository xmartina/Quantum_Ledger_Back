<?php
session_start();  // Start the session
$page_name = 'Card Request';
include_once(__DIR__ . '/../functions/card_request_function.php');
include_once(__DIR__ . '/../partials/header.php');
?>
<div class="row">
    <div class="col-lg-6">
        <?php include_once(__DIR__ . '/../card_request/card_template.php'); ?>
    </div>
    <div class="col-lg-6">
        <form method="POST" action="">
            <div class="mb-3">
                <div class="row justify-content-center">
                    <div class="col-sm-10">
                        <div class="mb-3">
                            <label for="card_name" class="form-label"><?= $username ?> Name</label>
                            <input id="card_name" maxlength="20" name="card_user_name" type="text" class="form-control">
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="expirationdate" class="form-label">Expiration (mm/yy)</label>
                                    <input id="expirationdate" type="text" name="<?= $expirationDate ?>"
                                           value="<?php echo $expirationDate; ?>" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="securitycode" class="form-label">Security Code</label>
                                    <input id="securitycode" type="text" pattern="[0-9]*" inputmode="numeric"
                                           class="form-control" name="<?= $ccv_code ?>" value="<?php echo $ccv_code; ?>"
                                           readonly>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="card_pin" class="form-label">Enter Your Card Pin</label>
                            <input id="card_pin" minlength="4" maxlength="5" name="card_pin" type="text" class="form-control" required>
                        </div>
                        <div class="col-sm-5">
                            <button type="submit" class="w-100 btn btn-primary" name="card_auth">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<?php include_once(__DIR__ . '/../partials/footer.php'); ?>


