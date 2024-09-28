<?php
$page_name = 'Login';
include_once (__DIR__ . '/../functions/auth.php');
include_once (__DIR__ . '/../partials/header.php'); ?>

<section class="account-section bg--title" style="border-bottom: 1px solid #5f5f5f">
    <div class="container">
        <div class="row justify-content-center flex-wrap-reverse gy-4 align-items-center">
            <div class="col-lg-6 col-xl-5 col-xxl-4">
                <div class="section__title text--white text-center text-lg-start">
                    <span class="section__cate">Login to Get Started with <?= $site_name ?></span>
                    <h3 class="section__title">Your ease of mind is our priority</h3>
                    <p>Login into your account with your username and password</p>
                    <a href="<?= $site_url ?>" class="cmn--btn btn-outline btn-sm mt-3"><i class="las la-angle-left"></i>Back to Home</a>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-5">
                <div class="account__wrapper bg--body">
                    <div class="account-logo">
                        <a href="<?= $home_url ?>">
                            <img src="<?= $site_logo ?>" alt="<?= $site_name ?>">
                        </a>
                    </div>
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
                </div>
            </div>
        </div>
    </div>
</section>

<?php include_once (__DIR__ . '/../partials/footer.php'); ?>
