{$page_name = 'Registration Completed'}
{$home_url = 'https://quantumledger.online/'}
{$site_url = 'https://account.quantumledger.online/'}
{$site_name = 'Quantum Ledger Financial System'}
{$site_logo = 'https://quantumledger.online/assets/imgs/qfs.png'}
{assign var="login_url" value="{$site_url}?a=login"}

{include file="auth_header.tpl"}

<section class="account-section bg--title" style="border-bottom: 1px solid #5f5f5f">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-8 col-xxl-6">
                <div class="account__wrapper bg--body">
                    <div class="account-logo text-center mb-4">
                        <a href="{$home_url}">
                            <img src="{$site_logo}" alt="{$site_name}">
                        </a>
                    </div>
                    <div class="card text-center">
                        <div class="card-body">
                            <h3 class="card-title">Registration Completed</h3>
                            <p class="card-text">
                                Thank you for joining our program.<br>
                                You are now an official member of this program. You can login to your account to start investing with us and use all the services that are available for our members.
                            </p>
                            <p class="card-text">
                                <strong>Important:</strong> Do not provide your login and password to anyone!
                            </p>
                            <a href="{$login_url}" class="cmn--btn w-100 justify-content-center text--white border-0">Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{include file="auth_footer.tpl"}
