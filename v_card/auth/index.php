<?php
$page_name = 'Login';
include_once (__DIR__ . '/../functions/auth.php');
include_once (__DIR__ . '/../partials/header.php'); ?>

<form class="account-form" method="post" name="mainform" onsubmit="return checkform()">
    <input type="hidden" name="a" value="do_login">
    <input type="hidden" name="follow" value="<?= $frm['follow'] ?>">
    <input type="hidden" name="follow_id" value="<?= $frm['follow_id'] ?>">
    <?php if (!empty($errors)): ?>
        <ul style="color:red">
            <?php foreach ($errors as $error): ?>
                <li><?= $error ?></li>
            <?php endforeach; ?>
        </ul>
    <?php endif; ?>
    <div class="form--group">
        <input type="text" name="username" value="<?= htmlspecialchars($frm['username'], ENT_QUOTES, 'UTF-8') ?>" class="form-control form--control" id="username">
        <label for="identity" class="form--label prevent-select">Username </label>
    </div>
    <div class="form--group">
        <input type="password" name="password" value="" class="form-control form--control" id="password">
        <label for="password" class="form--label prevent-select">Password</label>
    </div>
    <div class="form--group checkgroup d-flex flex-row justify-content-between">
        <?php if (!empty($ti['check']['login'])): ?>
            <tr>
                <td class="menutxt"><img src="<?= encurl("?a=show_validation_image&{$ti['session']['name']}={$ti['session']['id']}&rand={$ti['session']['rand']}") ?>"></td>
                <td><input type="text" name="validation_number" class="inpts" size="30"></td>
            </tr>
        <?php endif; ?>
        <div class="form-check">
            <input class="form-check-input form--check-input" type="checkbox" id="check1">
            <label class="form-check-label" for="check1">Remember Me</label>
        </div>
        <div>
            <a href="<?= encurl("?a=forgot_password") ?>" class="text--base">Forgot Your Password?</a>
        </div>
    </div>
    <div class="form--group mb-4">
        <button type="submit" value="Login" class="cmn--btn w-100 justify-content-center text--white border-0">Sign In</button>
    </div>
    <div class="form--group mb-0 text-center">
        Don't have an account? <a href="<?= $registration_url ?>" class="text--base">Sign Up</a>
    </div>
</form>

<?php include_once (__DIR__ . '/../partials/footer.php'); ?>
