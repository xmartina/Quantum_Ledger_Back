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
        function openCalculator(id) {
            var w = 225, h = 400;
            var t = (screen.height - h - 30) / 2;
            var l = (screen.width - w - 30) / 2;
            window.open('?a=calendar&type=' + id, 'calculator' + id, "top=" + t + ",left=" + l + ",width=" + w + ",height=" + h + ",resizable=1,scrollbars=0");
        }

        function updateCompound() {
            var id = 0;
            var tt = document.spendform.h_id.type;
            if (tt && tt.toLowerCase() == 'hidden') {
                id = document.spendform.h_id.value;
            } else {
                for (var i = 0; i < document.spendform.h_id.length; i++) {
                    if (document.spendform.h_id[i].checked) {
                        id = document.spendform.h_id[i].value;
                    }
                }
            }

            var cpObj = document.getElementById('compound_percents');
            if (cpObj) {
                cpObj.options.length = 0;
            }

            if (cps[id] && cps[id].length > 0) {
                document.getElementById('compound_block').style.display = '';
                for (var i in cps[id]) {
                    cpObj.options[cpObj.options.length] = new Option(cps[id][i], cps[id][i]);
                }
            } else {
                document.getElementById('compound_block').style.display = 'none';
            }
        }

        var cps = {};
        {/literal}

        {if $qplans > 1}
        {literal}
        for (var i = 0; i < document.spendform.h_id.length; i++) {
            if (document.spendform.h_id[i].value == id) {
                document.spendform.h_id[i].checked = true;
            }
        }
        {/literal}
        {/if}

        {literal}
    </script>
{/literal}

    {if $frm.say eq 'deposit_success'}
        <h3>The deposit has been successfully saved.</h3>
        <br><br>
    {/if}

    {if $frm.say eq 'deposit_saved'}
        <h3>The deposit has been saved. It will become active when the administrator checks statistics.</h3>
        <br><br>
    {/if}

    <h3>Make a Deposit:</h3>
    <br>

    {if $errors}
        {if $errors.less_min}
            Sorry, you can deposit not less than {$currency_sign}{$errors.less_min} with selected processing<br><br>
        {/if}
        {if $errors.greater_max}
            Sorry, you can deposit not greater than {$currency_sign}{$errors.greater_max} with selected processing<br><br>
        {/if}
        {if $errors.ec_forbidden}
            Sorry, deposit with selected processing is temporarily forbidden.<br><br>
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
                            <p id="image"></p>
                            <div class="mb-3 col-md-12">
                                <label class="form-label" for="gateway">Plan</label>
                                <select id="gateway" onchange="myFunction()" name="plan" class="form-control">
                                    <option selected disabled>Select An Option</option>
                                    {section name=plans loop=$plans}
                                        <option
                                                data-id="{$plans[plans].id}"
                                                data-resource="{$plans[plans]|json_encode nofilter}"
                                                data-tenure="{$plans[plans].tenure}"
                                                data-min_amount="{$plans[plans].min_amount}{$currency_sign}"
                                                data-max_amount="{$plans[plans].max_amount}{$currency_sign}"
                                                data-interest="{$plans[plans].interest_amount}%  Daily"
                                                {if $frm.plan == $plans[plans].id} selected {/if}
                                        >
                                            {$plans[plans].name} (Currency: {$currency_sign})
                                        </option>
                                    {/section}
                                </select>
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
                            <button type="submit" class="btn btn-outline-primary btn-next">
                                <span class="align-middle d-sm-inline-block d-none">Invest Now</span>
                                <i data-feather="arrow-right" class="align-middle ms-sm-25 ms-0"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

{literal}
    <script language="javascript">
        function myFunction() {
            var gateway = document.getElementById("gateway");
            var selectedOption = gateway.options[gateway.selectedIndex];

            document.getElementById("tenure").value = selectedOption.getAttribute("data-tenure");
            document.getElementById("interest").value = selectedOption.getAttribute("data-interest");
            document.getElementById("min").value = selectedOption.getAttribute("data-min_amount");
            document.getElementById("max").value = selectedOption.getAttribute("data-max_amount");
            document.getElementById("method_code").value = selectedOption.getAttribute("data-id");
        }

        // Initialize the form with selected plan data if available
        window.onload = function() {
            myFunction();
        }
    </script>
{/literal}

    {if $frm.say eq 'deposit_success'}
        <h3>The deposit has been successfully saved.</h3>
        <br><br>
    {/if}

    {if $frm.say eq 'deposit_saved'}
        <h3>The deposit has been saved. It will become active when the administrator checks statistics.</h3>
        <br><br>
    {/if}

{/if}

{include file="back_footer.tpl"}