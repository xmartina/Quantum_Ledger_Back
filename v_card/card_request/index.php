<?php
$page_name = 'My Card';
include_once (__DIR__ . '/../include/config.php');
include_once (__DIR__ . '/../header.php');
?>

<div class="payment-title">
    <h1>Payment Information</h1>
</div>
<div class="container preload">
    <div class="creditcard">
        <div class="front">
            <div id="ccsingle"></div>
            <svg version="1.1" id="cardfront" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                <g id="Front">
                    <g id="CardBackground">
                        <g id="Page-1_1_">
                            <g id="amex_1_">
                                <path id="Rectangle-1_1_" class="lightcolor grey" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                            C0,17.9,17.9,0,40,0z" />
                            </g>
                        </g>
                        <path class="darkcolor greydark" d="M750,431V193.2c-217.6-57.5-556.4-13.5-750,24.9V431c0,22.1,17.9,40,40,40h670C732.1,471,750,453.1,750,431z" />
                    </g>
                    <text transform="matrix(1 0 0 1 60.106 295.0121)" id="svgnumber" class="st2 st3 st4">0123 4567 8910 1112</text>
                    <text transform="matrix(1 0 0 1 54.1064 428.1723)" id="svgname" class="st2 st5 st6">JOHN DOE</text>
                    <text transform="matrix(1 0 0 1 54.1074 389.8793)" class="st7 st5 st8">cardholder name</text>
                    <text transform="matrix(1 0 0 1 479.7754 388.8793)" class="st7 st5 st8">expiration</text>
                    <text transform="matrix(1 0 0 1 65.1054 241.5)" class="st7 st5 st8">card number</text>
                    <g>
                        <text transform="matrix(1 0 0 1 574.4219 433.8095)" id="svgexpire" class="st2 st5 st9">01/23</text>
                        <text transform="matrix(1 0 0 1 479.3848 417.0097)" class="st2 st10 st11">VALID</text>
                        <text transform="matrix(1 0 0 1 479.3848 435.6762)" class="st2 st10 st11">THRU</text>
                        <polygon class="st2" points="554.5,421 540.4,414.2 540.4,427.9 		" />
                    </g>
                    <g id="cchip">
                        <g>
                            <path class="st2" d="M168.1,143.6H82.9c-10.2,0-18.5-8.3-18.5-18.5V74.9c0-10.2,8.3-18.5,18.5-18.5h85.3
                        c10.2,0,18.5,8.3,18.5,18.5v50.2C186.6,135.3,178.3,143.6,168.1,143.6z" />
                        </g>
                        <g>
                            <g>
                                <rect x="82" y="70" class="st12" width="1.5" height="60" />
                            </g>
                            <g>
                                <rect x="167.4" y="70" class="st12" width="1.5" height="60" />
                            </g>
                            <g>
                                <path class="st12" d="M125.5,130.8c-10.2,0-18.5-8.3-18.5-18.5c0-4.6,1.7-8.9,4.7-12.3c-3-3.4-4.7-7.7-4.7-12.3
                            c0-10.2,8.3-18.5,18.5-18.5s18.5,8.3,18.5,18.5c0,4.6-1.7,8.9-4.7,12.3c3,3.4,4.7,7.7,4.7,12.3
                            C143.9,122.5,135.7,130.8,125.5,130.8z M125.5,70.8c-9.3,0-16.9,7.6-16.9,16.9c0,4.4,1.7,8.6,4.8,11.8l0.5,0.5l-0.5,0.5
                            c-3.1,3.2-4.8,7.4-4.8,11.8c0,9.3,7.6,16.9,16.9,16.9s16.9-7.6,16.9-16.9c0-4.4-1.7-8.6-4.8-11.8l-0.5-0.5l0.5-0.5
                            c3.1-3.2,4.8-7.4,4.8-11.8C142.4,78.4,134.8,70.8,125.5,70.8z" />
                            </g>
                            <g>
                                <rect x="82.8" y="82.1" class="st12" width="25.8" height="1.5" />
                            </g>
                            <g>
                                <rect x="82.8" y="117.9" class="st12" width="26.1" height="1.5" />
                            </g>
                            <g>
                                <rect x="142.4" y="82.1" class="st12" width="25.8" height="1.5" />
                            </g>
                            <g>
                                <rect x="142" y="117.9" class="st12" width="26.2" height="1.5" />
                            </g>
                        </g>
                    </g>
                </g>
                <g id="Back">
                </g>
            </svg>
        </div>
        <div class="back">
            <svg version="1.1" id="cardback" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                <g id="Front">
                    <line class="st0" x1="35.3" y1="10.4" x2="36.7" y2="11" />
                </g>
                <g id="Back">
                    <g id="Page-1_2_">
                        <g id="amex_2_">
                            <path id="Rectangle-1_2_" class="darkcolor greydark" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                        C0,17.9,17.9,0,40,0z" />
                        </g>
                    </g>
                    <rect y="61.6" class="st2" width="750" height="78" />
                    <g>
                        <path class="st3" d="M701.1,249.1H48.9c-3.3,0-6-2.7-6-6v-52.5c0-3.3,2.7-6,6-6h652.1c3.3,0,6,2.7,6,6v52.5
                    C707.1,246.4,704.4,249.1,701.1,249.1z" />
                    </g>
                    <g>
                        <text transform="matrix(1 0 0 1 90.4268 101.4984)" class="st2 st4 st5">signature</text>
                        <text transform="matrix(1 0 0 1 477.1069 103.4978)" class="st2 st4 st5">CVV</text>
                        <text transform="matrix(1 0 0 1 111.4233 137.4188)" class="st2 st4 st5">REQUIRED</text>
                        <text transform="matrix(1 0 0 1 531.6652 138.2372)" class="st2 st4 st5">XXX</text>
                    </g>
                </g>
            </svg>
        </div>
    </div>
    <div class="payment-form">
        <div class="form-group">
            <label for="card-number">Card Number:</label>
            <input type="text" id="card-number" maxlength="19" />
        </div>
        <div class="form-group">
            <label for="cardholder-name">Cardholder Name:</label>
            <input type="text" id="cardholder-name" />
        </div>
        <div class="form-group">
            <label for="expiration-date">Expiration Date:</label>
            <input type="text" id="expiration-date" placeholder="MM/YY" />
        </div>
        <div class="form-group">
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" maxlength="3" />
        </div>
        <button id="submit-button">Submit</button>
    </div>
</div>




<?php include_once (__DIR__ . '/../footer.php'); ?>


