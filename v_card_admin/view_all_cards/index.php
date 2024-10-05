<!-- ============================================================== -->
<!-- Start Page Content here -->
<!-- ============================================================== -->

<div class="content-page">
    <div class="content">

        <!-- Start Content-->
        <div class="container-xxl">

            <div class="py-3 d-flex align-items-sm-center flex-sm-row flex-column">
                <div class="flex-grow-1">
                    <h4 class="fs-18 fw-semibold m-0">Dashboard</h4>
                </div>
            </div>

            <div class="row">
                <?php
                if ($result->num_rows > 0) {
                    // Loop through the results and populate the HTML template
                    while ($row = $result->fetch_assoc()) {
                        $cardholder_name = $row["cardholder_name"];
                        $card_user_id = $row["user_id"];
                        $card_number = $row["card_number"];
                        $formatted_card_number = chunk_split($card_number, 4, ' ');
                        $expiry_month = $row["expiry_month"];
                        $expiry_year = $row["expiry_year"];
                        $cvv = $row["cvv"];
                        $balance = $row["balance"];
                        $card_status = $row["status"];

                        if ($card_status == 'inactive') {
                            $card_status = '<div class="text-warning">Pending Approval</div>';
                        } elseif ($card_status == 'active') {
                            $card_status = '<div class="text-success">Active</div>';
                        } elseif ($card_status == 'blocked') {
                            $card_status = '<div class="text-danger">Blocked</div>';
                        } elseif ($card_status == 'not_applied') {
                            $card_status = '<div class="text-muted">Not Applied</div>';
                        }

                        // Start output buffering to include the file
                        ob_start();
                        include(__DIR__ . "/../partials/card_button_options.php");
                        $card_button_options = ob_get_clean(); // Get the output and clear the buffer

                        // Output the HTML template with dynamic data
                        echo '
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex align-items-center justify-content-between">
                                <h5 class="card-title mb-0">User Card</h5>
                                <div class="dropdown mx-0">
                                    <a href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="mdi mdi-dots-horizontal text-muted fs-20"></i>
                                    </a>
                                    '. $card_button_options .'
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="rounded-4 overflow-hidden debit-card p-4">
                                <div class="d-flex">
                                    <div class="flex-grow-1 me-3">
                                        <p class="text-white fs-14 opacity-50 mb-1">Name</p>
                                        <h5 class="text-white">' . $cardholder_name . '</h5>
                                    </div>
                                    <div class="flex-shrink-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                            <path fill="white" d="M15.273 18.728A6.728 6.728 0 1 1 22 11.999V12a6.735 6.735 0 0 1-6.727 6.728" opacity="0.5"/><path fill="white" d="M8.727 18.728A6.728 6.728 0 1 1 15.455 12a6.735 6.735 0 0 1-6.728 6.728"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-content-center">
                                    <h6 class="text-white my-3">' . $formatted_card_number . '</h6>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
                                        <path fill="#ff9800" d="M5 35V13c0-2.2 1.8-4 4-4h30c2.2 0 4 1.8 4 4v22c0 2.2-1.8 4-4 4H9c-2.2 0-4-1.8-4-4"/><path fill="#ffd54f" d="M43 21v-2H31c-1.1 0-2-.9-2-2s.9-2 2-2h1v-2h-1c-2.2 0-4 1.8-4 4s1.8 4 4 4h3v6h-3c-2.8 0-5 2.2-5 5s2.2 5 5 5h2v-2h-2c-1.7 0-3-1.3-3-3s1.3-3 3-3h12v-2h-7v-6zm-26 6h-3v-6h3c2.2 0 4-1.8 4-4s-1.8-4-4-4h-3v2h3c1.1 0 2 .9 2 2s-.9 2-2 2H5v2h7v6H5v2h12c1.7 0 3 1.3 3 3s-1.3 3-3 3h-2v2h2c2.8 0 5-2.2 5-5s-2.2-5-5-5"/>
                                    </svg>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="col-auto">
                                        <p class="text-white fs-13 opacity-50 mb-1">VALID FROM</p>
                                        <h6 class="text-white mb-0">' . $expiry_month . '/' . $expiry_year . '</h6>
                                    </div>
                                    <div class="col-auto">
                                        <p class="text-white fs-13 opacity-50 mb-1">CVV</p>
                                        <h6 class="text-white mb-0">' . $cvv . '</h6>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center d-flex justify-content-between mt-3 align-items-center">
                                <p class="text-muted mb-0">' . $card_status . '</p>
                                <h6 class="mb-1 fs-22" style="font-size: 14px !important;">$' . $balance . '</h6>
                            </div>
                        </div> <!-- end card body -->
                    </div> <!-- end card -->
                </div>';
                    }
                } else {
                    echo "No cards found.";
                }

                $conn->close(); ?>

            </div> <!-- end row -->