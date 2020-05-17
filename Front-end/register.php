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
        $sql = "INSERT INTO users (username, password, email, phonenumber) VALUES (?, PASSWORD(?), ?, ?)";
         
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "ssss", $param_username, $param_password, $param_email, $param_phone_number);
            
            // Set parameters
            $param_username = $username;
            $param_password = $password;
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
<html lang="vi">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Petty</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">  
    <link rel="stylesheet" href="./asset/css/base.css">
    <link rel="stylesheet" href="./asset/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="./Front-end/asset/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./Front-end/asset/css/owl.theme.default.min.css">
</head>
<body>
    <!--Header-->
    <?php
        include "header.php";
    ?>
    <!--Menu-->
    <?php
        include "menu.php";
    ?>
    <!--Content-->
    <div class="content container" style="min-height: 300px; display: flex; padding-top: 15px; padding-bottom: 15px;">
        <div class="mr-4">
            <img src="../Front-end/asset/resource/img/cat2.png">
        </div>
        <div>
            <div class="shadow" style="width: 500px;padding: 20px;">
                <h2 style="text-align: center; font-family: 'My Font Regular'; color: #ef5030;"><i class="fas fa-paw"></i>Đăng ký<i class="fas fa-paw"></i></h2>
                <p style="text-align: center;">Please fill this form to create an account.</p>
                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="form-group petty-form">
                    <div class="item-reg">
                        <label>Username(*)</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user-alt"></i></span>
                              </div>
                            <input class="form-control" type="text" name="username" placeholder="Enter your username..."  value="<?php echo $username; ?>" required>
                        </div>
                        
                        <span><?php echo $username_err?></span>
                    </div>    
                    <div class="item-reg">
                        <label>Password(*)</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input class="form-control" type="password" name="password" placeholder="Enter your password..."  value="<?php echo $password; ?>" required>
                        </div>
                        <span><?php echo $password_err?></span>
                    </div>
                    <div class="item-reg">
                        <label>Confirm Password(*)</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input  class="form-control" type="password" name="confirm_password" placeholder="Confirm your password..."  value="<?php echo $confirm_password; ?>" required>
                        </div>
                        <span><?php echo $confirm_password_err?></span>
                    </div>
                    <div class="item-reg">
                        <label>Email</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            </div>
                            <input class="form-control" type="email" name="email" placeholder="Enter your email..."  value="<?php echo $email;?>"> 
                        </div>
                    </div>
                    <div class="item-reg">
                        <label>Phone number</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            </div>
                            <input class="form-control" type="tel" name="phone_number" placeholder="Enter your phone number..."  value="<?php echo $phone_number;?>">
                        </div>
                    </div>
                    <div class="item-reg" style="margin-top: 30px;">
                        <input class="submit" type="submit" value="Submit">
                        <input class="reset" type="reset" value="Reset">
                    </div>
                    <p>Already have an account? <a href="login.php">Login here</a>.</p>
                </form>
            </div>
        </div>
    </div>

    <!--Footer-->
    <?php
        include "footer.php";
    ?>
</body>
</html>