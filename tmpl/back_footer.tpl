<!-- Footer -->
<footer class="main-footer">
    <div class="footer-left">
        Copyright © 2024
        <div class="bullet"></div>
        All rights reserved by <b>Qfs Holdings</b>
    </div>

    <div class="footer-right">

    </div>
</footer>
</div>
</div>

<!-- General JS Scripts -->
<script src="https://qfsholdings.io/assets/dashboard/modules/jquery.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/modules/popper.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/js/stisla.js"></script>

<!-- JS Libraies -->
<script src="https://qfsholdings.io/assets/dashboard/js/pusher.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/js/vue.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/js/axios.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/js/notiflix-aio-2.7.0.min.js"></script>

<!-- Template JS File -->
<script src="https://qfsholdings.io/assets/dashboard/js/scripts.js"></script>

<script>
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
                axios.get("https://qfsholdings.io/user/push-notification-show")
                    .then(function (res) {
                        app.items = res.data;
                    })
            },
            readAt(id, link) {
                let app = this;
                let url = "https://qfsholdings.io/user/push-notification-readAt/0";
                url = url.replace(/.$/, id);
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
                let url = "https://qfsholdings.io/user/push.notification.readAll";
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
                let channel = pusher.subscribe('user-notification.' + "525");
                channel.bind('App\\Events\\UserNotification', function (data) {
                    app.items.unshift(data.message);
                });
                channel.bind('App\\Events\\UpdateUserNotification', function (data) {
                    app.getNotifications();
                });
            }
        }
    });

    // for search
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


<script src="https://qfsholdings.io/assets/dashboard/js/Chart.min.js"></script>
<script type="text/javascript" src="https://qfsholdings.io/assets/dashboard/js/moment.min.js"></script>
<script type="text/javascript" src="https://qfsholdings.io/assets/dashboard/js/daterangepicker.min.js"></script>
<script src="https://qfsholdings.io/assets/dashboard/js/qrjs2.min.js"></script>
<script type="module">
    import {initializeApp} from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
    import {
        getMessaging,
        getToken,
        onMessage
    } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-messaging.js";

    const firebaseConfig = {
        apiKey: "Your_API Key",
        authDomain: "appSecret",
        projectId: "Project_Id",
        storageBucket: "Storage_Bucket",
        messagingSenderId: "Sender_Id",
        appId: "App_Id",
        measurementId: "Measurement_Id"
    };

    const app = initializeApp(firebaseConfig);
    const messaging = getMessaging(app);
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('' + `/firebase-messaging-sw.js`, {scope: './'}).then(function (registration) {
                requestPermissionAndGenerateToken(registration);
            }
        ).catch(function (error) {
        });
    } else {
    }

    onMessage(messaging, (payload) => {
        if (payload.data.foreground || parseInt(payload.data.foreground) == 1) {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.body,
                icon: payload.notification.icon,
            };
            new Notification(title, options);
        }
    });

    function requestPermissionAndGenerateToken(registration) {
        document.addEventListener("click", function (event) {
            if (event.target.id == 'allow-notification') {
                Notification.requestPermission().then((permission) => {
                    if (permission === 'granted') {
                        getToken(messaging, {
                            serviceWorkerRegistration: registration,
                            vapidKey: "Your_Vapid Key"
                        })
                            .then((token) => {
                                $.ajax({
                                    url: "https://qfsholdings.io/user/save-token",
                                    method: "post",
                                    data: {
                                        token: token,
                                    },
                                    success: function (res) {
                                    }
                                });
                                window.newApp.notificationPermission = 'granted';
                            });
                    } else {
                        window.newApp.notificationPermission = 'denied';
                    }
                });
            }
        });
    }
</script>
<script>
    window.newApp = new Vue({
        el: "#firebase-app",
        data: {
            user_foreground: '',
            user_background: '',
            notificationPermission: Notification.permission,
            is_notification_skipped: sessionStorage.getItem('is_notification_skipped') == '1'
        },
        mounted() {
            this.user_foreground = "0";
            this.user_background = "0";
        },
        methods: {
            skipNotification() {
                sessionStorage.setItem('is_notification_skipped', '1');
                this.is_notification_skipped = true;
            }
        }
    });
