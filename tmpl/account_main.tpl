{$page_name = 'Dashboard'}
{$external_base_url = "https://qfsholdings.io/"}
{$base_url = "https://account.quantumledger.online/"}
{$home_url = "https://quantumledger.online/"}
{$home_url = 'https://quantumledger.online/'}
{$site_url = 'https://account.quantumledger.online/'}
{$site_name = 'Quantum Ledger Financial System'}
{$site_logo = 'https://quantumledger.online/assets/imgs/qfs.png'}
{assign var="login_url" value="{$site_url}?a=login"}
{assign var="favicon_url" value="{$home_url}assets/imgs/qfsicon.png"}

{include file="back_header.tpl"}
<!-- Main Content -->
<!-- Main Content -->
<div id="firebase-app" class="main-content" style="min-height: 556px;">
    <section class="section wallet-section">
        <div class="section-header"><h1>Dashboard</h1></div>
    </section>

    <!-- Display User Messages -->
    {if $userinfo.umessages}
        <div class="alert alert-info">
            <ul>
                {foreach from=$userinfo.umessages item=m}
                    <li>{$m.text|escape:'html'|nl2br}</li>
                {/foreach}
            </ul>
        </div>
    {/if}

    <!-- Note About Transaction Code -->
    {if $settings.use_transaction_code ==1 && $userinfo.transaction_code == ''}
        <div class="alert alert-warning">
            <b>Note:</b> Currently you have not specified a Transaction code. The Transaction code strengthens your funds security in our system. The code is required to withdraw funds from your account{if $settings.internal_transfer_enabled} and for internal transfer to another user account{/if}. Just do not change 'Transaction code' in your account information if you do not want to use this feature. <a href="?a=edit_account">Click here</a> to specify a new transaction code.
        </div>
    {/if}

    <!-- Main Content Replacement -->
    <div class="row">
        <!-- Left Column -->
        <div class="col-lg-8 mb-4 order-0">
            <!-- Welcome Card -->
            <div class="card mb-4">
                <div class="d-flex align-items-end row">
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title text-primary">Welcome {$userinfo.name}! 🎉</h5>
                            <p class="mb-">
                                We are delighted to have you, and we hope you will have a great stay with us!
                            </p>
                            <a href="{$base_url}?a=deposit" class="btn btn-outline-primary">Add Fund</a>
                        </div>
                    </div>
                    <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4 text-right">
                            <img src="{$base_url}assets/img/illustrations/man-with-laptop-light.png" height="140" alt="Welcome Image">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Quick Links -->
            <div class="card">
                <div class="card-header"><h5>Quick Links</h5></div>
                <div class="card-body">
                    <div class="row">
                        <!-- Quick Link Items -->
                        {foreach from=$quick_links item=link}
                            <div class="col-xl-2 col-lg-4 col-md-3 col-6">
                                <div class="quick-link text-center">
                                    <a href="{$base_url}{$link.url}" class="btn btn-icon icon-left btn-primary py-3 w-100">
                                        <div class="icon"><i class="{$link.icon}"></i></div>
                                        <span>{$link.label}</span>
                                    </a>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        <!-- Right Column -->
        <div class="col-lg-4 col-md-12 order-1">
            <div class="row">
                <!-- Wallet Cards -->
                {foreach from=$wallets item=wallet}
                    <div class="col-lg-6 col-md-4 col-sm-6">
                        <div class="card wallet-card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-start justify-content-between">
                                    <div class="avatar d-flex align-items-center justify-content-center text-white">
                                        <img src="{$wallet.logo_url}" alt="{$wallet.symbol}">
                                    </div>
                                </div>
                                <span>{$wallet.name}</span>
                                <h3 class="card-title text-nowrap my-2">{$wallet.symbol} {$wallet.balance}</h3>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>

    <!-- Additional Content -->
    <!-- Include any other content or sections you need here -->
</div>


{include file="back_footer.tpl"}