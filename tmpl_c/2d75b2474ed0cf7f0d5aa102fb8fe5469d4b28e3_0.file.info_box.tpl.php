<?php /* Smarty version 3.1.27, created on 2024-09-18 12:24:44
         compiled from "/home/multistream6/domains/account.quantumledger.online/public_html/tmpl/info_box.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:26602069866eac68c73f634_60636939%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2d75b2474ed0cf7f0d5aa102fb8fe5469d4b28e3' => 
    array (
      0 => '/home/multistream6/domains/account.quantumledger.online/public_html/tmpl/info_box.tpl',
      1 => 1559319312,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '26602069866eac68c73f634_60636939',
  'variables' => 
  array (
    'settings' => 0,
    'currency_sign' => 0,
    'stat_last_adfunds' => 0,
    'stat_last_addfunds' => 0,
    'stat_last_deposit' => 0,
    'stat_last_withdrawal' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_66eac68c7aa1d2_38256905',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_66eac68c7aa1d2_38256905')) {
function content_66eac68c7aa1d2_38256905 ($_smarty_tpl) {
if (!is_callable('smarty_modifier_myescape')) require_once '/home/multistream6/domains/account.quantumledger.online/public_html/inc/libs/smarty3/plugins/modifier.myescape.php';

$_smarty_tpl->properties['nocache_hash'] = '26602069866eac68c73f634_60636939';
?>
<!-- Image Table: Start -->
<table cellspacing=0 cellpadding=2 border=0 width=100<?php echo '%>';?>
<tr>
 <th colspan=2><img src=images/q.gif width=1 height=3></th>
</tr>
<tr>
	<th colspan=2 class=title>Info</th>
</tr>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_started'] == 1) {?>
<tr>
	<td class=menutxt colspan=2><b>Started</b> &nbsp; &nbsp; &nbsp; &nbsp; <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_start_month_str_generated']);?>
 <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_start_day']);?>
, <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_start_year']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_running_days'] == 1) {?>
<tr>
	<td class=menutxt><b>Running days</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_days_online_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_total_accounts']) {?>
<tr>
	<td class=menutxt><b>Total accounts</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_total_accounts_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_active_accounts']) {?>
<tr>
	<td class=menutxt><b>Active accounts</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_total_active_accounts_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_vip_accounts']) {?>
<tr>
	<td class=menutxt><b>VIP accounts</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_total_vip_accounts_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_deposit_funds'] == 1) {?>
<tr>
	<td class=menutxt><b>Total deposited</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_deposit_funds_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_today_deposit_funds'] == 1) {?>
<tr>
	<td class=menutxt><b>Today deposited</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_today_deposit_funds_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_total_withdraw'] == 1) {?>
<tr>
	<td class=menutxt><b>Total withdraw</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_withdraw_funds_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_today_withdraw_funds'] == 1) {?>
<tr>
	<td class=menutxt><b>Today withdraw</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_today_withdraw_funds_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_visitor_online'] == 1) {?>
<tr>
	<td class=menutxt><b>Visitors online</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['info_box_visitor_online_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_members_online'] == 1) {?>
<tr>
	<td class=menutxt><b>Members online</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['show_info_box_members_online_generated']);?>
</td>
</tr>
<?php }?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_newest_member'] == 1) {?>
<tr>
	<td class=menutxt><b>Newest Member</b></td>
	<td class=menutxt align=right><?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_newest_member_generated']) {
echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['show_info_box_newest_member_generated']);
} else { ?>N/A<?php }?></td>
</tr>
<?php }?>

<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_lastaddfunds']) {?>
	<?php if ($_smarty_tpl->tpl_vars['stat_last_adfunds']->value) {?>
        <tr>
	<td class=menutxt><b>Last topup:</b></th>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape(number_format($_smarty_tpl->tpl_vars['stat_last_addfunds']->value['amount'],2));?>
 (<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['stat_last_adfunds']->value['username']);?>
)</td>
	</tr>
	<?php }?>
<?php }?>

<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_lastdeposit']) {?>
	<?php if ($_smarty_tpl->tpl_vars['stat_last_deposit']->value) {?>
        <tr>
	<td class=menutxt><b>Last deposit:</b></th>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape(number_format($_smarty_tpl->tpl_vars['stat_last_deposit']->value['amount'],2));?>
 (<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['stat_last_deposit']->value['username']);?>
)</td>
	</tr>
	<?php }?>
<?php }?>
	
<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_lastwithdrawal']) {?>
	<?php if ($_smarty_tpl->tpl_vars['stat_last_withdrawal']->value) {?>
        <tr>
	<td class=menutxt><b>Last withdraw:</b></td>
	<td class=menutxt align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
 <?php echo smarty_modifier_myescape(number_format($_smarty_tpl->tpl_vars['stat_last_withdrawal']->value['amount'],2));?>
 (<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['stat_last_withdrawal']->value['username']);?>
)</td>
	</tr>
	<?php }?>
<?php }?>

<?php if ($_smarty_tpl->tpl_vars['settings']->value['show_info_box_last_update'] == 1) {?>
<tr>
	<td class=menutxt colspan=2><b>Last update</b> &nbsp;<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['show_info_box_last_update_generated']);?>
</td>
</tr>
<?php }?>


</table>
<br>
<?php }
}
?>