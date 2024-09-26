<?php
$page_name = 'My Card';
include_once(__DIR__ . '/../include/config.php');
include_once(__DIR__ . '/../header.php');
?>
<div class="row">
    <div class="col-lg-6">
        <?php include_once(__DIR__ . '/../card_request/card_template.php'); ?>
    </div>
    <div class="col-lg-6">
        <form>
            <div class="mb-3">
                <div class="row justify-content-center">
                    <div class="col-sm-10">
                        <div class="mb-3">
                            <label for="card_name" class="form-label">Name</label>
                            <input id="card_name" maxlength="20" type="text" class="form-control">
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="expirationdate" class="form-label">Expiration (mm/yy)</label>
                                    <input id="expirationdate" type="text" value="<?php echo $expirationDate; ?>" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="securitycode" class="form-label">Security Code</label>
                                    <input id="securitycode" type="text" pattern="[0-9]*" inputmode="numeric" class="form-control" value="<?php echo $ccv_code; ?>" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

    </div>
</div>

<?php include_once(__DIR__ . '/../footer.php'); ?>