</script>
<script src="//code.jivosite.com/widget/ee9SIvS6PZ" async=""></script>

<div style="position: fixed !important; z-index: 12000; bottom: 0;">
    <div id="ytWidget"></div>
    <script src="https://translate.yandex.net/website-widget/v1/widget.js?widgetId=ytWidget&amp;pageLang=en&amp;widgetTheme=dark&amp;autoMode=false"
            type="text/javascript"></script>
</div>


<script>
    'use strict';
    $(document).ready(function () {
        $('input[name="daterange"]').daterangepicker({
            opens: 'left',
            startDate: moment().startOf('month'),
            endDate: moment().endOf('month'),
            locale: {
                format: 'MMMM D, YYYY'
            }
        }, function (start, end, label) {
            getTransaction(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
        });

        function getTransaction(start, end) {
            $.ajax({
                method: "GET",
                url: "https://qfsholdings.io/user/get-transaction-chart",
                dataType: "json",
                data: {
                    'start': start,
                    'end': end,
                }
            })
                .done(function (response) {
                    new Chart(document.getElementById("line-chart"), {
                        type: 'line',
                        data: {
                            labels: response.labels,
                            datasets: [
                                {
                                    data: response.dataDeposit,
                                    label: "Deposit",
                                    borderColor: "#1abc9c",
                                    fill: false
                                },
                                {
                                    data: response.dataFund,
                                    label: "Add Fund",
                                    borderColor: "#00cec9",
                                    fill: false
                                },
                                {
                                    data: response.dataTransfer,
                                    label: "Send Money",
                                    borderColor: "#3498db",
                                    fill: false
                                },
                                {
                                    data: response.dataRequestMoney,
                                    label: "Request Money",
                                    borderColor: "#9b59b6",
                                    fill: false
                                },
                                {
                                    data: response.dataVoucher,
                                    label: "Voucher",
                                    borderColor: "#6b7b98",
                                    fill: false
                                },
                                {
                                    data: response.dataInvoice,
                                    label: "Invoice",
                                    borderColor: "#6777ef",
                                    fill: false
                                },
                                {
                                    data: response.dataRedeem,
                                    label: "Redeem Code",
                                    borderColor: "#f39c12",
                                    fill: false
                                },
                                {
                                    data: response.dataEscrow,
                                    label: "Escrow",
                                    borderColor: "#273c75",
                                    fill: false
                                },
                                {
                                    data: response.dataPayout,
                                    label: "Payout",
                                    borderColor: "#bdc3c7",
                                    fill: false
                                },
                                {
                                    data: response.dataExchange,
                                    label: "Exchange",
                                    borderColor: "#e74c3c",
                                    fill: false
                                },
                                {
                                    data: response.dataDispute,
                                    label: "Dispute",
                                    borderColor: "#8e44ad",
                                    fill: false
                                },
                                {
                                    data: response.dataCommissionEntry,
                                    label: "Commission",
                                    borderColor: "#5444ad",
                                    fill: false
                                },
                            ]
                        }
                    });
                });
        }

        new Chart(document.getElementById("line-chart"), {
            type: 'line',
            data: {
                labels: ["1st Sep", "2nd Sep", "3rd Sep", "4th Sep", "5th Sep", "6th Sep", "7th Sep", "8th Sep", "9th Sep", "10th Sep", "11th Sep", "12th Sep", "13th Sep", "14th Sep", "15th Sep", "16th Sep", "17th Sep", "18th Sep", "19th Sep", "20th Sep", "21st Sep", "22nd Sep", "23rd Sep", "24th Sep", "25th Sep", "26th Sep", "27th Sep", "28th Sep", "29th Sep", "30th Sep"],
                datasets: [
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Deposit",
                        borderColor: "#1abc9c",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Add Fund",
                        borderColor: "#00cec9",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Send Money",
                        borderColor: "#3498db",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Request Money",
                        borderColor: "#9b59b6",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "QR Payment",
                        borderColor: "#CCFB5D",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Voucher",
                        borderColor: "#6b7b98",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Invoice",
                        borderColor: "#6777ef",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Redeem Code",
                        borderColor: "#f39c12",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Escrow",
                        borderColor: "#273c75",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Payout",
                        borderColor: "#bdc3c7",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Exchange",
                        borderColor: "#e74c3c",
                        fill: false
                    },
                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Dispute",
                        borderColor: "#8e44ad",
                        fill: false
                    },

                    {
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                        label: "Commission",
                        borderColor: "#5444ad",
                        fill: false
                    },
                ]
            }
        });
    });

    var qr = QRCode.generatePNG(document.getElementById('qrUrl').value, {
        ecclevel: "M",
        format: "html",
        margin: 4,
        modulesize: 8
    });

    var img = document.createElement("img");
    img.src = qr;
    document.getElementById('qrcode').appendChild(img);

    //For download
    var download = document.getElementById('download-qr').href = qr;

