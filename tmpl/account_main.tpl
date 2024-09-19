{$external_base_url = "https://qfsholdings.io/"}
{$base_url = "https://account.quantumledger.online/"}
{$home_url = "https://quantumledger.online/"}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{$title|default:'Dashboard | Qfs Holdings'}</title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="{$external_base_url}assets/dashboard/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="{$external_base_url}assets/dashboard/modules/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <!-- Template CSS -->
    <link rel="stylesheet" href="{$external_base_url}assets/dashboard/css/style.css">
    <link rel="stylesheet" href="{$external_base_url}assets/dashboard/css/components.css">

    <link rel="stylesheet" type="text/css" href="{$external_base_url}assets/dashboard/css/daterangepicker.css">

    <!-- Additional Styles -->
    <style type="text/css">
        /* Your custom styles here */
        {literal}
        @-webkit-keyframes yt-spin {
            0% { -webkit-transform: rotate(0deg); }
            100% { -webkit-transform: rotate(360deg); }
        }
        @keyframes yt-spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        #yt-widget, #yt-widget * {
            font: 14px Arial, Helvetica, sans-serif;
            background: none;
            border: none;
        }

        #yt-widget .yt-button {
            height: 34px;
            border: 1px solid #d5d5d5;
            padding: 0 8px;
            border-radius: 3px;
        }

        #yt-widget .yt-button__icon {
            width: 34px;
            height: 34px;
            /*background: url("your_image_url_here") no-repeat;*/
        }
        {/literal}
        .main-sidebar .sidebar-menu li.active a {
            color: #f47c3c;
            font-weight: 600;
            background-color: #fcfcfd;
        }
    </style>
</head>

