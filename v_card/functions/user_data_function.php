<?php

// Now, fetch user details from hm2_users where id matches $row["user_id"]
$stmt = $conn->prepare("SELECT * FROM hm2_users WHERE username = ?");
$stmt->bind_param("s", $_SESSION['username']);
$stmt->execute();
$result_user = $stmt->get_result();

if ($result_user->num_rows > 0) {
    // Fetch the user data
    $user_row = $result_user->fetch_assoc();

    // Assign variables from the fetched data
    $user_id = $user_row["id"];
    $name = $user_row["name"];
    $username = $user_row["username"];
    $email = $user_row["email"];
    $status = $user_row["status"];
    $date_register = $user_row["date_register"];
    $last_access_time = $user_row["last_access_time"];
} else {
    echo "User not found.";
}