</script>
<script>
    (function ($) {

        "use strict";
        $('.addBtn').on('click', (e) => {
            var modal = $('#addModal');
            modal.modal('show');
        });
    })(jQuery);
</script>


<div id="ascrail2000" class="nicescroll-rails nicescroll-rails-vr"
     style="width: 8px; z-index: 892; cursor: default; position: fixed; top: 0px; left: -8px; height: 750px; display: block; opacity: 0;">
    <div class="nicescroll-cursors"
         style="position: relative; top: 38px; float: right; width: 6px; height: 553px; background-color: rgb(66, 66, 66); border: 1px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 5px;"></div>
</div>
<div id="ascrail2000-hr" class="nicescroll-rails nicescroll-rails-hr"
     style="height: 8px; z-index: 892; top: 742px; left: -250px; position: fixed; cursor: default; display: none; width: 242px; opacity: 0;">
    <div class="nicescroll-cursors"
         style="position: absolute; top: 0px; height: 6px; width: 250px; background-color: rgb(66, 66, 66); border: 1px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 5px; left: 0px;"></div>
</div>
<div class="daterangepicker ltr show-calendar opensleft">
    <div class="ranges"></div>
    <div class="drp-calendar left">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
    </div>
    <div class="drp-calendar right">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
    </div>
    <div class="drp-buttons"><span class="drp-selected"></span>
        <button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button>
        <button class="applyBtn btn btn-sm btn-primary" disabled="disabled" type="button">Apply</button>
    </div>
</div>
<div id="jivo-iframe-container" style="opacity: 0; visibility: hidden; width: 0px; height: 0px; overflow: hidden;">
    <iframe src="" role="presentation" allow="autoplay" title="Jivochat" name="jivo_container" id="jivo_container"
            frameborder="no"></iframe>
