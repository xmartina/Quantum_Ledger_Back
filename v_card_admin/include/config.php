<?php
include_once (__DIR__ . '/db_connection.php');

$base_url = 'https://account.quantumledger.online/';
$home_url = 'https://quantumledger.online/';
$asset_link = $base_url . 'v_card_admin/admin_assets';
$external_base_url = 'https://qfsholdings.io/';
$site_name  = 'Quantum Ledger Financial System';
$favicon_url = $base_url . 'assets/imgs/qfsicon.png';
$site_logo = $home_url .'assets/imgs/qfs.png';
$login_url = $base_url . '?a=login';
const current_year = '|default:2024';
