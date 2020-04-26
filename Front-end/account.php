<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

    require_once "config.php";
    $id = $_SESSION['id'];
    //initialization variable
    $name = $image = $prefername = $dateOfBirth =$email = $phoneNumber = $gender = "";
    $name_err = $phoneNumber_err = $gender_err = $dateOfBirth_err = "";
    //select from userdetail table
    $sql = "SELECT * FROM userdetail WHERE id = ".$id;
    $query = mysqli_query($link, $sql);
    //check if user profile exist
    if(mysqli_num_rows($query) == 0)
    {

    } 
    else
    {   
        $row = mysqli_fetch_assoc($query);
        $name =  $row['Name'];
        if(isset($row['preferName']))
        {
            $prefername = $row['preferName'];
        }
        $dateOfBirth = $row['DateOfBirth'];
        $gender = $row['gender'];
        $image = $row['imageLink'];
    }
    //select from users table
    $sql = "SELECT * FROM users WHERE id = ".$id;
    $query = mysqli_query($link, $sql);
    $row = mysqli_fetch_assoc($query);
    $email = $row['email'];
    $phoneNumber = $row['phonenumber'];
    //change user profile

    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        //name
        if(empty(trim($_POST["name"])))
        {
            $name_err = "Xin nhập tên";
        }
        else
        {
            $name = trim($_POST["name"]);
        }
        //prefername
        $prefername = trim($_POST["prefername"]);

        $email = trim($_POST["email"]);

        if(empty(trim($_POST["phoneNumber"])))
        {
            $phoneNumber_err = "Xin nhập số điện thoại";
        }
        else
        {
            $phoneNumber = trim($_POST["phoneNumber"]);
        }

        if(empty(trim($_POST["dateOfBirth"])))
        {
            $dateOfBirth_err = "Nhập ngày sinh";
        }
        else
        {
            $dateOfBirth = trim($_POST["dateOfBirth"]);
        }

        if(empty(trim($_POST["gender"])))
        {
            $gender_err = "Chọn giới tính";
        }
        else
        {
            $gender = trim($_POST["gender"]);
        }

        //upload image
        if(empty($name_err))
        {
            $target_dir = "uploads/".$_SESSION['username'];
            $target_file = $target_dir.basename($_FILES["image"]["name"]);
            $uploadOk = 1;
            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            // Check if image file is a actual image or fake image
            if(isset($_POST["submit"])) {
                $check = getimagesize($_FILES["image"]["tmp_name"]);
                if($check !== false) {
                    $uploadOk = 1;
                } else {
                    $uploadOk = 0;
                }
            }
            if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif" ) {
                $uploadOk = 0;
            }
            if ($uploadOk != 0) 
            {
                if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                    $image = "uploads/".$_SESSION['username'].$_FILES["image"]["name"];
                }
            }
        }
        echo $uploadOK;
        echo $name_err;
        //check before insert
        if(empty($name_err) && empty($phoneNumber_err) && empty($dateOfBirth_err) && empty($gender_err))
        {
            $sql = "SELECT * FROM userdetail WHERE id = ".$id;

            $query = mysqli_query($link, $sql);
            if(mysqli_num_rows($query) > 0)
            {
                $sql = "UPDATE userdetail SET Name = ?,  preferName = ?,  DateOfBirth = ?,  gender = ?, imageLink = ? WHERE id = ".$id;
                if($stmt = mysqli_prepare($link, $sql)){
                    // Bind variables to the prepared statement as parameters
                    mysqli_stmt_bind_param($stmt, "sssss", $param_name, $param_prefername, $param_DateOfBirth, $param_gender, $param_imageLink);
                    
                    // Set parameters
                    $param_name = $name;
                    $param_prefername = $prefername; 
                    $param_DateOfBirth = $dateOfBirth;
                    $param_gender = $gender;
                    $param_imageLink = $image;
                    // Attempt to execute the prepared statement
                    if(mysqli_stmt_execute($stmt)){

                    } else{
                        echo "Something went wrong. Please try again later.";
                    }

                    // Close statement
                    mysqli_stmt_close($stmt);
                }
            }
            else
            {
                $sql = "INSERT INTO userdetail (ID, Name, prefername, DateOfBirth, gender, imageLink) VALUES (?, ?, ?, ?, ?, ?)";
                if($stmt = mysqli_prepare($link, $sql)){
                    // Bind variables to the prepared statement as parameters
                    mysqli_stmt_bind_param($stmt, "isssss",$param_id, $param_name, $param_prefername, $param_DateOfBirth, $param_gender, $param_imageLink);
                    
                    // Set parameters
                    $param_id = $id;
                    $param_name = $name;
                    $param_prefername = $prefername; 
                    $param_DateOfBirth = $dateOfBirth;
                    $param_gender = $gender;
                    $param_imageLink = $image;
                    // Attempt to execute the prepared statement
                    if(mysqli_stmt_execute($stmt)){

                    } else{
                        echo "Something went wrong. Please try again later.";
                    }

                    // Close statement
                    mysqli_stmt_close($stmt);
                }
            }
            $sql = "UPDATE users SET email = ?,  phonenumber = ? WHERE id =".$id;
            if($stmt = mysqli_prepare($link, $sql)){
                // Bind variables to the prepared statement as parameters
                mysqli_stmt_bind_param($stmt, "ss", $param_email, $param_phonenumber);
                    
                // Set parameters
                $param_email = $email;
                $param_phonenumber = $phoneNumber;

                // Attempt to execute the prepared statement
                if(mysqli_stmt_execute($stmt)){
                    header("location: account.php");
                } else{
                    echo "Something went wrong. Please try again later.";
                }

                // Close statement
                mysqli_stmt_close($stmt);
            }
        }
        mysqli_close($link);
    }
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Petty</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">  
    <link rel="stylesheet" href="./asset/css/base.css">
    <link rel="stylesheet" href="./asset/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="../Front-end/asset/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../Front-end/asset/css/owl.theme.default.min.css">
