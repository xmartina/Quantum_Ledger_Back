<?php /* Smarty version 3.1.27, created on 2024-09-18 12:24:44
         compiled from "/home/multistream6/domains/account.quantumledger.online/public_html/tmpl/logo.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:197108227966eac68c638221_23881861%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '61985f87288e132c29e3ab66254c52f64fd6cbee' => 
    array (
      0 => '/home/multistream6/domains/account.quantumledger.online/public_html/tmpl/logo.tpl',
      1 => 1559319312,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '197108227966eac68c638221_23881861',
  'variables' => 
  array (
    'settings' => 0,
    'userinfo' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_66eac68c65fd18_50784857',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_66eac68c65fd18_50784857')) {
function content_66eac68c65fd18_50784857 ($_smarty_tpl) {
if (!is_callable('smarty_modifier_myescape')) require_once '/home/multistream6/domains/account.quantumledger.online/public_html/inc/libs/smarty3/plugins/modifier.myescape.php';

$_smarty_tpl->properties['nocache_hash'] = '197108227966eac68c638221_23881861';
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_name']);?>
</title>
<base href="<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_url']);?>
/" src="<?php echo smarty_modifier_myescape($_smarty_tpl->tpl_vars['settings']->value['site_url']);?>
/" />
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FFFFF2" link="#666699" vlink="#666699" alink="#666699" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<center>
<table width="760" border="0" cellpadding="0" cellspacing="0" height=100<?php echo '%>';?>
  <tr> 
    <td valign=top height=142>
      <table cellspacing=0 cellpadding=0 border=0 width=100% height=142>
	    <tr>
		  <td background="images/ver.gif" class=toptable><img src="images/top.gif" width=304 height=142 border="0" align=left></td>
		  <td background="images/ver.gif" class=toptable valign=bottom align=right>

<b>
<a href="<?php echo smarty_modifier_myescape(encurl("?a=home"));?>
" class=toplink>Home</a> &middot; 
<a href="<?php echo smarty_modifier_myescape(encurl("?a=faq"));?>
" class=toplink>FAQ</a> &middot; 
<a href="<?php echo smarty_modifier_myescape(encurl("?a=rules"));?>
" class=toplink>Rules</a> &middot; 
<?php if ($_smarty_tpl->tpl_vars['userinfo']->value['logged'] != 1) {?>
<a href="<?php echo smarty_modifier_myescape(encurl("?a=signup"));?>
" class=toplink>Sign up</a> &middot; 
<a href="<?php echo smarty_modifier_myescape(encurl("?a=login"));?>
" class=toplink>Login</a> &middot; 
<?php } else { ?>
<a href="<?php echo smarty_modifier_myescape(encurl("?a=logout"));?>
" class=toplink>Logout</a> &middot; 
<?php }?>
<a href="<?php echo smarty_modifier_myescape(encurl("?a=support"));?>
" class=toplink>Support</a></b>&nbsp; &nbsp;</td>
 	    </tr>
	  </table>
     </td>
  </tr>
<?php }
}
?>