</div>
<jdiv>
    <jdiv class="globalClass__d0GCg global__jdATm __light__edPA8 __green__GXSmN jv-windows jv-chrome jv-desktop">
        <jdiv translate="no" class="notranslate"
              style="animation-duration: 300ms; animation-timing-function: cubic-bezier(0.39, 0.24, 0.21, 0.99); animation-delay: 0s; animation-iteration-count: 1; animation-direction: normal; animation-fill-mode: both; animation-play-state: running; animation-name: Label_CLOSE_WIDGET__eblJA; display: block; z-index: 2147483646; position: fixed;">
            <jdiv class="label__lgjcF _bottom__I_D1j __show__lQHWr notranslate" translate="no" id="jvlabelWrap"
                  style="max-width: calc(-80px + 100vw); bottom: 0px; right: 40px; background: linear-gradient(95deg, rgb(143, 0, 0) 20%, rgb(143, 0, 0) 80%);">
                <jdiv class="labelStatus__jhdax"
                      style="background-image: url(&quot;data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2220%22%20height%3D%2220%22%20viewBox%3D%220%200%2020%2020%22%3E%0A%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20d%3D%22M0%200h20v20H0z%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20stroke%3D%22%23F0F1F1%22%20stroke-width%3D%221.5%22%20d%3D%22M3%203h14a2%202%200%200%201%202%202v10a2%202%200%200%201-2%202H3a2%202%200%200%201-2-2V5a2%202%200%200%201%202-2z%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20stroke%3D%22%23F0F1F1%22%20stroke-width%3D%221.5%22%20d%3D%22M16.074%207.064l-6.01%204.01-6.01-4.01%22%2F%3E%0A%20%20%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A&quot;);"></jdiv>
                <jdiv class="hoverl__OOXHI">
                    <jdiv class="omnichannel__TLA5j bottom__QXMN7"></jdiv>
                </jdiv>
                <jdiv class="text__FH9R7 contentTransitionWrap__CGmtA _offline__QQlLh"
                      style="font-size: 15px; font-family: Arial, Arial; font-style: normal; color: rgb(240, 241, 241);">
                    Send us a message
                </jdiv>
                <jdiv class="copy__YWgvE">
                    <jdiv class="logo__uY9vf _bottom__kcIOF">
                        <jdiv class="hoverBox__rc226"></jdiv>
                        <jdiv class="logoIcon__Tsg2g"
                              style="background-image: url(&quot;data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22108%22%20height%3D%2236%22%20viewBox%3D%220%200%20108%2036%22%3E%0A%20%20%20%20%3Cg%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%23F0F1F1%22%20fill-rule%3D%22evenodd%22%20d%3D%22M6.342%2011.967H.957c-.2%200-.4%200-.6.2%200%20.2-.198.2-.198.4v1.993c0%20.2%200%20.4.198.6.2.198.4.198.6.198h2.79v14.36c0%201.397-1.196%202.594-2.392%202.594h-.4c-.2%200-.398%200-.598.2-.2.2-.2.398-.2.598v1.994c0%20.2%200%20.4.2.6.2.198.4.198.6.198h.198c3.192%200%205.785-2.792%205.785-5.984V12.566c0-.2%200-.4-.2-.6h-.398m6.98%200H11.33c-.2%200-.2%200-.4.2s-.2.2-.2.4v14.76c0%20.2%200%20.398.2.598.2.2.4.2.598.2h1.795c.2%200%20.4%200%20.598-.2.2-.2.2-.4.2-.598v-14.76c0-.2%200-.4-.198-.6h-.6m17.154%200H28.88c-.598%200-.997.2-.997.4l-4.388%209.973-4.188-9.974c0-.4-.4-.4-.6-.4h-1.993c-.4%200-.598%200-.598.2-.2.2-.2.4%200%20.6l6.78%2015.357c.2.2.4.4.6.4h.2c.198%200%20.597-.2.597-.4l6.782-15.358c.2-.2.2-.4%200-.598-.2-.2-.4-.2-.6-.2m9.176-.4c-2.193.002-3.988.8-5.584%202.594-1.595%201.597-2.393%203.592-2.393%205.985%200%202.393.798%204.388%202.393%205.984%201.596%201.794%203.39%202.592%205.585%202.592s3.99-.798%205.586-2.593c1.596-1.796%202.394-3.79%202.394-5.985%200-2.393-.798-4.388-2.394-5.984-1.596-1.794-3.59-2.591-5.585-2.591m3.193%2012.165c-.798.998-1.995%201.596-3.192%201.596-1.395%200-2.392-.398-3.39-1.395-.797-.998-1.396-2.194-1.396-3.79%200-1.396.4-2.792%201.397-3.59.798-.997%201.995-1.396%203.39-1.396%201.398%200%202.395.398%203.193%201.395.797.997%201.396%202.194%201.396%203.59s-.6%202.593-1.397%203.59m19.147-.598c-.398-.4-.797-.2-.997%200l-.4.4-.597.597c-.2.2-.4.2-.6.4-.198.2-.597.398-.796.398-.4%200-.6.2-.998.2-1.396%200-2.393-.6-3.19-1.596-.8-.998-1.397-2.194-1.397-3.79%200-1.396.4-2.792%201.396-3.79.998-.997%201.996-1.396%203.392-1.396%201.197%200%202.194.6%203.19%201.596.4.4.8.4.998.2l1.197-1.197s0-.4-.4-.8c-1.395-1.794-3.39-2.79-5.584-2.79-2.194-.002-3.99.796-5.584%202.59-1.597%201.597-2.395%203.592-2.395%205.985%200%202.393.798%204.388%202.394%206.183%201.594%201.596%203.39%202.394%205.583%202.394%202.593%200%204.588-1.197%205.984-3.39.2-.4.2-.8-.2-1.198l-.997-.997m11.57-11.569c-1.597%200-2.993.6-4.59%201.796V4.986c0-.2%200-.4-.198-.598-.2-.2-.4-.2-.6-.2H66.38c-.2%200-.398%200-.598.2-.2.2-.2.4-.2.598v22.54c0%20.198%200%20.398.2.597.2.2.4.2.598.2h1.796c.598%200%20.797-.2.797-.798V17.353c.2-.6.8-.998%201.398-1.596.797-.598%201.795-.798%202.792-.798.997%200%201.795.398%202.393%201.196.6.798.798%201.795.798%203.19v8.378c0%20.2%200%20.4.2.6.2.198.4.198.6.198h1.794c.2%200%20.4%200%20.6-.2.198-.2.198-.398.198-.598v-8.177c-.2-5.386-2.194-7.979-6.183-7.979m20.144%201.995c-.4-.798-.997-1.197-1.596-1.596-.798-.4-1.795-.598-2.992-.598-1.994%200-3.79.398-5.385.996-.398.2-.597.4-.597.998l.4%201.396c.198.598.398.798.796.598a12.823%2012.823%200%200%201%204.388-.798c.997%200%201.595.2%201.994.798.4.598.598%201.596.4%202.793l-.4-.2c-.2%200-.598-.198-1.197-.198-.4.2-.797.2-1.396.2-1.995%200-3.392.398-4.588%201.395-1.197.997-1.596%202.194-1.596%203.79s.4%202.992%201.396%203.99c.998.996%202.194%201.395%203.59%201.395%201.796%200%203.39-.598%204.787-1.994l.398%201.196c.2.4.4.6.6.6h1.195c.2%200%20.4%200%20.6-.2.198-.2.198-.4.198-.6V18.75c0-1.198%200-2.195-.198-2.993-.2-.598-.4-1.396-.798-2.194M91.31%2023.735c-.2.4-.797.998-1.396%201.396-.798.4-1.396.6-2.194.6s-1.396-.2-1.795-.798c-.4-.4-.598-1.197-.598-1.795%200-.798.2-1.396.798-1.995.598-.4%201.396-.797%202.393-.797.598%200%201.197%200%201.795.2.6.198.997.198.997.398v2.792m16.555%202.793l-.598-1.596c-.2-.4-.4-.598-.997-.4a3.834%203.834%200%200%201-2.394.8c-.4%200-.798-.2-.997-.4-.2-.2-.4-.598-.4-1.396V14.96h4.19c.198%200%20.397%200%20.597-.2.2-.2.2-.4.2-.6v-1.594c0-.2%200-.4-.2-.6h-4.788V7.38c0-.2%200-.4-.2-.598-.2-.2-.398-.2-.598-.2h-1.994c-.2%200-.4%200-.6.2-.198.2-.198.398-.198.598v4.587h-1.795c-.4%200-.798.2-.798.798v1.396c0%20.2%200%20.4.2.6.2.2.398.2.598.2h1.795v8.975c0%201.595.2%202.792.798%203.59.598.798%201.595%201.197%202.99%201.197.8%200%201.597-.2%202.395-.4s1.396-.598%201.795-.797c.997-.2%201.197-.598.997-.997z%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%2362666c%22%20fill-rule%3D%22evenodd%22%20d%3D%22M6.94%2010.77C6.543.4.16%200%20.16%200c-.4%209.374%206.78%2010.77%206.78%2010.77z%22%2F%3E%0A%20%20%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A&quot;);"></jdiv>
                        <jdiv class="fallback__PrWQM"></jdiv>
                    </jdiv>
                </jdiv>
                <jdiv class="leafCont__KSxl6">
                    <jdiv class="leaf__zLtET _bottom__nfsIq">
                        <jdiv class="cssLeaf__VxzzL"
                              style="background-image: url(&quot;data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2232%22%20height%3D%2240%22%20viewBox%3D%220%200%2032%2040%22%3E%0A%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%238f0000%22%20d%3D%22M0%200h9.02L32%2033.196V40H0z%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%238f0000%22%20d%3D%22M9%200c3.581.05%2023%205.426%2023%2033.08v.03C18.922%2030.751%209%2019.311%209%205.554V0z%22%20fill-opacity%3D%221%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%235e5f61%22%20d%3D%22M9%200c3.581.05%2023%205.426%2023%2033.08v.03C18.922%2030.751%209%2019.311%209%205.554V0z%22%20fill-opacity%3D%220.7%22%2F%3E%0A%20%20%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A&quot;);"></jdiv>
                    </jdiv>
                </jdiv>
                <jdiv class="copyContainer__hx5m0">
                    <jdiv class="copyright___Nuyu _bottom__H1F_L"
                          style="background: linear-gradient(95deg, rgb(143, 0, 0) 20%, rgb(143, 0, 0) 80%);">
                        <jdiv class="text__UgkF2" style="color: rgb(240, 241, 241);"><a
                                    href="https://www.jivochat.com/i_sa/?utm_source=qfsholdings.io&amp;utm_medium=link&amp;utm_content=label_tooltip&amp;utm_campaign=from_widget"
                                    rel="nofollow noopener noreferrer" target="_blank" class="link__DY_px">Business
                                Messenger by
                                <jdiv class="logoIcon__emt31"
                                      style="background-image: url(&quot;data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22108%22%20height%3D%2236%22%20viewBox%3D%220%200%20108%2036%22%3E%0A%20%20%20%20%3Cg%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%23F0F1F1%22%20fill-rule%3D%22evenodd%22%20d%3D%22M6.342%2011.967H.957c-.2%200-.4%200-.6.2%200%20.2-.198.2-.198.4v1.993c0%20.2%200%20.4.198.6.2.198.4.198.6.198h2.79v14.36c0%201.397-1.196%202.594-2.392%202.594h-.4c-.2%200-.398%200-.598.2-.2.2-.2.398-.2.598v1.994c0%20.2%200%20.4.2.6.2.198.4.198.6.198h.198c3.192%200%205.785-2.792%205.785-5.984V12.566c0-.2%200-.4-.2-.6h-.398m6.98%200H11.33c-.2%200-.2%200-.4.2s-.2.2-.2.4v14.76c0%20.2%200%20.398.2.598.2.2.4.2.598.2h1.795c.2%200%20.4%200%20.598-.2.2-.2.2-.4.2-.598v-14.76c0-.2%200-.4-.198-.6h-.6m17.154%200H28.88c-.598%200-.997.2-.997.4l-4.388%209.973-4.188-9.974c0-.4-.4-.4-.6-.4h-1.993c-.4%200-.598%200-.598.2-.2.2-.2.4%200%20.6l6.78%2015.357c.2.2.4.4.6.4h.2c.198%200%20.597-.2.597-.4l6.782-15.358c.2-.2.2-.4%200-.598-.2-.2-.4-.2-.6-.2m9.176-.4c-2.193.002-3.988.8-5.584%202.594-1.595%201.597-2.393%203.592-2.393%205.985%200%202.393.798%204.388%202.393%205.984%201.596%201.794%203.39%202.592%205.585%202.592s3.99-.798%205.586-2.593c1.596-1.796%202.394-3.79%202.394-5.985%200-2.393-.798-4.388-2.394-5.984-1.596-1.794-3.59-2.591-5.585-2.591m3.193%2012.165c-.798.998-1.995%201.596-3.192%201.596-1.395%200-2.392-.398-3.39-1.395-.797-.998-1.396-2.194-1.396-3.79%200-1.396.4-2.792%201.397-3.59.798-.997%201.995-1.396%203.39-1.396%201.398%200%202.395.398%203.193%201.395.797.997%201.396%202.194%201.396%203.59s-.6%202.593-1.397%203.59m19.147-.598c-.398-.4-.797-.2-.997%200l-.4.4-.597.597c-.2.2-.4.2-.6.4-.198.2-.597.398-.796.398-.4%200-.6.2-.998.2-1.396%200-2.393-.6-3.19-1.596-.8-.998-1.397-2.194-1.397-3.79%200-1.396.4-2.792%201.396-3.79.998-.997%201.996-1.396%203.392-1.396%201.197%200%202.194.6%203.19%201.596.4.4.8.4.998.2l1.197-1.197s0-.4-.4-.8c-1.395-1.794-3.39-2.79-5.584-2.79-2.194-.002-3.99.796-5.584%202.59-1.597%201.597-2.395%203.592-2.395%205.985%200%202.393.798%204.388%202.394%206.183%201.594%201.596%203.39%202.394%205.583%202.394%202.593%200%204.588-1.197%205.984-3.39.2-.4.2-.8-.2-1.198l-.997-.997m11.57-11.569c-1.597%200-2.993.6-4.59%201.796V4.986c0-.2%200-.4-.198-.598-.2-.2-.4-.2-.6-.2H66.38c-.2%200-.398%200-.598.2-.2.2-.2.4-.2.598v22.54c0%20.198%200%20.398.2.597.2.2.4.2.598.2h1.796c.598%200%20.797-.2.797-.798V17.353c.2-.6.8-.998%201.398-1.596.797-.598%201.795-.798%202.792-.798.997%200%201.795.398%202.393%201.196.6.798.798%201.795.798%203.19v8.378c0%20.2%200%20.4.2.6.2.198.4.198.6.198h1.794c.2%200%20.4%200%20.6-.2.198-.2.198-.398.198-.598v-8.177c-.2-5.386-2.194-7.979-6.183-7.979m20.144%201.995c-.4-.798-.997-1.197-1.596-1.596-.798-.4-1.795-.598-2.992-.598-1.994%200-3.79.398-5.385.996-.398.2-.597.4-.597.998l.4%201.396c.198.598.398.798.796.598a12.823%2012.823%200%200%201%204.388-.798c.997%200%201.595.2%201.994.798.4.598.598%201.596.4%202.793l-.4-.2c-.2%200-.598-.198-1.197-.198-.4.2-.797.2-1.396.2-1.995%200-3.392.398-4.588%201.395-1.197.997-1.596%202.194-1.596%203.79s.4%202.992%201.396%203.99c.998.996%202.194%201.395%203.59%201.395%201.796%200%203.39-.598%204.787-1.994l.398%201.196c.2.4.4.6.6.6h1.195c.2%200%20.4%200%20.6-.2.198-.2.198-.4.198-.6V18.75c0-1.198%200-2.195-.198-2.993-.2-.598-.4-1.396-.798-2.194M91.31%2023.735c-.2.4-.797.998-1.396%201.396-.798.4-1.396.6-2.194.6s-1.396-.2-1.795-.798c-.4-.4-.598-1.197-.598-1.795%200-.798.2-1.396.798-1.995.598-.4%201.396-.797%202.393-.797.598%200%201.197%200%201.795.2.6.198.997.198.997.398v2.792m16.555%202.793l-.598-1.596c-.2-.4-.4-.598-.997-.4a3.834%203.834%200%200%201-2.394.8c-.4%200-.798-.2-.997-.4-.2-.2-.4-.598-.4-1.396V14.96h4.19c.198%200%20.397%200%20.597-.2.2-.2.2-.4.2-.6v-1.594c0-.2%200-.4-.2-.6h-4.788V7.38c0-.2%200-.4-.2-.598-.2-.2-.398-.2-.598-.2h-1.994c-.2%200-.4%200-.6.2-.198.2-.198.398-.198.598v4.587h-1.795c-.4%200-.798.2-.798.798v1.396c0%20.2%200%20.4.2.6.2.2.398.2.598.2h1.795v8.975c0%201.595.2%202.792.798%203.59.598.798%201.595%201.197%202.99%201.197.8%200%201.597-.2%202.395-.4s1.396-.598%201.795-.797c.997-.2%201.197-.598.997-.997z%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20fill%3D%22%2362666c%22%20fill-rule%3D%22evenodd%22%20d%3D%22M6.94%2010.77C6.543.4.16%200%20.16%200c-.4%209.374%206.78%2010.77%206.78%2010.77z%22%2F%3E%0A%20%20%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A&quot;);"></jdiv>
                            </a></jdiv>
                        <jdiv class="corner___yWm8" style="border-top-color: rgb(143, 0, 0);"></jdiv>
                    </jdiv>
                </jdiv>
            </jdiv>
        </jdiv>
        <jdiv id="jivo-player" class="player__C5fTe">
            <audio preload="auto" id="jivo-sound-agent_message">
                <source src="https://code.jivosite.com/sounds/agent_message.mp3" type="audio/mpeg">
                <source src="https://code.jivosite.com/sounds/agent_message.ogg" type="audio/ogg; codecs=vorbis">
                <source src="https://code.jivosite.com/sounds/agent_message.wav" type="audio/wav">
            </audio>
            <audio preload="auto" id="jivo-sound-notification">
                <source src="https://code.jivosite.com/sounds/notification.mp3" type="audio/mpeg">
                <source src="https://code.jivosite.com/sounds/notification.ogg" type="audio/ogg; codecs=vorbis">
                <source src="https://code.jivosite.com/sounds/notification.wav" type="audio/wav">
            </audio>
            <audio preload="auto" id="jivo-sound-outgoing_message">
                <source src="https://code.jivosite.com/sounds/outgoing_message.mp3" type="audio/mpeg">
                <source src="https://code.jivosite.com/sounds/outgoing_message.ogg" type="audio/ogg; codecs=vorbis">
                <source src="https://code.jivosite.com/sounds/outgoing_message.wav" type="audio/wav">
            </audio>
        </jdiv>
        <jdiv id="jcont" translate="no" class="notranslate"
              style="animation-duration: 300ms; animation-timing-function: cubic-bezier(0.39, 0.24, 0.21, 0.99); animation-delay: 0s; animation-iteration-count: 1; animation-direction: normal; animation-fill-mode: both; animation-play-state: running; animation-name: WidgetContainer_CLOSE_WIDGET__OCh4p; --jright: 30px; --jheight: 475px; display: block; position: fixed; --jlabelwidth: 300px; --jlabelright: 40px;">
            <jdiv class="wrap__heNaD" dir="ltr" id="jivo_action">
                <jdiv class="closeButton__mC5IS" id="jivo_close_button">
                    <jdiv class="closeIcon__nBiI4"
                          style="background-image: url(&quot;data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2228%22%20height%3D%2228%22%20viewBox%3D%220%200%2028%2028%22%3E%0A%20%20%20%20%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%20transform%3D%22translate(2%202)%22%3E%0A%20%20%20%20%20%20%20%20%3Ccircle%20cx%3D%2212%22%20cy%3D%2212%22%20r%3D%2212%22%20fill%3D%22%23FFF%22%20opacity%3D%221%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Ccircle%20cx%3D%2212%22%20cy%3D%2212%22%20r%3D%2212.75%22%20stroke%3D%22%23222D38%22%20stroke-width%3D%221.5%22%20opacity%3D%221%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cg%20fill%3D%22%23222D38%22%20opacity%3D%221%22%20transform%3D%22translate(6%206)%22%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Crect%20width%3D%221.611%22%20height%3D%2213.9%22%20x%3D%225.435%22%20y%3D%22-.941%22%20rx%3D%22.806%22%20transform%3D%22rotate(45%206.24%206.01)%22%2F%3E%0A%20%20%20%20%20%20%20%20%20%20%20%20%3Crect%20width%3D%221.611%22%20height%3D%2213.9%22%20x%3D%225.435%22%20y%3D%22-.941%22%20rx%3D%22.806%22%20transform%3D%22scale(-1%201)%20rotate(45%200%20-9.058)%22%2F%3E%0A%20%20%20%20%20%20%20%20%3C%2Fg%3E%0A%20%20%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A&quot;);"></jdiv>
                </jdiv>
            </jdiv>
        </jdiv>
        <jdiv class="jv-pseudo-height"></jdiv>
        <jdiv class="jv-mouse-track"></jdiv>
    </jdiv>
</jdiv>
</body>
</html>