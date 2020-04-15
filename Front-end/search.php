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
    <?php
        // Include config file
        require_once "config.php";

        if (isset($_GET['key']) && $_GET['key'] != ''){
                        
            // save the keywords from the url
            $key = trim($_GET['key']);

            // create a base query and words string
            $query_string = "SELECT * FROM product WHERE ";
            $display_words = "";

            // seperate each of the keyword
            $keywords = explode(' ', $key); 
            foreach($keywords as $word){
                $query_string .= " keywords LIKE '%".$word."%' OR ";
                $display_words .= $word." ";
            }
            $query_string = substr($query_string, 0, strlen($query_string) - 3);


            $query = mysqli_query($link, $query_string);
            $result_count = mysqli_num_rows($query);

            // check to see if any results were returned
            if ($result_count > 0){
                            
                // display search result count to user
                echo '<br /><div class="right"><b><u>'.$result_count.'</u></b> results found</div>';
                echo 'Your search for <i>'.$display_words.'</i> <hr /><br />';

                echo '<table class="search">';

                // display all the search results to the user
                while ($row = mysqli_fetch_assoc($query)){
                                
                    echo $row["productLine"]. " ". $row["productName"]. " ". 
                    $row["price"]. "<br>";
                }

                echo '</table>';
            }
            else
            echo 'No results found. Please search something else.';
        }
        else
        echo '';
    ?>
    

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