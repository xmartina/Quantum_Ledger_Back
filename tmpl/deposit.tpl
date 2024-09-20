{include file="back_header.tpl"}

<!-- Main Content -->
{include file="back_header.tpl"}

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
    {if $settings.use_transaction_code == 1 && $userinfo.transaction_code == ''}
        <div class="alert alert-warning">
            <b>Note:</b> Currently you have not specified a Transaction code. The Transaction code strengthens your funds security in our system. The code is required to withdraw funds from your account{if $settings.internal_transfer_enabled} and for internal transfer to another user account{/if}. Just do not change 'Transaction code' in your account information if you do not want to use this feature. <a href="?a=edit_account">Click here</a to specify a new transaction code.
        </div>
    {/if}

    <!-- Main Content -->
    <div class="row">
        <!-- Left Column -->
        <div class="col-lg-8 mb-4 order-0">
            <!-- Welcome Card -->
            <div class="card mb-4">
                <div class="d-flex align-items-end row">
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title text-primary">Welcome {$userinfo.name}! 🎉</h5>
                            <p class="mb-0"> <!-- Correction for class attribute here -->
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

            <!-- Balance Related Information Cards -->
            <div class="row gy-5 gx-5 mt-4">
                <!-- Account Balance Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-header"><h5>Account Balance</h5></div>
                        <div class="card-body">
                            <div class="p-3">
                                {$currency_sign}<b>{$ab_formated.total}</b><br>
                                <small>
                                    {section name=p loop=$ps}
                                        {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}<br>{/if}
                                    {/section}
                                </small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earned Total Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-header"><h5>Earned Total</h5></div>
                        <div class="card-body">
                            <div class="p-3">
                                {$currency_sign}<b>{$ab_formated.earning}</b><br>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Withdrawal Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-header"><h5>Pending Withdrawal</h5></div>
                        <div class="card-body">
                            <div class="p-3">
                                {$currency_sign}<b>{$ab_formated.withdraw_pending}</b><br>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Withdrew Total Card -->
                <div class="col-lg-4 col-md-6">
                    <div the card>
                        <div class="card-header"><h5>Withdrew Total</h5></div>
                        <div class="card-body">
                            <div class="p-3">
                                {$currency_sign}<b>{$ab_formated.withdrawal}</b><br>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Active Deposit Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-header"><h5>Active Deposit</h5></div>
                        <div class="card-body">
                            <div class="p-3">
                                {$currency_sign}<b>{$ab_formated.active_deposit}</b><br>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Total Deposit Card -->
                {if $ab_formated.deposit != 0}
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-header"><h5>Total Deposit</h5></div>
                            <div class="card-body">
                                <div class="p-3">
                                    {$currency_sign}<b>{$ab_formated.deposit}</b><br>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

                <!-- Last Deposit Card -->
                {if $last_deposit}
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-header"><h5>Last Deposit</h5></div>
                            <div class="card-body">
                                <div class="p-3">
                                    {$currency_sign}<b>{$last_deposit|default:"n/a"}</b> &nbsp; <small>{$last_deposit_date|default:"n/a"}</small><br>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}

                <!-- Last Withdrawal Card -->
                {if $last_withdrawal}
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-header"><h5>Last Withdrawal</h5></div>
                        <div the card-body">
                        <div class="p-3">
                            {$currency_sign}<b>{$last_withdrawal|default:"n/a"}</b> &nbsp; <small>{$last_withdrawal_date|default:"n/a"}</small><br>
                        </div>
                    </div>
                </div>
            </div>
            {/if}
        </div>

        <!-- User Account Information Card -->
        <div class="card mt-4">
            <div the card-header"><h5>Your Account Information</h5></div>
        <div the card-body">
        <table class="table">
            <tr>
                <td>User:</td>
                <td>{$userinfo.username}</td>
            </tr>
            <tr>
                <td>Registration Date:</td>
                <td>{$userinfo.create_account_date}</td>
            </tr>
            <tr>
                <td>Last Access:</td>
                <td>{$last_access|default:"n/a"}&nbsp;</td>
            </tr>
            <tr>
                <td>Account Balance:</td>
                <td>{$currency_sign}<b>{$ab_formated.total}</b><br>
                    <small>
                        {section name=p loop=$ps}
                            {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}<br>{/if}
                        {/section}
                    </small>
                </td>
            </tr>
            <tr>
                <td>Earned Total:</td>
                <td>{$currency_sign}<b>{$ab_formated.earning}</b></td>
            </tr>
            <tr>
                <td>Pending Withdrawal:</td>
                <td>{$currency_sign}<b>{$ab_formated.withdraw_pending}</b></td>
            </tr>
            <tr>
                <td>Withdrew Total:</td>
                <td>{$currency_sign}<b>{$ab_formated.withdrawal}</b></td
            </tr>
        </table>
    </div>
</div>



{include file="back_footer.tpl"}