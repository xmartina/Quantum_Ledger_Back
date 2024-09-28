<?php
$page_name = 'Card Auth';
include_once(__DIR__ . '/../functions/auth_function.php');
include_once(__DIR__ . '/../partials/header.php'); ?>

<div class="row">
    <style>
        .auth-card-form{
            background-color: #493011;
        }
    </style>
    <div class="offset-3 shadow-sm rounded col-lg-5 px-5 py-5 auth-card-form ">
        <div class="">
            <form class="account-form" method="post" action="../functions/auth_function.php">
                <?php if (!empty($errors)): ?>
                    <ul style="color:red">
                        <?php foreach ($errors as $error): ?>
                            <li><?= $error ?></li>
                        <?php endforeach; ?>
                    </ul>
                <?php endif; ?>
                <div class="form--group">
                    <input type="password" name="username" value="" class="form-control form--control " id="password">
                    <label for="username" class="form--label text-white prevent-select">Input Your Username to Authenticate</label>

                </div>
                <div class="form--group d-flex justify-content-center mb-4 pt-4">
                    <button type="submit" class="rounded btn cmn--btn w-75 justify-content-center text--white border-0" name="card_auth">Authenticate
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php include_once(__DIR__ . '/../partials/footer.php'); ?>
