<?php /* Smarty version 3.1.27, created on 2024-09-18 12:24:44
         compiled from "/home/multistream6/domains/account.quantumledger.online/public_html/tmpl/index.plans.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:163655139766eac68c81fb48_80375951%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e6a4d1bbe0bddd0698b3591ad3b0628d5ee436c8' => 
    array (
      0 => '/home/multistream6/domains/account.quantumledger.online/public_html/tmpl/index.plans.tpl',
      1 => 1559319312,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '163655139766eac68c81fb48_80375951',
  'variables' => 
  array (
    'index_plans' => 0,
    'p' => 0,
    'currency_sign' => 0,
    'o' => 0,
    'settings' => 0,
    'userinfo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_66eac68c84d4b2_60871302',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_66eac68c84d4b2_60871302')) {
function content_66eac68c84d4b2_60871302 ($_smarty_tpl) {
if (!is_callable('smarty_modifier_myescape')) require_once '/home/multistream6/domains/account.quantumledger.online/public_html/inc/libs/smarty3/plugins/modifier.myescape.php';

$_smarty_tpl->properties['nocache_hash'] = '163655139766eac68c81fb48_80375951';
?>

<?php echo '<script'; ?>
 language="javascript"><!--
function openCalculator(id)
{
  w = 225; h = 400;
  t = (screen.height-h-30)/2;
  l = (screen.width-w-30)/2;
  window.open('?a=calendar&type=' + id, 'calculator' + id, "top="+t+",left="+l+",width="+w+",height="+h+",resizable=1,scrollbars=0");
}
--><?php echo '</script'; ?>
>


<?php
$_from = $_smarty_tpl->tpl_vars['index_plans']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['p'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['p']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['p']->value) {
$_smarty_tpl->tpl_vars['p']->_loop = true;
$foreach_p_Sav = $_smarty_tpl->tpl_vars['p'];
?>
<?php if (!$_smarty_tpl->tpl_vars['p']->value['closed']) {?>
<table cellspacing=1 cellpadding=2 border=0 width=100<?php echo '%>';?>
<tr>
 <td colspan=3 align=center><?php if ($_smarty_tpl->tpl_vars['p']->value['dsc'] != '') {?><a href="<?php echo smarty_modifier_myescape(encurl("?a=show_package_info&id=".((string)$_smarty_tpl->tpl_vars['p']->value['id'])));?>
"><?php }?><b><?php echo smarty_modifier_myescape(htmlspecialchars($_smarty_tpl->tpl_vars['p']->value['name'], ENT_QUOTES, 'UTF-8', true));?>
</b></a></td>
</tr>
<?php if ($_smarty_tpl->tpl_vars['p']->value['plans']) {?>
<tr>
 <td class=inheader>Plan</td>
 <td class=inheader width=200>Spent Amount (<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['currency_sign']->value);?>
)</td>
 <td class=inheader width=100 nowrap><nobr><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['p']->value['period']);?>
 Profit (%)</nobr></td>
</tr>
<?php
$_from = $_smarty_tpl->tpl_vars['p']->value['plans'];
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['o'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['o']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['o']->value) {
$_smarty_tpl->tpl_vars['o']->_loop = true;
$foreach_o_Sav = $_smarty_tpl->tpl_vars['o'];
?>
<tr>
 <td class=item><?php echo smarty_modifier_myescape(htmlspecialchars($_smarty_tpl->tpl_vars['o']->value['name'], ENT_QUOTES, 'UTF-8', true));?>
</td>
 <td class=item align=right><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['o']->value['deposit']);?>
</td>
 <td class=item align=right><?php echo smarty_modifier_myescape(sprintf("%.2f",$_smarty_tpl->tpl_vars['o']->value['percent']));?>
</td>
</tr>
<?php
$_smarty_tpl->tpl_vars['o'] = $foreach_o_Sav;
}
?>
<?php if ($_smarty_tpl->tpl_vars['settings']->value['enable_calculator'] && $_smarty_tpl->tpl_vars['p']->value['period'] != 'Floating') {?>
<tr>
 <td colspan=3 align=right><a href="javascript:openCalculator('<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['p']->value['id']);?>
')">Calculate your profit &gt;&gt;</a></td>
</tr>
<?php }?>
<?php }?>
</table>

<?php if ($_smarty_tpl->tpl_vars['userinfo']->value['logged']) {?>
<br>
<form method=post>
<input type=hidden name=a value=deposit>
<input type=submit value="Make deposit" class=sbmt>
<input type=hidden name=h_id value=<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['p']->value['id']);?>
>
</form>
<br><br>
<?php }?>
<?php }?>
<?php
$_smarty_tpl->tpl_vars['p'] = $foreach_p_Sav;
}

}
}
?>