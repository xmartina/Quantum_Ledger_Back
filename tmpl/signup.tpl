{$page_name = 'Register'}
{$home_url = 'https://quantumledger.online/'}
{$site_url = 'https://account.quantumledger.online/'}
{$site_name = 'Quantum Ledger Financial System'}
{$site_logo = 'https://quantumledger.online/assets/imgs/qfs.png'}
{assign var="login_url" value="{$site_url}?a=login"}
{assign var="favicon_url" value="{$home_url}assets/imgs/qfsicon.png"}

{include file="auth_header.tpl"}

{literal}
<script language="javascript">
    function checkform() {
        if (document.regform.fullname.value == '') {
            alert("Please enter your full name!");
            document.regform.fullname.focus();
            return false;
        }
        {/literal}
        {if $settings.use_user_location == 1}
        {literal}
        if (document.regform.address.value == '') {
            alert("Please enter your address!");
            document.regform.address.focus();
            return false;
        }
        if (document.regform.city.value == '') {
            alert("Please enter your city!");
            document.regform.city.focus();
            return false;
        }
        if (document.regform.state.value == '') {
            alert("Please enter your state!");
            document.regform.state.focus();
            return false;
        }
        if (document.regform.zip.value == '') {
            alert("Please enter your ZIP!");
            document.regform.zip.focus();
            return false;
        }
        if (document.regform.country.options[document.regform.country.selectedIndex].text == '--SELECT--') {
            alert("Please choose your country!");
            document.regform.country.focus();
            return false;
        }
        {/literal}
        {/if}
        {literal}
        if (document.regform.username.value == '') {
            alert("Please enter your username!");
            document.regform.username.focus();
            return false;
        }
        if (!document.regform.username.value.match(/^[A-Za-z0-9_\-]+$/)) {
            alert("For username you should use English letters and digits only!");
            document.regform.username.focus();
            return false;
        }
        if (document.regform.password.value == '') {
            alert("Please enter your password!");
            document.regform.password.focus();
            return false;
        }
        if (document.regform.password.value != document.regform.password2.value) {
            alert("Please check your password!");
            document.regform.password2.focus();
            return false;
        }
        {/literal}
        {if $settings.use_transaction_code}
        {literal}
        if (document.regform.transaction_code.value == '') {
            alert("Please enter your transaction code!");
            document.regform.transaction_code.focus();
            return false;
        }
        if (document.regform.transaction_code.value != document.regform.transaction_code2.value) {
            alert("Please check your transaction code!");
            document.regform.transaction_code2.focus();
            return false;
        }
        {/literal}
        {/if}
        {literal}
        if (document.regform.email.value == '') {
            alert("Please enter your e-mail address!");
            document.regform.email.focus();
            return false;
        }
        if (document.regform.email.value != document.regform.email1.value) {
            alert("Please retype your e-mail!");
            document.regform.email.focus();
            return false;
        }

        if (document.regform.agree.checked == false) {
            alert("You have to agree with the Terms and Conditions!");
            return false;
        }

        return true;
    }
</script>
{/literal}