<body class="sidebar-gone">
<div id="app">
    <div class="main-wrapper main-wrapper-1">
        <!-- Top Navbar -->
        <div class="navbar-bg"></div>
        <nav class="navbar navbar-expand-lg main-navbar">
            <!-- Search -->
            <form class="form-inline mr-auto">
                <ul class="navbar-nav mr-3">
                    <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
                    <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
                </ul>
                <div class="search-element">
                    <input class="form-control global-search" type="search" placeholder="Search" aria-label="Search" data-width="250">
                    <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                </div>
            </form>

            <!-- Navbar Right -->
            <ul class="navbar-nav navbar-right">
                <!-- Notifications -->
                <li id="pushNotificationArea" class="dropdown dropdown-list-toggle">
                    <a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg">
                        <i class="far fa-bell"></i>
                    </a>
                    <div class="dropdown-menu dropdown-list dropdown-menu-right shadow">
                        <div class="dropdown-header text-center text-uppercase">Notifications</div>
                        <div class="notification-panel">
                            <!-- Notification items here -->
                        </div>
                        <div class="dropdown-footer text-center align-items-center single-border-top">
                            <a href="#" class="no-underline text-capitalize">No notification found</a>
                        </div>
                    </div>
                </li>

                <!-- User Profile Menu -->
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                        <img alt="{$user.name}" src="{$user.profile_picture|default:'{$external_base_url}assets/upload/default-avatar.png'}" class="rounded-circle mr-1">
                        <div class="d-sm-none d-lg-inline-block">{$user.name}</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow-sm">
                        <a href="{$external_base_url}user/profile" class="dropdown-item has-icon">
                            <i class="far fa-user"></i> Profile
                        </a>
                        <a href="{$external_base_url}user/qr-code" class="dropdown-item has-icon">
                            <i class="fas fa-qrcode"></i> QR Code
                        </a>
                        <a href="{$external_base_url}user/change-password" class="dropdown-item has-icon">
                            <i class="fas fa-unlock-alt"></i> Change Password
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item has-icon text-danger" data-toggle="modal" data-target="#logoutModal">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </div>
                </li>
            </ul>
        </nav>

        <!-- Logout Modal -->
        <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <form id="logout-form" action="{$external_base_url}user/logout" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-danger pb-2" id="logoutModalLabel">Confirmation!</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body logout-body">
                            Are you sure you want to logout?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Logout</button>
                            <input type="hidden" name="_token" value="{$csrf_token}">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="main-sidebar sidebar-style-2 shadow-sm">
            <aside id="sidebar-wrapper">
                <div class="sidebar-brand">
                    <a href="{$external_base_url}">
                        <img src="{$external_base_url}assets/upload/logo/logo.png" class="dashboard-logo" alt="Logo">
                    </a>
                </div>
                <div class="sidebar-brand sidebar-brand-sm">
                    <a href="{$external_base_url}">
                        <img src="{$external_base_url}assets/upload/logo/favicon.png" class="dashboard-logo-sm" alt="Logo">
                    </a>
                </div>

                <ul class="sidebar-menu">
                    <li class="menu-header">Navigation</li>

                    <!-- Home Menu Item -->
                    <li class="nav-item" data-page="home">
                        <a href="{$base_url}?a=home" class="nav-link">
                            <i class="fas fa-home text-primary"></i><span>Home</span>
                        </a>
                    </li>

                    <!-- Account Menu Item -->
                    <li class="nav-item" data-page="account">
                        <a href="{$base_url}?a=account" class="nav-link">
                            <i class="fas fa-user text-info"></i><span>Account</span>
                        </a>
                    </li>

                    <!-- Make Deposit Menu Item -->
                    <li class="nav-item" data-page="deposit">
                        <a href="{$base_url}?a=deposit" class="nav-link">
                            <i class="fas fa-money-bill-alt text-success"></i><span>Make Deposit</span>
                        </a>
                    </li>

                    <!-- Your Deposits Menu Item -->
                    <li class="nav-item" data-page="deposit_list">
                        <a href="{$base_url}?a=deposit_list" class="nav-link">
                            <i class="fas fa-piggy-bank text-success"></i><span>Your Deposits</span>
                        </a>
                    </li>

                    <!-- Deposits History Menu Item -->
                    <li class="nav-item" data-page="deposit_history">
                        <a href="{$base_url}?a=deposit_history" class="nav-link">
                            <i class="fas fa-history text-success"></i><span>Deposits History</span>
                        </a>
                    </li>

                    <!-- Earnings History Menu Item -->
                    <li class="nav-item" data-page="earnings">
                        <a href="{$base_url}?a=earnings" class="nav-link">
                            <i class="fas fa-chart-line text-info"></i><span>Earnings History</span>
                        </a>
                    </li>

                    <!-- Referrals History Menu Item -->
                    <li class="nav-item" data-page="earnings_commissions">
                        <a href="{$base_url}?a=earnings&type=commissions" class="nav-link">
                            <i class="fas fa-users text-info"></i><span>Referrals History</span>
                        </a>
                    </li>

                    <!-- Withdraw Menu Item -->
                    <li class="nav-item" data-page="withdraw">
                        <a href="{$base_url}?a=withdraw" class="nav-link">
                            <i class="fas fa-wallet text-danger"></i><span>Withdraw</span>
                        </a>
                    </li>

                    <!-- Withdrawals History Menu Item -->
                    <li class="nav-item" data-page="withdraw_history">
                        <a href="{$base_url}?a=withdraw_history" class="nav-link">
                            <i class="fas fa-history text-danger"></i><span>Withdrawals History</span>
                        </a>
                    </li>

                    <!-- Your Referrals Menu Item -->
                    <li class="nav-item" data-page="referals">
                        <a href="{$base_url}?a=referals" class="nav-link">
                            <i class="fas fa-user-friends text-info"></i><span>Your Referrals</span>
                        </a>
                    </li>

                    <!-- Referral Links Menu Item -->
                    <li class="nav-item" data-page="referallinks">
                        <a href="{$base_url}?a=referallinks" class="nav-link">
                            <i class="fas fa-link text-info"></i><span>Referral Links</span>
                        </a>
                    </li>

                    <!-- Edit Account Menu Item -->
                    <li class="nav-item" data-page="edit_account">
                        <a href="{$base_url}?a=edit_account" class="nav-link">
                            <i class="fas fa-edit text-warning"></i><span>Edit Account</span>
                        </a>
                    </li>

                    <!-- Security Menu Item -->
                    <li class="nav-item" data-page="security">
                        <a href="{$base_url}?a=security" class="nav-link">
                            <i class="fas fa-shield-alt text-warning"></i><span>Security</span>
                        </a>
                    </li>

                    <!-- Logout Menu Item -->
                    <li class="nav-item" data-page="logout">
                        <a href="{$base_url}?a=logout" class="nav-link">
                            <i class="fas fa-sign-out-alt text-danger"></i><span>Logout</span>
                        </a>
                    </li>
                </ul>

            </aside>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Your page content goes here -->
        </div>

        <!-- Footer -->
        <footer class="main-footer">
            <div class="footer-left">
                &copy; {$current_year|default:2024}
                <div class="bullet"></div>
                All rights reserved by <b>Qfs Holdings</b>
            </div>
            <div class="footer-right">
                <!-- Footer right content -->
            </div>
        </footer>
    </div>
