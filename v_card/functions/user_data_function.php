<?php

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


} else {
    echo "User not found.";
}