<!-- Footer -->
<?php
$external_base_url = 'https://qfsholdings.io/';
$site_name  = 'Quantum Ledger Financial System';
?>
<footer class="main-footer">
    <div class="footer-left">
        &copy; <?= date('Y') ?>
        <div class="bullet"></div>
        All rights reserved by <b><?php echo $site_name; ?></b>
    </div>
    <div class="footer-right">
        <!-- Footer right content -->
    </div>
</footer>
</div>
</div>

<!-- General JS Scripts -->
<script src="<?= $external_base_url ?>assets/dashboard/modules/jquery.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/modules/popper.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/js/stisla.js"></script>

<!-- JS Libraries -->
<script src="<?= $external_base_url ?>assets/dashboard/js/pusher.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/js/vue.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/js/axios.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/js/notiflix-aio-2.7.0.min.js"></script>

<!-- Template JS File -->
<script src="<?= $external_base_url ?>assets/dashboard/js/scripts.js"></script>
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

<!-- Additional JS Libraries -->
<script src="<?= $external_base_url ?>assets/dashboard/js/Chart.min.js"></script>
<script type="text/javascript" src="<?= $external_base_url ?>assets/dashboard/js/moment.min.js"></script>
<script type="text/javascript" src="<?= $external_base_url ?>assets/dashboard/js/daterangepicker.min.js"></script>
<script src="<?= $external_base_url ?>assets/dashboard/js/qrjs2.min.js"></script>


<div style="position: fixed !important; z-index: 12000; bottom: 0;">
    <div id="ytWidget"></div>
    <script src="https://translate.yandex.net/website-widget/v1/widget.js?widgetId=ytWidget&amp;pageLang=en&amp;widgetTheme=dark&amp;autoMode=false" type="text/javascript"></script>
</div>

</body>
</html>
