<?php
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$username = $password = $confirm_password = $email = $phone_number = "";
$username_err = $password_err = $confirm_password_err = $phone_number_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate username
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter a username.";
    } else{
        // Prepare a select statement
        $sql = "SELECT id FROM users WHERE username = ?";
        
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);
            
            // Set parameters
            $param_username = trim($_POST["username"]);
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                /* store result */
                mysqli_stmt_store_result($stmt);
                
                if(mysqli_stmt_num_rows($stmt) == 1){
                    $username_err = "This username is already taken.";
                } else{
                    $username = trim($_POST["username"]);
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    
    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter a password.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Password must have atleast 6 characters.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Please confirm password.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Password did not match.";
        }
    }

    $email = trim($_POST["email"]);


    if(empty(trim($_POST["phone_number"]))){
        $phone_number_err = "Please enter phone number.";
    } else {
        $phone_number = trim($_POST["phone_number"]);
    }
    


    
    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err) && empty($phone_number_err)){
        
        // Prepare an insert statement
        $sql = "INSERT INTO users (username, password, email, phonenumber) VALUES (?, ?, ?, ?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssss", $param_username, $param_password, $param_email, $param_phone_number);
            
            // Set parameters
            $param_username = $username;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            $param_email = $email;
            $param_phone_number = $phone_number;
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Redirect to login page
                header("location: login.php");
            } else{
                echo "Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    
    // Close connection
    mysqli_close($link);
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
        <div class="search">
            <input class="txtSearch" name="key" type="text" placeholder="Tìm kiếm">
            <button id="btnSearch" type="submit" formmethod="get" onclick="window.location.href='search.php';"><i id="search-icon"></i></button>
        </div>
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

    <h2>Sign Up</h2>
    <p>Please fill this form to create an account.</p>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <div>
            <label>Username</label>
            <input type="text" name="username" value="<?php echo $username; ?>">
            <span><?php echo $username_err; ?></span>
        </div>    
        <div>
            <label>Password</label>
            <input type="password" name="password" value="<?php echo $password; ?>">
            <span><?php echo $password_err; ?></span>
        </div>
        <div>
            <label>Confirm Password</label>
            <input type="password" name="confirm_password" value="<?php echo $confirm_password; ?>">
            <span><?php echo $confirm_password_err; ?></span>
        </div>
        <div>
            <label>Email</label>
            <input type="text" name="email" value="<?php echo $email;?>">
        </div>
        <div>
            <label>Phone number</label>
            <input type="text" name="phone_number" value="<?php echo $phone_number;?>">
        </div>
        <div>
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </div>
        <p>Already have an account? <a href="login.php">Login here</a>.</p>
    </form>

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