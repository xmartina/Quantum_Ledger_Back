<?php
$page_name = 'Card Auth';
include_once(__DIR__ . '/../functions/auth.php');
include_once(__DIR__ . '/../partials/header.php'); ?>

<form class="account-form" method="post" action="">
<?php if (!empty($errors)): ?>
    <ul style="color:red">
        <?php foreach ($errors as $error): ?>
            <li><?= $error ?></li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>
<div class="form--group">
    <input type="password" name="password" value="" class="form-control form--control" id="password">
    <label for="password" class="form--label prevent-select">Password</label>
</div>
<div class="form--group checkgroup d-flex flex-row justify-content-between">
    <div class="form-check">
        <input class="form-check-input form--check-input" type="checkbox" id="check1">
        <label class="form-check-label" for="check1">Remember Me</label>
    </div>
</div>
<div class="form--group mb-4">
    <button type="submit" value="Login" class="cmn--btn w-100 justify-content-center text--white border-0">Sign In
    </button>
</div>
</form>

<?php include_once(__DIR__ . '/../partials/footer.php'); ?>