<section class="account-section bg--title" style="border-bottom: 1px solid #5f5f5f">
    <div class="container">
        <div class="row justify-content-center flex-wrap-reverse gy-4 align-items-center">
            <div class="col-lg-6 col-xl-5 col-xxl-4">
                <div class="section__title text--white text-center text-lg-start">
                    <span class="section__cate">Register to Get Started with {$site_name}</span>
                    <h3 class="section__title">Your ease of mind is our priority</h3>
                    <p>Create your account to start using our services</p>
                    <a href="{$site_url}" class="cmn--btn btn-outline btn-sm mt-3">
                        <i class="las la-angle-left"></i> Back to Home
                    </a>
                </div>
            </div>
            <div class="col-lg-6 col-xxl-5">
                <div class="account__wrapper bg--body">
                    <div class="account-logo">
                        <a href="{$home_url}">
                            <img src="{$site_logo}" alt="{$site_name}">
                        </a>
                    </div>
                    {if $deny_registration}
                        <p>We are closed for new registrations now.</p>
                    {elseif $settings.use_referal_program && $settings.force_upline && !$referer && !$settings.get_rand_ref}
                        <p>You do not have an upline. Our system requires an upline for each user.</p>
                    {else}
                        {if $errors}
                            <ul style="color:red">
                                {foreach from=$errors item=error}
                                    <li>{$error}</li>
                                {/foreach}
                            </ul>
                        {/if}
                        <form class="account-form" method="post" name="regform" onsubmit="return checkform()">
                            <input type="hidden" name="a" value="signup">
                            <input type="hidden" name="action" value="signup">

                            <div class="form--group">
                                <input type="text" name="fullname" value="{$frm.fullname|escape:"quotes"}" class="form-control form--control" id="fullname">
                                <label for="fullname" class="form--label prevent-select">Your Full Name</label>
                            </div>

                            {if $settings.use_user_location}
                                <div class="form--group">
                                    <input type="text" name="address" value="{$frm.address|escape:"quotes"}" class="form-control form--control" id="address">
                                    <label for="address" class="form--label prevent-select">Your Address</label>
                                </div>
                                <div class="form--group">
                                    <input type="text" name="city" value="{$frm.city|escape:"quotes"}" class="form-control form--control" id="city">
                                    <label for="city" class="form--label prevent-select">Your City</label>
                                </div>
                                <div class="form--group">
                                    <input type="text" name="state" value="{$frm.state|escape:"quotes"}" class="form-control form--control" id="state">
                                    <label for="state" class="form--label prevent-select">Your State</label>
                                </div>
                                <div class="form--group">
                                    <input type="text" name="zip" value="{$frm.zip|escape:"quotes"}" class="form-control form--control" id="zip">
                                    <label for="zip" class="form--label prevent-select">Your Zip</label>
                                </div>
                                <div class="form--group">
                                    <select name="country" class="form-control form--control">
                                        <option value="">--SELECT--</option>
                                        {section name=c loop=$countries}
                                            <option value="{$countries[c].name|escape:"quotes"}" {if $countries[c].name eq $frm.country}selected{/if}>{$countries[c].name|escape:"quotes"}</option>
                                        {/section}
                                    </select>
                                    <label for="country" class="form--label prevent-select">Your Country</label>
                                </div>
                            {/if}

                            <div class="form--group">
                                <input type="text" name="username" value="{$frm.username|escape:"quotes"}" class="form-control form--control" id="username">
                                <label for="username" class="form--label prevent-select">Your Username</label>
                            </div>

                            <div class="form--group">
                                <input type="password" name="password" value="" class="form-control form--control" id="password">
                                <label for="password" class="form--label prevent-select">Define Password</label>
                            </div>

                            <div class="form--group">
                                <input type="password" name="password2" value="" class="form-control form--control" id="password2">
                                <label for="password2" class="form--label prevent-select">Retype Password</label>
                            </div>

                            {if $settings.use_transaction_code}
                                <div class="form--group">
                                    <input type="password" name="transaction_code" value="" class="form-control form--control" id="transaction_code">
                                    <label for="transaction_code" class="form--label prevent-select">Define Transaction Code</label>
                                </div>

                                <div class="form--group">
                                    <input type="password" name="transaction_code2" value="" class="form-control form--control" id="transaction_code2">
                                    <label for="transaction_code2" class="form--label prevent-select">Retype Transaction Code</label>
                                </div>
                            {/if}

                            {foreach from=$pay_accounts item=ps}
                                <div class="form--group">
                                    <input type="text" name="pay_account[{$ps.id}]" value="{$ps.account|escape:html}" class="form-control form--control" data-validate="{$ps.validate.func}" data-validate-{$ps.validate.func}="{$ps.validate[$ps.validate.func]}" data-validate-notice="{$ps.validate.notification|escape:html}">
                                    <label for="pay_account[{$ps.id}]" class="form--label prevent-select">Your {$ps.name} Account</label>
                                </div>
                            {/foreach}

                            {foreach item=p from=$mpay_accounts}
                                {foreach item=ps from=$p.accounts}
                                    <div class="form--group">
                                        <input type="text" name="pay_account[{$p.id}][{$ps.name|escape:html}]" value="{$ps.value|escape:html}" class="form-control form--control">
                                        <label for="pay_account[{$p.id}][{$ps.name|escape:html}]" class="form--label prevent-select">Your {$p.name} {$ps.name}</label>
                                    </div>
                                {/foreach}
                            {/foreach}

                            <div class="form--group">
                                <input type="text" name="email" value="{$frm.email|escape:"quotes"}" class="form-control form--control" id="email">
                                <label for="email" class="form--label prevent-select">Your E-mail Address</label>
                            </div>

                            <div class="form--group">
                                <input type="text" name="email1" value="{$frm.email1|escape:"quotes"}" class="form-control form--control" id="email1">
                                <label for="email1" class="form--label prevent-select">Retype Your E-mail</label>
                            </div>

                            <div class="form--group">
                                <input type="text" name="sq" value="{$frm.sq|escape:"quotes"}" class="form-control form--control" id="sq">
                                <label for="sq" class="form--label prevent-select">Secret Question</label>
                            </div>

                            <div class="form--group">
                                <input type="text" name="sa" value="{$frm.sa|escape:"quotes"}" class="form-control form--control" id="sa">
                                <label for="sa" class="form--label prevent-select">Secret Answer</label>
                            </div>

                            {if $settings.use_referal_program}
                                {if $referer}
                                    <div class="form--group">
                                        <p>Your Upline: {$referer.name} ({$referer.username})</p>
                                    </div>
                                {else}
                                    {if $settings.force_upline}
                                        {if $settings.get_rand_ref}
                                            <div class="form--group">
                                                <p>You do not have an upline. Our system requires an upline for each user. You'll have to agree to get a random one or find a referral link on the net.</p>
                                                <input type="checkbox" name="rand_ref" value="1"> Agree to random upline
                                            </div>
                                        {else}
                                            <div class="form--group">
                                                <p>You do not have an upline. Our system requires an upline for each user.</p>
                                            </div>
                                        {/if}
                                    {/if}
                                {/if}
                            {/if}

                            <div class="form--group checkgroup">
                                <div class="form-check">
                                    <input type="checkbox" name="agree" value="1" {if $frm.agree}checked{/if} class="form-check-input" id="agree">
                                    <label class="form-check-label" for="agree">I agree with <a href="{"?a=rules"|encurl}">Terms and Conditions</a></label>
                                </div>
                            </div>

                            {if $ti.check.signup}
                                <div class="form--group">
                                    <img src="{"?a=show_validation_image&`$ti.session.name`=`$ti.session.id`&rand=`$ti.session.rand`"|encurl}">
                                    <input type="text" name="validation_number" class="form-control form--control">
                                </div>
                            {/if}

                            <div class="form--group mb-4">
                                <button type="submit" class="cmn--btn w-100 justify-content-center text--white border-0">Register</button>
                            </div>
                            <div class="form--group mb-0 text-center">
                                Already have an account? <a href="{$login_url}" class="text--base">Sign In</a>
                            </div>
                        </form>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</section>

{include file="auth_footer.tpl"}
