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
        <style>
            :root{
                --primary_color:#f47c3c !important;
                --font-size_big:21px !important;
                --font_size_small:15px !important;
                --font_color:#6c757d !important;
            }
            .invest_plans{
                background-color: #fff;
                max-height: 250px;
            }
            .invest_plans .head{
                font-weight: 500;
                font-size: var(--font-size_big);
                color: #f47c3c ;
            }
            hr.pl_line{
                background-color:  ;
                border: 1px solid #f47c3c ;
            }
            .invest_plans .pl_body{
                color: var(--font_color);
                font-size:var(--font_size_small);
            }
            .deposit_info{
                font-size: var(--font-size_big);
                color: var(--primary_color);
            }
            .balance_info{
                font-size: var(--font_size_small);
                color: var(--font_color);
            }
            .balance_input{
                border:1px solid var(--font-color);
            }
            .spend_from td{
                color: var(--primary_color);
                font-size: var(--font_size_small);
            }
            .spend_from input[type='submit']{
                font-size: var(--font_size_small);
                width: 200px;
            }
        </style>
        <div class="row">
            <div class="col-lg-4">
                <div class="invest_plans p-3 rounded shadow-sm">
                    <div class="head mb-2">
                        Plan
                    </div>
                    <hr class="pl_line">
                    {section name=options loop=$plans[plans].plans}
                    <div class="pl_body">
                        {$plans[plans].plans[options].name|escape:html}
                    </div>
                    {/section}
                </div>
            </div>
            <div class="col-lg-4">
                <div class="invest_plans p-3 rounded shadow-sm">
                    <div class="head mb-2">
                        Spent Amount ({$currency_sign})
                    </div>
                    <hr class="pl_line">
                    {section name=options loop=$plans[plans].plans}
                        <div class="pl_body">
                            {$plans[plans].plans[options].deposit}
                        </div>
                    {/section}
                </div>
            </div>
            <div class="col-lg-4">
                <div class="invest_plans p-3 rounded shadow-sm">
                    <div class="head mb-2">
                        {$plans[plans].period} Profit (%)
                    </div>
                    <hr class="pl_line">
                    {section name=options loop=$plans[plans].plans}
                        <div class="pl_body">
                            {$plans[plans].plans[options].percent}
                        </div>
                    {/section}
                </div>
            </div>
        </div>
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