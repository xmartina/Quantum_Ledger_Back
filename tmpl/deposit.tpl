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
    {if $settings.use_transaction_code ==1 && $userinfo.transaction_code == ''}
        <div class="alert alert-warning">
            <b>Note:</b> Currently you have not specified a Transaction code. The Transaction code strengthens your funds security in our system. The code is required to withdraw funds from your account{if $settings.internal_transfer_enabled} and for internal transfer to another user account{/if}. Just do not change 'Transaction code' in your account information if you do not want to use this feature. <a href="?a=edit_account">Click here</a> to specify a new transaction code.
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
                    <div class="card">
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
                            <div class="card-body">
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
                <div class="card-header"><h5>Your Account Information</h5></div>
                <div class="card-body">
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
                            <td>{$currency_sign}<b>{$ab_formated.withdrawal}</b></td>
                        </tr>
                        <tr>
                            <td>Active Deposit:</td>
                            <td>{$currency_sign}<b>{$ab_formated.active_deposit}</b></td>
                        </tr>
                        {if $last_deposit}
                            <tr>
                                <td>Last Deposit:</td>
                                <td>{$currency_sign}<b>{$last_deposit|default:"n/a"}</b> &nbsp; <small>{$last_deposit_date|default:"n/a"}</small></td>
                            </tr>
                        {/if}
                        {if $ab_formated.deposit != 0}
                            <tr>
                                <td>Total Deposit:</td>
                                <td>{$currency_sign}<b>{$ab_formated.deposit}</b></td>
                            </tr>
                        {/if}
                        {if $last_withdrawal}
                            <tr>
                                <td>Last Withdrawal:</td>
                                <td>{$currency_sign}<b>{$last_withdrawal|default:"n/a"}</b> &nbsp; <small>{$last_withdrawal_date|default:"n/a"}</small></td>
                            </tr>
                        {/if}
                    </table>

                    <!-- Pending Deposits -->
                    {section name=p loop=$ps}
                        {if $ps[p].pending_col > 0}
                            <p>
                                {$ps[p].pending_col} {$ps[p].name} deposit{if $ps[p].pending_col > 1}s{/if} of {$currency_sign}{$ps[p].pending_amount} total pending
                            </p>
                        {/if}
                    {/section}

                    <!-- Wire Transfers Pending -->
                    {if $wires}
                        <p>{$wires} Wire Transfer(s) pending.</p>
                    {/if}
                </div>
            </div>

            <!-- Make a Deposit Card -->
            <div class="card mt-4">
                <div class="card-header"><h5>Make a Deposit</h5></div>
                <div class="card-body">
                    {if $fatal}
                    {if $fatal == 'one_per_month'}
                        <div class="alert alert-danger">
                            You can deposit once a month only.
                        </div>
                    {/if}
                    {else}
                    {literal}
                        <script language="javascript">
                            <!--
                            function openCalculator(id)
                            {
                                var w = 225, h = 400;
                                var t = (screen.height - h - 30) / 2;
                                var l = (screen.width - w - 30) / 2;
                                window.open('?a=calendar&type=' + id, 'calculator' + id, "top="+t+",left="+l+",width="+w+",height="+h+",resizable=1,scrollbars=0");

                                {if $qplans > 1}
                                for (i = 0; i < document.spendform.h_id.length; i++)
                                {
                                    if (document.spendform.h_id[i].value == id)
                                    {
                                        document.spendform.h_id[i].checked = true;
                                    }
                                }
                                {/if}
                                }

                                function updateCompound() {
                                    var id = 0;
                                    var tt = document.spendform.h_id.type;
                                    if (tt && tt.toLowerCase() == 'hidden') {
                                        id = document.spendform.h_id.value;
                                    } else {
                                        for (i = 0; i < document.spendform.h_id.length; i++) {
                                            if (document.spendform.h_id[i].checked) {
                                                id = document.spendform.h_id[i].value;
                                            }
                                        }
                                    }

                                    var cpObj = document.getElementById('compound_percents');
                                    if (cpObj) {
                                        while (cpObj.options.length != 0) {
                                            cpObj.options[0] = null;
                                        }
                                    }

                                    if (cps[id] && cps[id].length > 0) {
                                        document.getElementById('coumpond_block').style.display = '';

                                        for (i in cps[id]) {
                                            cpObj.options[cpObj.options.length] = new Option(cps[id][i]);
                                        }
                                    } else {
                                        document.getElementById('coumpond_block').style.display = 'none';
                                    }
                                }

                                var cps = {};
                            //-->
                        </script>
                    {/literal}

                    {if $frm.say eq 'deposit_success'}
                        <div class="alert alert-success">
                            <h3>The deposit has been successfully saved.</h3>
                        </div>
                    {/if}

                    {if $frm.say eq 'deposit_saved'}
                        <div class="alert alert-info">
                            <h3>The deposit has been saved. It will become active when the administrator checks statistics.</h3>
                        </div>
                    {/if}

                    {if $errors}
                        {if $errors.less_min}
                            <div class="alert alert-danger">
                                Sorry, you can deposit not less than {$currency_sign}{$errors.less_min} with selected processing.
                            </div>
                        {/if}
                        {if $errors.greater_max}
                            <div class="alert alert-danger">
                                Sorry, you can deposit not greater than {$currency_sign}{$errors.greater_max} with selected processing.
                            </div>
                        {/if}
                        {if $errors.ec_forbidden}
                            <div class="alert alert-danger">
                                Sorry, deposit with selected processing is temporarily forbidden.
                            </div>
                        {/if}
                    {/if}

                    <form method="post" name="spendform">
                        <input type="hidden" name="a" value="deposit">
                        {if $qplans > 1}
                            <div class="form-group">
                                <label>Select a plan:</label><br>
                            </div>
                        {/if}

                        {section name=plans loop=$plans}
                            <div class="card mb-4">
                                <div class="card-body">
                                    <table class="table">
                                        <tr>
                                            <td colspan="3">
                                                {if $qplans > 1}
                                                    <input type="radio" name="h_id" value="{$plans[plans].id}"
                                                            {if (($smarty.section.plans.first == 1) && ($frm.h_id eq '')) || ($frm.h_id == $plans[plans].id)}
                                                                checked
                                                            {/if}
                                                           onclick="updateCompound()">
                                                {else}
                                                    <input type="hidden" name="h_id" value="{$plans[plans].id}">
                                                {/if}
                                                <b>{$plans[plans].name}</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Plan</th>
                                            <th>Spent Amount ({$currency_sign})</th>
                                            <th nowrap>Period Profit (%)</th>
                                        </tr>
                                        {section name=options loop=$plans[plans].plans}
                                            <tr>
                                                <td>{$plans[plans].plans[options].name|escape:'html'}</td>
                                                <td align="right">{$plans[plans].plans[options].deposit}</td>
                                                <td align="right">{$plans[plans].plans[options].percent}</td>
                                            </tr>
                                        {/section}
                                        {if $settings.enable_calculator}
                                            <tr>
                                                <td colspan="3" align="right">
                                                    <a href="javascript:openCalculator('{$plans[plans].id}')">Calculate your profit &gt;&gt;</a>
                                                </td>
                                            </tr>
                                        {/if}
                                    </table>
                                    <script>
                                        cps[{$plans[plans].id}] = {$plans[plans].compound_percents_json};
                                    </script>
                                </div>
                            </div>
                        {/section}

                        <table class="table">
                            <tr>
                                <td>Your account balance ({$currency_sign}):</td>
                                <td align="right"><strong>{$currency_sign}{$ab_formated.total}</strong></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="right">
                                    <small>
                                        {section name=p loop=$ps}
                                            {if $ps[p].balance > 0}
                                                {$currency_sign}{$ps[p].balance} of {$ps[p].name}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}<br>
                                            {/if}
                                        {/section}
                                    </small>
                                </td>
                            </tr>
                            <tr>
                                <td>Amount to Spend ({$currency_sign}):</td>
                                <td align="right">
                                    <input type="text" name="amount" value="{$min_deposit}" class="form-control text-right" size="15" style="text-align:right;">
                                </td>
                            </tr>
                            <tr id="coumpond_block" style="display:none">
                                <td>Compounding(%):</td>
                                <td align="right">
                                    <select name="compound" class="form-control" id="compound_percents"></select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table class="table">
                                        {section name=p loop=$ps}
                                            {if $ps[p].balance > 0 and $ps[p].status == 1}
                                                <tr>
                                                    <td><input type="radio" name="type" value="account_{$ps[p].id}"></td>
                                                    <td>Spend funds from the Account Balance {$ps[p].name}</td>
                                                </tr>
                                            {/if}
                                        {/section}
                                        {section name=p loop=$ps}
                                            {if $ps[p].status}
                                                <tr>
                                                    <td><input type="radio" name="type" value="process_{$ps[p].id}" {if $smarty.section.p.index == 0}checked{/if}></td>
                                                    <td>Spend funds from {$ps[p].name}</td>
                                                </tr>
                                            {/if}
                                        {/section}
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button type="submit" class="btn btn-primary">Spend</button>
                                </td>
                            </tr>
                        </table>
                    </form>

                    {literal}
                        <script language="javascript">
                            for (i = 0; i < document.spendform.type.length; i++) {
                                if (document.spendform.type[i].value.match(/^process_/)) {
                                    document.spendform.type[i].checked = true;
                                    break;
                                }
                            }
                            updateCompound();
                        </script>
                    {/literal}
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
                                    <img src="{$wallet.logo_url}" alt="{$wallet.symbol}" class="img-fluid">
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
</div>


{include file="back_footer.tpl"}