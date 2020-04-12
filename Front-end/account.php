<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Petty</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./asset/css/base.css">
    <link rel="stylesheet" href="./asset/css/main.css">
</head>
<body>
    <!--Header-->
    <div id="petty-header">
        <div class="logo"></div>
        <form class="search" action="search.php" method="GET">
            <input class="txtSearch" name="key" type="text" placeholder="Tìm kiếm">
            <button id="btnSearch" type="submit" formmethod="get" onclick="window.location.href='search.php';"><i id="search-icon"></i></button>
        </form>
        <div class="cart">
            <i></i>
            <span>Giỏ hàng</span>
        </div>
        <div class="user">
            <input type="button" name="login" value="Tài khoản" onclick="window.location.href='login.php';">
        </div>
    </div>
    <!--Menu-->
    <div class="catalog">
        <div class="item-catalog">Trang chủ</div>
        <div class="item-catalog">Giới thiệu</div>
        <div class="item-catalog">Dịch vụ</div>
        <div class="item-catalog">Liên hệ</div>
        <div class="item-catalog">Blog</div>
    </div>

    <div>
        <h1>Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welcome to our site.</h1>
    </div>
    <p>
        <a href="reset-password.php">Reset Your Password</a>
        <a href="logout.php">Sign Out of Your Account</a>
    </p>

    <!--Footer-->
    <footer>
        <div id="petty-logo"></div>
        <div class="information">
            <p><i id="mobile"></i>000-000-000</p>
            <p><i id="email"></i>Email: nnchi@gmail.com</p>
            <p><i id="address"></i>144, Xuan Thuy, Cau Giay, Ha Noi</p>
        </div>
        <div class="media">
            <p class="media-text">Follow Us</p>
            <i id="facebook"></i>
        </div>
    </footer>
    <script src="main.js"></script>
</body>
</html>