</head>
<body>
    <!--Header-->
    <div class="container-fluid">
        <div class="container" id="petty-header" style="width: 100%; height: 100%;">
            <div class="logo"></div>
            <form class="search" action="search.php" method="GET">
                <input class="txtSearch" type="text" placeholder="Tìm kiếm">
                <button type="submit" id="btnSearch" onclick="window.location.href = 'search.php';"><i id="search-icon"></i></button>
            </form>
            <span><i class="fas fa-bell" style="color: white; position: absolute; right: 334px; font-size: 20px; top: 19px;"></i></span>
            <div class="user">
                <span style="color: white; margin-right: 10px;">ecchi123</span>
                <img class="rounded-circle" src="https://static.wikia.nocookie.net/a3dddab1-5138-4786-ad66-03920667dc3a" style="width: 45px; height: auto; border: 1px solid #ef5030;">
                <i class="fas fa-caret-down"></i>
            </div>
            <div class="cart">
                <i></i>
                <span>Giỏ hàng</span>
            </div>
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

    <!--User Page-->
    <div class="userpage-content">
        <div class="userpage-sidebar">
            <div class="userpage-brief">
                <div class="user-avatar"><i class="fa fa-user"></i></div>
                <div class="userpage-brief-right"><?php echo $name?></div>
            </div>
            <div class="userpage-sidebar-menu">
                <div class="sidebar-item" id="account"><i class="fa fa-user-o"></i>Tài khoản của tôi</div>
                <div class="sidebar-item" id="order-history"><i class="fa fa-shopping-bag"></i>Lịch sử mua hàng</div>
                <div class="sidebar-item" id="wishlist"><i class="fa fa-heart"></i>Yêu thích</div>
                <div class="sidebar-item" id="comment"><i class="fa fa-pencil-square-o"></i>Nhận xét</div>
                <div class="sidebar-item" id="order-tracking"><i class="fa fa-truck"></i>Theo dõi đơn hàng</div>
                <div class="sidebar-item" id="news"><i class="fa fa-bell"></i>Thông báo của tôi</div>
                <div class="sidebar-item" id="coupon"><i class="fa fa-bolt"></i></i>Mã giảm giá</div>
            </div>
        </div>
        <div class="user-information">
            <div class="information-header">Hồ sơ của tôi</div>
            <form class="fill-information" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" enctype="multipart/form-data">
                <div class="form">
                    <label for="prefername" class="not-radio">Tên hiển thị</label><br>
                    <input type="text" name="prefername" class="not-radio" value="<?php  
                        echo $prefername;
                    ?>"><br>
                    <label for="name" class="not-radio">Tên</label><br>
                    <input type="text" name="name" class="not-radio" value="<?php
                        echo $name;
                    ?>"><span><?php 
                        echo $name_err;
                    ?></span><br>
                    <label for="email" class="not-radio">Email</label><br>
                    <input type="email" name="email" class="not-radio" value="<?php
                        echo $email;
                     ?>"><br>
                    <label for="phoneNumber" class="not-radio">Số điện thoại</label><br>
                    <input type="tel" name="phoneNumber" class="not-radio" value="<?php
                        echo $phoneNumber;
                     ?>"><span><?php 
                        echo $phoneNumber_err;
                    ?></span><br>
                    <label for="dateOfBirth" class="not-radio">Ngày sinh</label><br>
                    <input type="date" name="dateOfBirth" class="not-radio" value="<?php
                        echo $dateOfBirth;
                     ?>"><span><?php 
                        echo $dateOfBirth_err;
                    ?></span><br>
                    <input type="radio" name="gender" value="nữ" <?php
                        echo ($gender == 'nữ')? 'checked' : "";
                    ?>>
                    <label for="gender">Nữ</label>
                    <input type="radio" name="gender" value="nam" <?php
                        echo ($gender == 'nam')? 'checked' : "";
                    ?>>
                    <label for="gender">Nam</label>
                    <input type="radio" name="gender" value="khác" <?php
                        echo ($gender == 'khác')? 'checked' : "";
                    ?>>
                    <label for="gender">Khác</label><br>
                    <span><?php 
                        echo $gender_err;
                    ?></span><br>
                    <button type="submit">Lưu</button>
                </div>
                <div class="upload-avatar">
                    <img class="fa fa-user-circle-o" src=<?php echo $image?>>
                    <input type="file" name="image" value="Chọn ảnh">
                </div>
            </form>
        </div>
    </div>

    <!--Footer-->
    <div class="footer">
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
    </div>
    <script src="main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="Front-end/JS/test.js"></script>
</body>
</html>