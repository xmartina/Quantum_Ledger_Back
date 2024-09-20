{$page_name = 'Deposit'}
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

<div class="container my-5">
    {if $fatal}
    {if $fatal == 'one_per_month'}
        <div class="alert alert-warning d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <div>You can deposit once a month only.</div>
        </div>
    {/if}
    {else}
    {literal}
        <script type="text/javascript">
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
                updateCompound();
            }

            // Function to update compounding options
            function updateCompound() {
                var selectedPlan = document.querySelector('input[name="plan"]:checked');
                var id = selectedPlan ? selectedPlan.value : 0;

                var cpObj = document.getElementById('compound_percents');
                if (cpObj) {
                    cpObj.innerHTML = '';
                }

                if (cps[id] && cps[id].length > 0) {
                    document.getElementById('compound_block').style.display = 'block';
                    cps[id].forEach(function(percent) {
                        var option = document.createElement("option");
                        option.text = percent;
                        option.value = percent;
                        cpObj.add(option);
                    });
                } else {
                    document.getElementById('compound_block').style.display = 'none';
                }
            }

            // Initialize the form with selected plan data if available
            window.onload = function() {
                var selectedPlan = document.querySelector('input[name="plan"]:checked');
                if (selectedPlan) {
                    updateFields(selectedPlan);
                }
            }
        </script>
    {/literal}

    {if $frm.say eq 'deposit_success'}
        <div class="alert alert-success d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i>
            <div>The deposit has been successfully saved.</div>
        </div>
    {/if}

    {if $frm.say eq 'deposit_saved'}
        <div class="alert alert-info d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-info-circle me-2"></i>
            <div>The deposit has been saved. It will become active when the administrator checks statistics.</div>
        </div>
    {/if}

    {if $errors}
    {if $errors.less_min}
        <div class="alert alert-danger d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <div>Sorry, you can deposit not less than {$currency_sign}{$errors.less_min} with selected processing.</div>
        </div>
    {/if}
    {if $errors.greater_max}
        <div class="alert alert-danger d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <div>Sorry, you can deposit not greater than {$currency_sign}{$errors.greater_max} with selected processing.</div>
        </div>
    {/if}
    {if $errors.ec_forbidden}
        <div class="alert alert-danger d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <div>Sorry, deposit with selected processing is temporarily forbidden.</div>
        </div>
    {/if}
    {/if}

        <form action="https://qfsholdings.io/user/investment" method="post" name="spendform">
            <input type="hidden" name="_token" value="uEFi8lEpiFmmalD0MVoIJtqdamIeaKjGTKUcXIQd">
            <input type="hidden" name="a" value="deposit">

            <div class="card mb-4 shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Investment Plan</h5>
                    <small>Please select a plan</small>
                </div>
                <div class="card-body">
                    <!-- Plan Selection -->
                    <div class="mb-4">
                        <label class="form-label"><strong>Select a Plan:</strong></label>
                        <div class="row">
                            {section name=plans loop=$plans}
                                <div class="col-md-6 mb-3">
                                    <div class="form-check">
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
                                            <strong>{$plans[plans].name}</strong> (Currency: {$currency_sign})
                                        </label>
                                    </div>
                                </div>
                            {/section}
                        </div>
                    </div>

                    <!-- Plan Details -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="tenure" class="form-label"><strong>Tenure</strong></label>
                            <input type="text" name="tenure" id="tenure" class="form-control" readonly placeholder="0 Days" value="{$frm.tenure}">
                        </div>
                        <div class="col-md-6">
                            <label for="interest" class="form-label"><strong>Interest</strong></label>
                            <input type="text" name="interest" id="interest" class="form-control" readonly placeholder="0" value="{$frm.interest}">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="min" class="form-label"><strong>Min Amount</strong></label>
                            <input type="text" name="min" id="min" class="form-control" readonly placeholder="0.00" value="{$frm.min}">
                        </div>
                        <div class="col-md-6">
                            <label for="max" class="form-label"><strong>Max Amount</strong></label>
                            <input type="text" name="max" id="max" class="form-control" readonly placeholder="0.00" value="{$frm.max}">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="amount" class="form-label"><strong>Amount to Invest ({$currency_sign})</strong></label>
                        <input type="text" name="amount" id="amount" class="form-control" placeholder="0.00" value="{$frm.amount}">
                    </div>

                    <!-- Compounding Options -->
                    <div class="row mb-3" id="compound_block" style="display:none;">
                        <div class="col-md-12">
                            <label for="compound" class="form-label"><strong>Compounding (%)</strong></label>
                            <select name="compound" id="compound_percents" class="form-select">
                                <!-- Options will be populated by JavaScript -->
                            </select>
                        </div>
                    </div>

                    <!-- Funding Source -->
                    <div class="mb-3">
                        <label class="form-label"><strong>Spend Funds From:</strong></label>
                        <div class="row">
                            <div class="col-md-6">
                                {section name=p loop=$ps}
                                    {if $ps[p].balance > 0 && $ps[p].status == 1}
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="type" id="type_account_{$ps[p].id}" value="account_{$ps[p].id}">
                                            <label class="form-check-label" for="type_account_{$ps[p].id}">
                                                Account Balance {$ps[p].name} ({$currency_sign}{$ps[p].balance}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if})
                                            </label>
                                        </div>
                                    {/if}
                                {/section}
                            </div>
                            <div class="col-md-6">
                                {section name=p loop=$ps}
                                    {if $ps[p].status}
                                        <div class="form-check">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="type"
                                                    id="type_process_{$ps[p].id}"
                                                    value="process_{$ps[p].id}"
                                                    {if $smarty.section.p.index == 0}checked{/if}
                                            >
                                            <label class="form-check-label" for="type_process_{$ps[p].id}">
                                                Spend funds from {$ps[p].name}
                                            </label>
                                        </div>
                                    {/if}
                                {/section}
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid">
                        <input type="submit" value="Spend" class="btn btn-primary">
                    </div>
                </div>
            </div>

            <!-- Account Balance Display -->
            <div class="card mb-4 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Your Account Balance ({$currency_sign}):</h5>
                    <p class="card-text">{$currency_sign}{$ab_formated.total}</p>
                    {if $ps|@count > 0}
                        <h6>Detailed Balances:</h6>
                        <ul class="list-group list-group-flush">
                            {section name=p loop=$ps}
                                {if $ps[p].balance > 0}
                                    <li class="list-group-item">
                                        {$currency_sign}{$ps[p].balance} of {$ps[p].name}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}
                                    </li>
                                {/if}
                            {/section}
                        </ul>
                    {/if}
                </div>
            </div>
        </form>

    {literal}
        <script type="text/javascript">
            // Compound percents data
            var cps = {};
            {/literal}
            {section name=plans loop=$plans}
            {literal}
            cps[{/literal}{$plans[plans].id}{literal}] = {/literal}{$plans[plans].compound_percents_json|json_encode nofilter}{literal};
            {/literal}{/section}
                {literal}

                // Update Compound options based on selected plan
                function updateCompound() {
                    var selectedPlan = document.querySelector('input[name="plan"]:checked');
                    var id = selectedPlan ? selectedPlan.value : 0;

                    var cpObj = document.getElementById('compound_percents');
                    if (cpObj) {
                        cpObj.innerHTML = '';
                    }

                    if (cps[id] && cps[id].length > 0) {
                        document.getElementById('compound_block').style.display = 'block';
                        cps[id].forEach(function(percent) {
                            var option = document.createElement("option");
                            option.text = percent;
                            option.value = percent;
                            cpObj.add(option);
                        });
                    } else {
                        document.getElementById('compound_block').style.display = 'none';
                    }
                }

                // Automatically select the first process type if available
                document.addEventListener('DOMContentLoaded', function() {
                    var processTypes = document.querySelectorAll('input[name="type"]');
                    processTypes.forEach(function(type) {
                        if (type.value.startsWith('process_')) {
                            type.checked = true;
                            return false;
                        }
                    });
                    updateCompound();
                });
        </script>
    {/literal}
    {/if}
</div>

{include file="back_footer.tpl"}
