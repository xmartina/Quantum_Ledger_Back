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


{if $fatal}
    {if $fatal == 'one_per_month'}
        <div class="media align-items-center d-flex justify-content-between alert alert-warn mb-4">
            <div><i class="fas fa-exclamation-triangle"></i> You can deposit once a month only.
            </div>
        </div>
    {/if}

{else}

{literal}
    <script language="javascript"><!--
        function openCalculator(id) {

            w = 225;
            h = 400;
            t = (screen.height - h - 30) / 2;
            l = (screen.width - w - 30) / 2;
            window.open('?a=calendar&type=' + id, 'calculator' + id, "top=" + t + ",left=" + l + ",width=" + w + ",height=" + h + ",resizable=1,scrollbars=0");

            {/literal}
            {if $qplans > 1}
            {literal}
            for (i = 0; i < document.spendform.h_id.length; i++) {
                if (document.spendform.h_id[i].value == id) {
                    document.spendform.h_id[i].checked = true;
                }
            }
            {/literal}
            {/if}
            {literal}

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
        --></script>
{/literal}

    {if $frm.say eq 'deposit_success'}
        <div class="media align-items-center d-flex justify-content-between alert alert-warn mb-4">
            <div><i class="fas fa-exclamation-triangle h3"></i>The deposit has been successfully saved.
            </div>
        </div>
    {/if}

    {if $frm.say eq 'deposit_saved'}
        <div class="media align-items-center d-flex justify-content-between alert alert-warn mb-4">
            <div><i class="fas fa-exclamation-triangle h3"></i>The deposit has been saved. It will become active when
                the administrator checks statistics.
            </div>
        </div>
    {/if}

    {if $errors}
        {if $errors.less_min}
            <div class="media align-items-center d-flex justify-content-between alert alert-danger mb-4">
                <div><i class="fas fa-exclamation-triangle h3"></i>Sorry, you can deposit not less
                    than {$currency_sign}{$errors.less_min} with selected processing
                </div>
            </div>
        {/if}
        {if $errors.greater_max}
            <div class="media align-items-center d-flex justify-content-between alert alert-danger mb-4">
                <div><i class="fas fa-exclamation-triangle h3"></i>Sorry, you can deposit not greater
                    than {$currency_sign}{$errors.greater_max} with selected processing
                </div>
            </div>
        {/if}
        {if $errors.ec_forbidden}
            <div class="media align-items-center d-flex justify-content-between alert alert-danger mb-4">
                <div><i class="fas fa-exclamation-triangle h3"></i>Sorry, deposit with selected processing is temporary
                    forbidden.
                </div>
            </div>
            <br>
            <br>
        {/if}
    {/if}
    <form method=post name="spendform">
        <input type=hidden name=a value=deposit>
        {if $qplans > 1} Select a plan:
            <br>
        {/if}

        {include file="deposit_plans.tpl"}

        <table cellspacing=0 cellpadding=2 border=0 class="w-100">
            <tr class="d-flex justify-content-start align-items-center">
                <td class="deposit_info pr-5">Your account balance ({$currency_sign}):</td>
                <td align=right class="balance_info">{$currency_sign}{$ab_formated.total}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align=right>
                    <small>
                        {section name=p loop=$ps}
                            {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}
                                <br>
                            {/if}
                        {/section}
                    </small>
                </td>
            </tr>
            <tr class="row w-100 invest_plans align-items-center justify-content-start">
                <td class="col-lg-4 head">Amount to Spend ({$currency_sign}):</td>
                <td class="col-lg-6 balance_input p-3 rounded"><input type=text name=amount value='{$min_deposit}' class='form-input text-danger rounded p-2 w-100' size=15
                                       style="text-align:right;"></td>
            </tr>
            <tr id="coumpond_block" style="display:none">
                <td>Compounding(%):</td>
                <td align=right>
                    <select name="compound" class=inpts id="compound_percents"></select>
                </td>
            </tr>
            <tr class="py-3"></tr>
            <tr class="pt-4 my-4">
                <td colspan=2>
                    <table cellspacing=0 cellpadding=2 border=0 class="spend_from">
                        {section name=p loop=$ps}
                            {if $ps[p].balance > 0 and $ps[p].status == 1}
                                <tr>
                                    <td><input type=radio name=type value="account_{$ps[p].id}"></td>
                                    <td>Spend funds from the Account Balance {$ps[p].name}</td>
                                </tr>
                            {/if}
                        {/section}
                        {section name=p loop=$ps}
                            {if $ps[p].status}
                                <tr>
                                    <td><input type=radio name=type value="process_{$ps[p].id}"
                                               {if $smarty.section.p.index == 0}checked{/if}></td>
                                    <td>Spend funds from {$ps[p].name}</td>
                                </tr>
                            {/if}
                        {/section}
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan=2 class="py-3"><input type=submit value="Spend" class='form-input btn p-2 bg-warning text-white rounded shadow-sm w-50'></td>
            </tr>
        </table>
    </form>
{literal}
    <script language=javascript>
        for (i = 0; i < document.spendform.type.length; i++) {
            if ((document.spendform.type[i].value.match(/^process_/))) {
                document.spendform.type[i].checked = true;
                break;
            }
        }
        updateCompound();
    </script>
{/literal}

{/if}
</div>
{include file="back_footer.tpl"}
