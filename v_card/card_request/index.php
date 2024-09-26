<?php
$page_name = 'My Card';
include_once (__DIR__ . '/../include/config.php');
include_once (__DIR__ . '/../header.php');
?>
<div class="row">
    <div class="col-lg-6">
        <?php include_once (__DIR__ . '/../card_request/card_template.php'); ?>
    </div>
</div>

<div class="form-container">
    <div class="field-container">
        <label for="name">Name</label>
        <input id="card_name" maxlength="20" type="text">
    </div>
    <div class="field-container">
        <label for="cardnumber">Card Number</label><span id="generatecard">generate random</span>
        <input id="card_number" type="text" pattern="[0-9]*" inputmode="numeric">
        <svg id="ccicon" class="ccicon" width="750" height="471" viewBox="0 0 750 471" version="1.1" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink">

        </svg>
    </div>
    <div class="field-container">
        <label for="expirationdate">Expiration (mm/yy)</label>
        <input id="expirationdate" type="text" pattern="[0-9]*" inputmode="numeric">
    </div>
    <div class="field-container">
        <label for="securitycode">Security Code</label>
        <input id="securitycode" type="text" pattern="[0-9]*" inputmode="numeric">
    </div>
</div>



<?php include_once (__DIR__ . '/../footer.php'); ?>


