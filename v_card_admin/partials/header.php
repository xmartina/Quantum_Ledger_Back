<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8" />
    <title><?= 'Admin | ' .  $page_name ?>  | <?= $site_name ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?= $site_name ?>"/>
    <meta name="author" content="<?= $site_name ?>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="<?= $favicon_url ?>">

    <!-- App css -->
    <link href="<?= $asset_link ?>assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons -->
    <link href="<?= $asset_link ?>assets/css/icons.min.css" rel="stylesheet" type="text/css" />

</head>

<!-- body start -->
<body data-menu-color="dark" data-sidebar="default">

<!-- Begin page -->
<div id="app-layout">


    <!-- Topbar Start -->
    <div class="topbar-custom">
        <div class="container-fluid">
            <div class="d-flex justify-content-between">
                <ul class="list-unstyled topnav-menu mb-0 d-flex align-items-center">
                    <li>
                        <button class="button-toggle-menu nav-link">
                            <i data-feather="menu" class="noti-icon"></i>
                        </button>
                    </li>
                    <li class="d-none d-lg-block">
                        <div class="position-relative topbar-search">
                            <input type="text" class="form-control bg-light bg-opacity-75 border-light ps-4" placeholder="Search...">
                            <i class="mdi mdi-magnify fs-16 position-absolute text-muted top-50 translate-middle-y ms-2"></i>
                        </div>
                    </li>
                </ul>
                <ul class="list-unstyled topnav-menu mb-0 d-flex align-items-center">

                    <li class="dropdown notification-list topbar-dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i data-feather="bell" class="noti-icon"></i>
                            <span class="badge bg-danger rounded-circle noti-icon-badge">9</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-lg">

                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="m-0">
                                            <span class="float-end">
                                                <a href="" class="text-dark">
                                                    <small>Clear All</small>
                                                </a>
                                            </span>Notification
                                </h5>
                            </div>

                            <div class="noti-scroll" data-simplebar>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item text-muted link-primary active">
                                    <div class="notify-icon">
                                        <img src="<?= $asset_link ?>assets/images/users/user-12.jpg" class="img-fluid rounded-circle" alt="" />
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <p class="notify-details">Carl Steadham</p>
                                        <small class="text-muted">5 min ago</small>
                                    </div>
                                    <p class="mb-0 user-msg">
                                        <small class="fs-14">Completed <span class="text-reset">Improve workflow in Figma</span></small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item text-muted link-primary">
                                    <div class="notify-icon">
                                        <img src="<?= $asset_link ?>assets/images/users/user-2.jpg" class="img-fluid rounded-circle" alt="" />
                                    </div>
                                    <div class="notify-content">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <p class="notify-details">Olivia McGuire</p>
                                            <small class="text-muted">1 min ago</small>
                                        </div>
                                        <p class="mb-1 user-msg">
                                            <small class="fs-14">Added file to <span class="text-reset text-truncate">Create dark mode for our iOS</span></small>
                                        </p>

                                        <div class="d-flex mt-2 align-items-center">
                                            <div class="notify-sub-icon">
                                                <i class="mdi mdi-download-box text-dark"></i>
                                            </div>

                                            <div>
                                                <p class="notify-details mb-0">dark-themes.zip</p>
                                                <small class="text-muted">2.4 MB</small>
                                            </div>
                                        </div>

                                    </div>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item text-muted link-primary">
                                    <div class="notify-icon">
                                        <img src="<?= $asset_link ?>assets/images/users/user-3.jpg" class="img-fluid rounded-circle" alt="" />
                                    </div>
                                    <div class="notify-content">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <p class="notify-details">Travis Williams</p>
                                            <small class="text-muted">7 min ago</small>
                                        </div>
                                        <p class="mb-1 user-msg">
                                            <small class="fs-14">Mentioned you in the <span class="text-reset text-truncate">Rewrite text-button</span></small>
                                        </p>
                                        <p class="noti-mentioned p-2 rounded-2 mb-0 mt-2"><span class="text-primary">@Patryk</span> Please make sure that you're....</p>
                                    </div>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item text-muted link-primary">
                                    <div class="notify-icon">
                                        <img src="<?= $asset_link ?>assets/images/users/user-8.jpg" class="img-fluid rounded-circle" alt="" />
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <p class="notify-details">Violette Lasky</p>
                                        <small class="text-muted">5 min ago</small>
                                    </div>
                                    <p class="mb-0 user-msg">
                                        <small class="fs-14">Completed <span class="text-reset">Create new components</span></small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item text-muted link-primary">
                                    <div class="notify-icon">
                                        <img src="<?= $asset_link ?>assets/images/users/user-5.jpg" class="img-fluid rounded-circle" alt="" />
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <p class="notify-details">Ralph Edwards</p>
                                        <small class="text-muted">5 min ago</small>
                                    </div>
                                    <p class="mb-0 user-msg">
                                        <small class="fs-14">Completed <span class="text-reset">Improve workflow in React</span></small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item text-muted link-primary">
                                    <div class="notify-icon">
                                        <img src="<?= $asset_link ?>assets/images/users/user-6.jpg" class="img-fluid rounded-circle" alt="" />
                                    </div>
                                    <div class="notify-content">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <p class="notify-details">Jocab jones</p>
                                            <small class="text-muted">7 min ago</small>
                                        </div>
                                        <p class="mb-1 user-msg">
                                            <small class="fs-14">Mentioned you in the <span class="text-reset text-truncate">Rewrite text-button</span></small>
                                        </p>
                                        <p class="noti-mentioned p-2 rounded-2 mb-0 mt-2"><span class="text-reset">@Patryk</span> Please make sure that you're....</p>
                                    </div>
                                </a>
                            </div>

                            <!-- All-->
                            <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                                View all
                                <i class="fe-arrow-right"></i>
                            </a>

                        </div>
                    </li>

                    <li class="dropdown notification-list topbar-dropdown">
                        <a class="nav-link dropdown-toggle nav-user me-0" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="<?= $asset_link ?>assets/images/users/user-11.jpg" alt="user-image" class="rounded-circle">
                            <span class="pro-user-name ms-1">
                                        Christian <i class="mdi mdi-chevron-down"></i>
                                    </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end profile-dropdown ">
                            <!-- item-->
                            <div class="dropdown-header noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            <!-- item-->
                            <a href="pages-profile.html" class="dropdown-item notify-item">
                                <i class="mdi mdi-account-circle-outline fs-16 align-middle"></i>
                                <span>My Account</span>
                            </a>

                            <!-- item-->
                            <a href="auth-lock-screen.html" class="dropdown-item notify-item">
                                <i class="mdi mdi-lock-outline fs-16 align-middle"></i>
                                <span>Lock Screen</span>
                            </a>

                            <div class="dropdown-divider"></div>

                            <!-- item-->
                            <a href="auth-logout.html" class="dropdown-item notify-item">
                                <i class="mdi mdi-location-exit fs-16 align-middle"></i>
                                <span>Logout</span>
                            </a>

                        </div>
                    </li>

                </ul>
            </div>

        </div>

    </div>
    <!-- end Topbar -->

    <!-- Left Sidebar Start -->
    <div class="app-sidebar-menu">
        <div class="h-100" data-simplebar>

            <!--- Sidemenu -->
            <div id="sidebar-menu">

                <div class="logo-box">
                    <a href="<?= $base_url ?>" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="<?= $site_logo ?>" alt="" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<?= $site_logo ?>" alt="" height="24">
                                </span>
                    </a>
                    <a href="<?= $base_url ?>" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="<?= $site_logo ?>" alt="" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<?= $site_logo ?>" alt="" height="24">
                                </span>
                    </a>
                </div>

                <ul id="side-menu">

                    <li class="menu-title">Menu</li>

                    <li>
                        <a href="index.html">
                            <i data-feather="home"></i>
                            <span class="badge bg-success rounded-pill float-end">9+</span>
                            <span> Dashboard </span>
                        </a>
                    </li>

                    <li>
                        <a href="widgets.html">
                            <i data-feather="aperture"></i>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-aperture"><circle cx="12" cy="12" r="10"></circle><line x1="14.31" y1="8" x2="20.05" y2="17.94"></line><line x1="9.69" y1="8" x2="21.17" y2="8"></line><line x1="7.38" y1="12" x2="13.12" y2="2.06"></line><line x1="9.69" y1="16" x2="3.95" y2="6.06"></line><line x1="14.31" y1="16" x2="2.83" y2="16"></line><line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
                            <span> Widgets </span>
                        </a>
                    </li>

                    <li>
                        <a href="landing.html" target="_blank">
                            <i data-feather="globe"></i>
                            <span> Landing </span>
                        </a>
                    </li>

                    <li class="menu-title">Pages</li>

                    <li>
                        <a href="#sidebarAuth" data-bs-toggle="collapse">
                            <i data-feather="users"></i>
                            <span> Authentication </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarAuth">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="auth-login.html">Log In</a>
                                </li>
                                <li>
                                    <a href="auth-register.html">Register</a>
                                </li>
                                <li>
                                    <a href="auth-recoverpw.html">Recover Password</a>
                                </li>
                                <li>
                                    <a href="auth-lock-screen.html">Lock Screen</a>
                                </li>
                                <li>
                                    <a href="auth-confirm-mail.html">Confirm Mail</a>
                                </li>
                                <li>
                                    <a href="email-verification.html">Email Verification</a>
                                </li>
                                <li>
                                    <a href="auth-logout.html">Logout</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#sidebarError" data-bs-toggle="collapse">
                            <i data-feather="alert-octagon"></i>
                            <span> Error Pages </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarError">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="error-404.html">Error 404</a>
                                </li>
                                <li>
                                    <a href="error-500.html">Error 500</a>
                                </li>
                                <li>
                                    <a href="error-503.html">Error 503</a>
                                </li>
                                <li>
                                    <a href="error-429.html">Error 429</a>
                                </li>
                                <li>
                                    <a href="offline-page.html">Offline Page</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarExpages" data-bs-toggle="collapse">
                            <i data-feather="file-text"></i>
                            <span> Utility </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarExpages">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="pages-starter.html">Starter</a>
                                </li>
                                <li>
                                    <a href="pages-profile.html">Profile</a>
                                </li>
                                <li>
                                    <a href="pages-pricing.html">Pricing</a>
                                </li>
                                <li>
                                    <a href="pages-timeline.html">Timeline</a>
                                </li>
                                <li>
                                    <a href="pages-invoice.html">Invoice</a>
                                </li>
                                <li>
                                    <a href="pages-faqs.html">FAQs</a>
                                </li>
                                <li>
                                    <a href="pages-gallery.html">Gallery</a>
                                </li>
                                <li>
                                    <a href="pages-maintenance.html">Maintenance</a>
                                </li>
                                <li>
                                    <a href="pages-coming-soon.html">Coming Soon</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="menu-title mt-2">General</li>

                    <li>
                        <a href="#sidebarBaseui" data-bs-toggle="collapse">
                            <i data-feather="package"></i>
                            <span> Components </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarBaseui">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="ui-accordions.html">Accordions</a>
                                </li>
                                <li>
                                    <a href="ui-alerts.html">Alerts</a>
                                </li>
                                <li>
                                    <a href="ui-badges.html">Badges</a>
                                </li>
                                <li>
                                    <a href="ui-breadcrumb.html">Breadcrumb</a>
                                </li>
                                <li>
                                    <a href="ui-buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="ui-cards.html">Cards</a>
                                </li>
                                <li>
                                    <a href="ui-collapse.html">Collapse</a>
                                </li>
                                <li>
                                    <a href="ui-dropdowns.html">Dropdowns</a>
                                </li>
                                <li>
                                    <a href="ui-video.html">Embed Video</a>
                                </li>
                                <li>
                                    <a href="ui-grid.html">Grid</a>
                                </li>
                                <li>
                                    <a href="ui-images.html">Images</a>
                                </li>
                                <li>
                                    <a href="ui-list.html">List Group</a>
                                </li>
                                <li>
                                    <a href="ui-modals.html">Modals</a>
                                </li>
                                <li>
                                    <a href="ui-placeholders.html">Placeholders</a>
                                </li>
                                <li>
                                    <a href="ui-pagination.html">Pagination</a>
                                </li>
                                <li>
                                    <a href="ui-popovers.html">Popovers</a>
                                </li>
                                <li>
                                    <a href="ui-progress.html">Progress</a>
                                </li>
                                <li>
                                    <a href="ui-scrollspy.html">Scrollspy</a>
                                </li>
                                <li>
                                    <a href="ui-spinners.html">Spinners</a>
                                </li>
                                <li>
                                    <a href="ui-tabs.html">Tabs</a>
                                </li>
                                <li>
                                    <a href="ui-tooltips.html">Tooltips</a>
                                </li>
                                <li>
                                    <a href="ui-typography.html">Typography</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarAdvancedUI" data-bs-toggle="collapse">
                            <i data-feather="cpu"></i>
                            <span> Extended UI </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarAdvancedUI">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="extended-carousel.html">Carousel</a>
                                </li>
                                <li>
                                    <a href="extended-notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="extended-offcanvas.html">Offcanvas</a>
                                </li>
                                <li>
                                    <a href="extended-range-slider.html">Range Slider</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarIcons" data-bs-toggle="collapse">
                            <i data-feather="award"></i>
                            <span> Icons </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarIcons">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="icons-feather.html">Feather Icons</a>
                                </li>
                                <li>
                                    <a href="icons-mdi.html">Material Design Icons</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarForms" data-bs-toggle="collapse">
                            <i data-feather="briefcase"></i>
                            <span> Forms </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarForms">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="forms-elements.html">General Elements</a>
                                </li>
                                <li>
                                    <a href="forms-validation.html">Validation</a>
                                </li>
                                <li>
                                    <a href="forms-quilljs.html">Quilljs Editor</a>
                                </li>
                                <li>
                                    <a href="forms-pickers.html">Picker</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarTables" data-bs-toggle="collapse">
                            <i data-feather="table"></i>
                            <span> Tables </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarTables">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="tables-basic.html">Basic Tables</a>
                                </li>
                                <li>
                                    <a href="tables-datatables.html">Data Tables</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarCharts" data-bs-toggle="collapse">
                            <i data-feather="pie-chart"></i>
                            <span> Apex Charts </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarCharts">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="charts-line.html">Line</a>
                                </li>
                                <li>
                                    <a href="charts-area.html">Area</a>
                                </li>
                                <li>
                                    <a href="charts-column.html">Column</a>
                                </li>
                                <li>
                                    <a href="charts-bar.html">Bar</a>
                                </li>
                                <li>
                                    <a href="charts-mixed.html">Mixed</a>
                                </li>
                                <li>
                                    <a href="charts-timeline.html">Timeline</a>
                                </li>
                                <li>
                                    <a href="charts-rangearea.html">Range Area</a>
                                </li>
                                <li>
                                    <a href="charts-funnel.html">Funnel</a>
                                </li>
                                <li>
                                    <a href="charts-candlestick.html">Candlestick</a>
                                </li>
                                <li>
                                    <a href="charts-boxplot.html">Boxplot</a>
                                </li>
                                <li>
                                    <a href="charts-bubble.html">Bubble</a>
                                </li>
                                <li>
                                    <a href="charts-scatter.html">Scatter</a>
                                </li>
                                <li>
                                    <a href="charts-heatmap.html">Heatmap</a>
                                </li>
                                <li>
                                    <a href="charts-treemap.html">Treemap</a>
                                </li>
                                <li>
                                    <a href="charts-pie.html">Pie</a>
                                </li>
                                <li>
                                    <a href="charts-radialbar.html">Radialbar</a>
                                </li>
                                <li>
                                    <a href="charts-radar.html">Radar</a>
                                </li>
                                <li>
                                    <a href="charts-polararea.html">Polar</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
            <!-- End Sidebar -->

            <div class="clearfix"></div>

        </div>
    </div>
    <!-- Left Sidebar End -->