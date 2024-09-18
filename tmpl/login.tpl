{include file="auth_header.tpl"}

<section class="account-section bg--title" style="border-bottom: 1px solid #5f5f5f">
    <div class="container">
        <div class="row justify-content-center flex-wrap-reverse gy-4 align-items-center">
            <div class="col-lg-6 col-xl-5 col-xxl-4">
                <div class="section__title text--white text-center text-lg-start">
                    <span class="section__cate">Login to Get Started with {$settings.site_name}</span>
                    <h3 class="section__title">Your ease of mind is our priority</h3>
                    <p>Login into your account with your password or email</p>
                    <a href="{$settings.home_url}" class="cmn--btn btn-outline btn-sm mt-3"><i class="las la-angle-left"></i>Back to Home</a>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-5">
                <div class="account__wrapper bg--body">
                    <div class="account-logo">
                        <a href="{$settings.home_url}">
                            <img src="{$settings.logo_url}" alt="{$settings.site_name}">
                        </a>
                    </div>
                    <form class="account-form" action="{$settings.login_action_url}" method="post">
                        <input type="hidden" name="_token" value="{$settings.csrf_token}">
                        {if $errors}
                            <ul style="color:red">
                                {foreach from=$errors item=error}
                                    <li>{$error}</li>
                                {/foreach}
                            </ul>
                        {/if}
                        <div class="form--group">
                            <input type="text" name="identity" value="" class="form-control form--control" id="username">
                            <label for="identity" class="form--label prevent-select">Username or Email</label>
                        </div>
                        <div class="form--group">
                            <input type="password" name="password" class="form-control form--control" id="password">
                            <label for="password" class="form--label prevent-select">Password</label>
                        </div>
                        <div class="form--group checkgroup d-flex flex-row justify-content-between">
                            <div class="form-check">
                                <input class="form-check-input form--check-input" type="checkbox" id="check1">
                                <label class="form-check-label" for="check1">Remember Me</label>
                            </div>
                            <div>
                                <a href="{$settings.password_reset_url}" class="text--base">Forgot Your Password?</a>
                            </div>
                        </div>
                        <div class="form--group mb-4">
                            <button type="submit" class="cmn--btn w-100 justify-content-center text--white border-0">Sign In</button>
                        </div>
                        <div class="form--group mb-0 text-center">
                            Don't have an account? <a href="{$settings.registration_url}" class="text--base">Sign Up</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

{include file="auth_footer.tpl"}