</div>

<!-- General JS Scripts -->
<script src="{$external_base_url}assets/dashboard/modules/jquery.min.js"></script>
<script src="{$external_base_url}assets/dashboard/modules/popper.js"></script>
<script src="{$external_base_url}assets/dashboard/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="{$external_base_url}assets/dashboard/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="{$external_base_url}assets/dashboard/js/stisla.js"></script>

<!-- JS Libraries -->
<script src="{$external_base_url}assets/dashboard/js/pusher.min.js"></script>
<script src="{$external_base_url}assets/dashboard/js/vue.min.js"></script>
<script src="{$external_base_url}assets/dashboard/js/axios.min.js"></script>
<script src="{$external_base_url}assets/dashboard/js/notiflix-aio-2.7.0.min.js"></script>

<!-- Template JS File -->
<script src="{$external_base_url}assets/dashboard/js/scripts.js"></script>
{literal}
    <!-- JavaScript to set the active class on the current menu item -->
    <script>
        (function() {
            // Get the 'a' parameter from the URL
            var urlParams = new URLSearchParams(window.location.search);
            var currentPage = urlParams.get('a') || 'home'; // default to 'home' if 'a' is not set
            var typeParam = urlParams.get('type');

            // Handle special cases where 'type' parameter is used
            if (currentPage === 'earnings' && typeParam === 'commissions') {
                currentPage = 'earnings_commissions';
            }

            // Get all menu items
            var menuItems = document.querySelectorAll('.sidebar-menu .nav-item');

            // Iterate over menu items
            menuItems.forEach(function(menuItem) {
                var page = menuItem.getAttribute('data-page');
                if (page === currentPage) {
                    menuItem.classList.add('active');
                } else {
                    menuItem.classList.remove('active');
                }
            });
        })();
    </script>
<script>
        // JavaScript to set the active class on the current menu item
        (function() {
        // Get the 'a' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var currentPage = urlParams.get('a') || 'dashboard'; // default to 'dashboard' if 'a' is not set

        // Get all menu items
        var menuItems = document.querySelectorAll('.sidebar-menu .nav-item');

        // Iterate over menu items
        menuItems.forEach(function(menuItem) {
        var page = menuItem.getAttribute('data-page');
        if (page === currentPage) {
        menuItem.classList.add('active');
    } else {
        menuItem.classList.remove('active');
    }
    });
    })();

    $(document).ready(function () {
        $(document).ajaxStart(function () {
            $('#wait').removeClass('d-none').show();
        });
        $(document).ajaxComplete(function () {
            $('#wait').hide();
        });
    });
