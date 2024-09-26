{section name=plans loop=$plans}
    <table cellspacing="1" cellpadding='2' border='0' width='100%'>
        <div class="row mb-3">
            <div class="container-fluid" id="container-wrapper">
                <div class="row justify-content-md-center">
                    <div class="col-md-12">
                        <div class="card mb-4 card-primary shadow">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    {if $qplans > 1}
                                        <input type=radio name=h_id
                                               value='{$plans[plans].id}' {if (($smarty.section.plans.first == 1) && ($frm.h_id eq '')) || ($frm.h_id == $plans[plans].id)} checked {/if}
                                               onclick="updateCompound()">
                                        <!--	<input type=radio name=h_id value='{$plans[plans].id}' {if (($smarty.section.plans.first == 1) && ($frm.h_id eq '')) || ($frm.h_id == $plans[plans].id)} checked {/if} {if $compounding_available > 0}onclick="document.spendform.compound.disabled={if $plans[plans].use_compound == 1}false{else}true{/if};"{/if}> -->
                                    {else}
                                        <input type=hidden name=h_id value='{$plans[plans].id}'>
                                    {/if} {$plans[plans].name}
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
{*        <tr>*}
{*            <td colspan=3>*}
{*                {if $qplans > 1}*}
{*                    <input type=radio name=h_id*}
{*                           value='{$plans[plans].id}' {if (($smarty.section.plans.first == 1) && ($frm.h_id eq '')) || ($frm.h_id == $plans[plans].id)} checked {/if}*}
{*                           onclick="updateCompound()">*}
{*                    <!--	<input type=radio name=h_id value='{$plans[plans].id}' {if (($smarty.section.plans.first == 1) && ($frm.h_id eq '')) || ($frm.h_id == $plans[plans].id)} checked {/if} {if $compounding_available > 0}onclick="document.spendform.compound.disabled={if $plans[plans].use_compound == 1}false{else}true{/if};"{/if}> -->*}
{*                {else}*}
{*                    <input type=hidden name=h_id value='{$plans[plans].id}'>*}
{*                {/if}*}

{*                <b>{$plans[plans].name}</b>*}
{*            </td>*}
{*        </tr>*}
        <div class="row">
            <div class="col-lg-4">
                <div class="invest_plans rounded shadow-sm">
                    <div class="head">
                        Plan
                    </div>
                    {section name=options loop=$plans[plans].plans}
                    <div class="pl_body">
                        {$plans[plans].plans[options].name|escape:html}
                    </div>
                    {/section}
                </div>
            </div>
        </div>
        <tr>
            <td class=inheader>Plan</td>
            <td class=inheader width=200>Spent Amount ({$currency_sign})</td>
            <td class=inheader width=100 nowrap>
                <nobr>{$plans[plans].period} Profit (%)</nobr>
            </td>
        </tr>
        {section name=options loop=$plans[plans].plans}
            <tr>
                <td class=item>{$plans[plans].plans[options].name|escape:html}</td>
                <td class=item align=right>{$plans[plans].plans[options].deposit}</td>
                <td class=item align=right>{$plans[plans].plans[options].percent}</td>
            </tr>
        {/section}
        {if $settings.enable_calculator}
            <tr>
                <td colspan=3 align=right><a href="javascript:openCalculator('{$plans[plans].id}')">Calculate
                        your profit &gt;&gt;</a></td>
            </tr>
        {/if}
    </table>
    <br>
    <br>
    <script>
        cps[{$plans[plans].id}] = {$plans[plans].compound_percents_json};
    </script>
{/section}