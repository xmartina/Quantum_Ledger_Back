{$page_name = 'Your Deposits'}
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

<b>Total: {$currency_sign}{$total}</b><br><br>

{foreach from=$plans item=p}
    <table class="w-100">
        <tr>
            <th class=item>
                <table class="table table-dark">
                    <tr>
                        <td colspan=3 align=center style="font-size: 21px;"><b>{$p.name}</b></td>
                    </tr>
                    <tr>
                        <th scope="col">Plan</th>
                        <th scope="col">Amount Spent ({$currency_sign})</th>
                        <th scope="col">
                            <nobr>{$p.period} Profit (%)</nobr>
                        </th>
                    </tr>
                    {foreach from=$p.plans item=o}
                        <tr>
                            <td class=item>{$o.name}</td>
                            <td class=item align=right>{$o.deposit}</td>
                            <td class=item align=right>{$o.percent}</td>
                        </tr>
                    {/foreach}
                </table>
                <br>
                <table class="table table-dark">
                    {if !$p.deposits}
                        <tr>
                            <td colspan=4><b>No deposits for this plan</b></td>
                        </tr>
                    {else}
                        <tr>
                            <th scope="col">Your deposits:</th>
                        </tr>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Amount</th>
                            {if $p.use_compound}
                                <th scope="col">Compounding Percent</th>
                            {/if}
                            {if $p.withdraw_principal}
                                <th scope="col">Release</th>
                            {/if}
                        </tr>
                        {foreach from=$p.deposits item=d}
                            <tr>
                                <td align=center class=item>
                                    <b>{$d.date}</b><br>{if $p.q_days == 0}Working {$d.duration} days{else}Expire in {$d.expire_in} days{/if}
                                </td>
                                <td align=center class=item><b>{$currency_sign}{$d.deposit} <img
                                                src="images/{$d.ec}.gif" align=absmiddle hspace=1 height=17></b></td>
                                {if $p.use_compound}
                                    <td align=center class=item align=center>{$d.compound}% <a
                                                href="{"?a=change_compound&deposit=`$d.id`"|encurl}">[change]</a></td>
                                {/if}
                                {if $p.withdraw_principal}
                                    <td align=center class=item>
                                        {if $d.can_withdraw}
                                            <a href="{"?a=withdraw_principal&deposit=`$d.id`"|encurl}">[release]</a>
                                        {else}
                                            {if $d.pending_duration > 0}
                                                {$d.pending_duration} day{if $d.pending_duration > 1}s{/if} left
                                            {else}
                                                not available
                                            {/if}
                                        {/if}
                                    </td>
                                {/if}
                            </tr>
                        {/foreach}
                    {/if}
                </table>
                {if $p.total_deposit > 0 || $p.today_profit > 0 || $p.total_profit > 0}
                    <table cellspacing=0 cellpadding=1 border=0>
                        <tr>
                            <td>Deposited Total:</td>
                            <td><b>{$currency_sign}{$p.total_deposit}</b></td>
                        </tr>
                        <tr>
                            <td>Profit Today:</td>
                            <td><b>{$currency_sign}{$p.today_profit}</b></td>
                        </tr>
                        <tr>
                            <td>Total Profit:</td>
                            <td><b>{$currency_sign}{$p.total_profit}</b></td>
                        </tr>
                    </table>
                {/if}
                <br>
            </th>
        </tr>
    </table>
    <br>
{/foreach}

{include file="back_footer.tpl"}
