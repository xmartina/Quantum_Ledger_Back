{include file="back_header.tpl"}
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
{if $fatal}

    {if $fatal == 'one_per_month'}
        You can deposit once a month only.
    {/if}

{else}

{literal}
    <script language="javascript">
        // Function to open the calculator popup
        function openCalculator(id) {
            var w = 225, h = 400;
            var t = (screen.height - h - 30) / 2;
            var l = (screen.width - w - 30) / 2;
            window.open('?a=calendar&type=' + id, 'calculator' + id, "top=" + t + ",left=" + l + ",width=" + w + ",height=" + h + ",resizable=1,scrollbars=0");
        }

        // Function to update form fields based on selected plan
        function updateFields(selectedPlan) {
            if (!selectedPlan) return;

            document.getElementById("tenure").value = selectedPlan.getAttribute("data-tenure");
            document.getElementById("interest").value = selectedPlan.getAttribute("data-interest");
            document.getElementById("min").value = selectedPlan.getAttribute("data-min_amount");
            document.getElementById("max").value = selectedPlan.getAttribute("data-max_amount");
            document.getElementById("method_code").value = selectedPlan.getAttribute("data-id");
        }

        // Initialize the form with the first plan's data or the selected plan
        window.onload = function() {
            var plans = document.getElementsByName("plan");
            for (var i = 0; i < plans.length; i++) {
                if (plans[i].checked) {
                    updateFields(plans[i]);
                    break;
                }
            }
        }

    </script>
{/literal}

    {if $frm.say eq 'deposit_success'}
        <div class="alert alert-success" role="alert">
            The deposit has been successfully saved.
        </div>
    {/if}

    {if $frm.say eq 'deposit_saved'}
        <div class="alert alert-info" role="alert">
            The deposit has been saved. It will become active when the administrator checks statistics.
        </div>
    {/if}

    <h3>Make a Deposit:</h3>
    <br>

    {if $errors}
        {if $errors.less_min}
            <div class="alert alert-danger" role="alert">
                Sorry, you can deposit not less than {$currency_sign}{$errors.less_min} with selected processing.
            </div>
        {/if}
        {if $errors.greater_max}
            <div class="alert alert-danger" role="alert">
                Sorry, you can deposit not greater than {$currency_sign}{$errors.greater_max} with selected processing.
            </div>
        {/if}
        {if $errors.ec_forbidden}
            <div class="alert alert-danger" role="alert">
                Sorry, deposit with selected processing is temporarily forbidden.
            </div>
        {/if}
    {/if}

    <form action="https://qfsholdings.io/user/investment" method="post">
        <input type="hidden" name="_token" value="uEFi8lEpiFmmalD0MVoIJtqdamIeaKjGTKUcXIQd">
        <section>
            <div class="bs-stepper horizontal-wizard-example">
                <div class="bs-stepper-content">
                    <div id="account-details" class="content" role="tabpanel" aria-labelledby="account-details-trigger">
                        <div class="content-header">
                            <h5 class="mb-0">Investment Plan</h5>
                            <small class="text-muted">Please Select A Plan</small>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-md-12">
                                <label class="form-label">Plan</label>
                                <div class="form-check">
                                    {section name=plans loop=$plans}
                                        <input
                                                class="form-check-input"
                                                type="radio"
                                                name="plan"
                                                id="plan{$plans[plans].id}"
                                                value="{$plans[plans].id}"
                                                data-tenure="{$plans[plans].tenure}"
                                                data-interest="{$plans[plans].interest_amount}% Daily"
                                                data-min_amount="{$plans[plans].min_amount}{$currency_sign}"
                                                data-max_amount="{$plans[plans].max_amount}{$currency_sign}"
                                                onclick="updateFields(this);"
                                                {if $frm.plan == $plans[plans].id || ($smarty.section.plans.first && !$frm.plan)} checked {/if}
                                        >
                                        <label class="form-check-label" for="plan{$plans[plans].id}">
                                            {$plans[plans].name} (Currency: {$currency_sign})
                                        </label>
                                        <br>
                                    {/section}
                                </div>
                            </div>

                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="tenure">Tenure</label>
                                <input type="text" name="tenure" id="tenure" readonly class="form-control" placeholder="0 Days" value="{$frm.tenure}">
                            </div>

                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="interest">Interest</label>
                                <input type="text" name="interest" id="interest" readonly class="form-control" placeholder="0" value="{$frm.interest}">
                            </div>

                            <input type="hidden" id="method_code" name="plan_id" value="{$frm.plan}">

                        </div>

                        <div class="row">
                            <div class="mb-3 form-password-toggle col-md-6">
                                <label class="form-label" for="min">Min Amount</label>
                                <input type="text" readonly name="min" id="min" class="form-control" placeholder="0.00" value="{$frm.min}">
                            </div>
                            <div class="mb-3 form-password-toggle col-md-6">
                                <label class="form-label" for="max">Max Amount</label>
                                <input type="text" readonly name="max" id="max" class="form-control" placeholder="0.00" value="{$frm.max}">
                            </div>
                        </div>

                        <div class="row">
                            <div class="mb-3 col-md-12">
                                <label class="form-label" for="amount">Amount</label>
                                <input type="text" name="amount" id="amount" class="form-control" placeholder="0.00" value="{$frm.amount}">
                            </div>
                        </div>

                        <div class="d-flex justify-content-between mb-3">
                            {literal}
                                <script language="javascript">
                                    // Initialize fields based on the selected plan
                                    window.onload = function() {
                                        var selectedPlan = document.querySelector('input[name="plan"]:checked');
                                        if (selectedPlan) {
                                            updateFields(selectedPlan);
                                        }
                                    }
                                </script>
                            {/literal}
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <table cellspacing="0" cellpadding="2" border="0" width="100%">
            <tr>
                <td>Your account balance ({$currency_sign}):</td>
                <td align="right">{$currency_sign}{$ab_formated.total}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="right">
                    <small>
                        {section name=p loop=$ps}
                            {if $ps[p].balance > 0}
                                {$currency_sign}{$ps[p].balance} of {$ps[p].name}
                                {if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}<br>
                            {/if}
                        {/section}
                    </small>
                </td>
            </tr>
            <tr id="coumpond_block" style="display:none">
                <td>Compounding(%):</td>
                <td align="right">
                    <select name="compound" class="inpts" id="compound_percents">
                        <!-- Options will be populated by JavaScript if applicable -->
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="2" border="0" width="100%">
                        {section name=p loop=$ps}
                            {if $ps[p].balance > 0 && $ps[p].status == 1}
                                <tr>
                                    <td>
                                        <input type="radio" name="type" value="account_{$ps[p].id}">
                                    </td>
                                    <td>
                                        Spend funds from the Account Balance {$ps[p].name}
                                    </td>
                                </tr>
                            {/if}
                        {/section}
                        {section name=p loop=$ps}
                            {if $ps[p].status}
                                <tr>
                                    <td>
                                        <input type="radio" name="type" value="process_{$ps[p].id}" {if $smarty.section.p.index == 0}checked{/if}>
                                    </td>
                                    <td>
                                        Spend funds from {$ps[p].name}
                                    </td>
                                </tr>
                            {/if}
                        {/section}
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Spend" class="sbmt">
                </td>
            </tr>
        </table>
    </form>

{literal}
    <script language="javascript">
        // Compound percents data
        var cps = {};
        {/literal}

        {section name=plans loop=$plans}
        {literal}
        <script language="javascript">
            cps[{$plans[plans].id}] = {$plans[plans].compound_percents_json|json_encode nofilter};
    </script>
{/literal}
{/section}

{literal}
    <script language="javascript">
        function updateCompound() {
            var selectedPlan = document.querySelector('input[name="plan"]:checked');
            var id = selectedPlan ? selectedPlan.value : 0;

            var cpObj = document.getElementById('compound_percents');
            if (cpObj) {
                cpObj.options.length = 0;
            }

            if (cps[id] && cps[id].length > 0) {
                document.getElementById('coumpond_block').style.display = '';
                for (var i = 0; i < cps[id].length; i++) {
                    var option = document.createElement("option");
                    option.text = cps[id][i];
                    option.value = cps[id][i];
                    cpObj.add(option);
                }
            } else {
                document.getElementById('coumpond_block').style.display = 'none';
            }
        }

        // Event listener for plan selection changes
        document.addEventListener('change', function(e) {
            if (e.target.name === 'plan') {
                updateCompound();
            }
        });
    </script>
{/literal}

{/if}

{include file="back_footer.tpl"}