<?php
include('db_connect.php');
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    
    if ($email == 'ahmad@email.com' || $email == 'sara@email.com') {
        $_SESSION['user'] = $email;
        $_SESSION['role'] = 'Investor';
        header('Location: investor_dashboard.php');
    } else {
        $_SESSION['user'] = 'Admin';
        $_SESSION['role'] = 'Administrator';
        header('Location: admin_dashboard.php');
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tamra Portal - Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container" style="max-width: 400px; margin-top: 100px;">
        <div class="card">
            <h2>System Login</h2>
            <form method="POST" action="">
                <label>Corporate/Client Email:</label>
                <input type="email" name="email" required style="width:100%; padding:10px; margin:10px 0; background:#333; color:#fff; border:1px solid #55px; border-radius:4px;">
                <button type="submit" class="btn" style="width: 100%; margin-top: 10px;">Access Portfolio</button>
            </form>
        </div>
    </div>
</body>
</html>