</script>

<script>
    'use strict';
    let pushNotificationArea = new Vue({
        el: "#pushNotificationArea",
        data: {
            items: [],
        },
        beforeMount() {
            this.getNotifications();
            this.pushNewItem();
        },
        methods: {
            getNotifications() {
                let app = this;
                axios.get("{$external_base_url}user/push-notification-show")
                    .then(function (res) {
                        app.items = res.data;
                    })
            },
            readAt(id, link) {
                let app = this;
                let url = "{$external_base_url}user/push-notification-readAt/" + id;
                axios.get(url)
                    .then(function (res) {
                        if (res.status) {
                            app.getNotifications();
                            if (link !== '#') {
                                window.location.href = link
                            }
                        }
                    })
            },
            readAll() {
                let app = this;
                let url = "{$external_base_url}user/push.notification.readAll";
                axios.get(url)
                    .then(function (res) {
                        if (res.status) {
                            app.items = [];
                        }
                    })
            },
            pushNewItem() {
                let app = this;
                Pusher.logToConsole = false;
                let pusher = new Pusher("your_app_KEY", {
                    encrypted: true,
                    cluster: "ap2"
                });
                let channel = pusher.subscribe('user-notification.' + "{$user.id}");
                channel.bind('App\\Events\\UserNotification', function (data) {
                    app.items.unshift(data.message);
                });
                channel.bind('App\\Events\\UpdateUserNotification', function (data) {
                    app.getNotifications();
                });
            }
        }
    });

    // Global search functionality
    $(document).on('input', '.global-search', function () {
        var search = $(this).val().toLowerCase();

        if (search.length == 0) {
            $('.search-result').find('.content').html('');
            $(this).siblings('.search-backdrop').addClass('d-none');
            $(this).siblings('.search-result').addClass('d-none');
            return false;
        }

        $('.search-result').find('.content').html('');
        $(this).siblings('.search-backdrop').removeClass('d-none');
        $(this).siblings('.search-result').removeClass('d-none');

        var match = $('.sidebar-menu li').filter(function (idx, element) {
            if (!$(element).find('a').hasClass('has-dropdown') && !$(element).hasClass('menu-header'))
                return $(element).text().trim().toLowerCase().indexOf(search) >= 0 ? element : null;
        }).sort();

        if (match.length == 0) {
            $('.search-result').find('.content').append(`<div class="search-item"><a href="javascript:void(0)">No result found</a></div>`);
            return false;
        }

        match.each(function (index, element) {
            var item_text = $(element).text().replace(/(\d+)/g, '').trim();
            var item_url = $(element).find('a').attr('href');
            if (item_url != '#') {
                $('.search-result').find('.content').append(`<div class="search-item"><a href="${item_url}">${item_text}</a></div>`);
            }
        });
    });
</script>
{/literal}

<!-- Additional JS Libraries -->
<script src="{$external_base_url}assets/dashboard/js/Chart.min.js"></script>
<script type="text/javascript" src="{$external_base_url}assets/dashboard/js/moment.min.js"></script>
<script type="text/javascript" src="{$external_base_url}assets/dashboard/js/daterangepicker.min.js"></script>
<script src="{$external_base_url}assets/dashboard/js/qrjs2.min.js"></script>


<div style="position: fixed !important; z-index: 12000; bottom: 0;">
    <div id="ytWidget"></div>
    <script src="https://translate.yandex.net/website-widget/v1/widget.js?widgetId=ytWidget&amp;pageLang=en&amp;widgetTheme=dark&amp;autoMode=false" type="text/javascript"></script>
</div>
<!-- Firebase and other scripts -->
<!-- Include your Firebase and other necessary scripts here, ensuring to replace any URLs with variables -->

<!-- Optional: Include any additional scripts provided, making sure to adjust paths and variables -->

</body>
</html>
