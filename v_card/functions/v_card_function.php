<?php
include_once (__DIR__ . '/main_function.php');

$user_id = 2;

// Fetch virtual cards for the given user_id
$sql_cards = "SELECT * FROM virtual_cards WHERE user_id = $user_id";
$result_cards = $conn->query($sql_cards);

function init_v_card()
{
    if ($result_cards->num_rows > 0) {

        $card_id = $row["card_id"];
        $user_id = $row["user_id"];
        $card_number = $row["card_number"];
        $cardholder_name = $row["cardholder_name"];
        $expiry_date = $row["expiry_date"];
        $cvv = $row["cvv"];
        $balance = $row["balance"];
        $status = $row["status"];
        $created_at = $row["created_at"];


        // Now, fetch user details from hm2_users where id matches $row["user_id"]
        $sql_user = "SELECT * FROM hm2_users WHERE id = " . $row["user_id"];
        $result_user = $conn->query($sql_user);

        if ($result_user->num_rows > 0) {

//        $user_id = $user_row["id"];
            $name = $user_row["name"];
            $username = $user_row["username"];
            $email = $user_row["email"];
            $status = $user_row["status"];
            $date_register = $user_row["date_register"];
            $last_access_time = $user_row["last_access_time"];
include_once (__DIR__ . '/../../v_card/card_template.php');

        } else {
            echo "User not found.";
        }
    } else {
        echo "You don't have any virtual cards.";
    }

}
