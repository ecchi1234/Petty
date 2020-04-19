<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Petty</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./asset/css/base.css">
    <link rel="stylesheet" href="./asset/css/main.css">
</head>
<body>
    <!--Header-->
    <div id="petty-header">
        <a href="index.php"><div class="logo"></div></a>
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
    <div class="container">
    <?php
        // Include config file
        require_once "config.php";

        if (isset($_GET['key']) && $_GET['key'] != ''){
                        
            // save the keywords from the url
            $key = trim($_GET['key']);

            // create a base query and words string
            $query_string = "SELECT * FROM products WHERE ";
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
                            
                echo "<div class='header-product'>
                <h3 class='title'>Danh mục</h3>
                <div class='result-number'>Hiển thị ".MAX_PRODUCT_IN_PAGE." trên ".$result_count." kết quả</div>
                <form action='search.php' class='order-by'>
                    <label for='order-option'>Sắp xếp theo</label>
                    <select name='order-option' id='order-option'>
                        <option value='asc-price'>Giá rẻ nhất</option>
                        <option value='desc-price'>Giá đắt nhất</option>
                        <option value='newest'>Hàng mới</option>
                        <option value='most-likely'>Được yêu thích nhất</option>
                    </select>
                </form> 
                </div>";
                if(isset($_GET['page']))
                {
                    $page = trim($_GET['page']);
                }
                else
                {
                    $page = 0;
                }
                echo "<div class='row'>";
                $count = 0;
                // display all the search results to the user
                while ($row = mysqli_fetch_assoc($query)){
                    if( $count < $page*MAX_PRODUCT_IN_PAGE)
                    {
                        ++$count;
                    }
                    else if($count >= $page*MAX_PRODUCT_IN_PAGE + MAX_PRODUCT_IN_PAGE)
                    {
                        break;
                    }
                    else{
                        ++$count;
                        echo 
                        "<div class='col-md-3 col-sm-6'>
                            <div class='product-grid'>
                                <div class='product-image'>
                                    <a href='#' class='image'>
                                        <img class='pic-1' src='".$row['image']."'>
                                        <img class='pic-2' src='".$row['image']."'>
                                    </a>
                                </div>
                                <div class='product-content'>
                                    <ul class='rating'>
                                        <li class='fa fa-star'></li>
                                        <li class='fa fa-star'></li>
                                        <li class='fa fa-star'></li>
                                        <li class='fa fa-star'></li>
                                        <li class='fa fa-star disable'></li>
                                    </ul>
                                    <h3 class='title'><a href='#'>".$row['productName']."</a></h3>

                                    <div class='price'>$".$row['price']."<span></span></div>
                                    <ul class='social'>

                                        <li><a href='#'><i class='fa fa-shopping-cart'></i></a></li>
                                        <li><a href='#'><i class='fa fa-heart'></i></a></li>
                                        <li><a href='#'><i class='fa fa-eye'></i></a></li>
                                        <li><a href='#'><i class='fa fa-random'></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>";
                    }
                }
                echo "</div>";

                $key_string = "";
                foreach ($keywords as $word) {
                    $key_string .= $word."+";
                }
                $key_string = substr($key_string, 0, strlen($key_string) - 1);

                $i = $result_count;
                $i = intval($i/MAX_PRODUCT_IN_PAGE);
                if($result_count%MAX_PRODUCT_IN_PAGE != 0)
                {
                    ++$i; 
                }
                //page list
                if($i < MAX_PAGE_NUMBER_IN_PAGE)
                {
                    echo "<div>
                        <ul style='list-style-type: none;'>
                    ";
                    while (--$i >= 0) {
                        echo "<li style='float: right;'><a style='margin-left:10pt;' href='search.php?key=".$key_string."&page=".($i)."'>".($i + 1)."</a></li>";
                    }
                    echo "</div>
                        </ul>
                    ";
                }
                else if($i > MAX_PAGE_NUMBER_IN_PAGE && $page > intval(MAX_PAGE_NUMBER_IN_PAGE/2) && $page < $i - intval(MAX_PAGE_NUMBER_IN_PAGE/2)) {
                    echo "<div>
                        <ul style='list-style-type: none;'>"  ;
                    $i = $page + intval(MAX_PAGE_NUMBER_IN_PAGE/2) + 1;
                    while (--$i >= $page - intval(MAX_PAGE_NUMBER_IN_PAGE/2) ) {
                        echo "<li style='float: right;'><a style='margin-left:10pt;' href='search.php?key=".$key_string."&page=".($i)."'>".($i + 1)."</a></li>";
                    }
                    echo "</div>
                        </ul>
                    ";
                }
                else if($i > MAX_PAGE_NUMBER_IN_PAGE && $page > intval(MAX_PAGE_NUMBER_IN_PAGE/2) && $page >= $i - intval(MAX_PAGE_NUMBER_IN_PAGE/2)){
                    echo "<div>
                        <ul style='list-style-type: none;'>"  ;
                    $max = $i;
                    while (--$i >= $max - MAX_PAGE_NUMBER_IN_PAGE)  {
                        echo "<li style='float: right;'><a style='margin-left:10pt;' href='search.php?key=".$key_string."&page=".($i)."'>".($i + 1)."</a></li>";
                    }
                    echo "</div>
                        </ul>";
                }
                else{
                    echo "<div>
                        <ul style='list-style-type: none;'>"  ;
                    $j = MAX_PAGE_NUMBER_IN_PAGE;
                    while (--$j >= 0)  {
                        echo "<li style='float: right;'><a style='margin-left:10pt;' href='search.php?key=".$key_string."&page=".($j)."'>".($j + 1)."</a></li>";
                    }
                    echo "</div>
                        </ul>";
                }
            }
            else
            echo 'No results found. Please search something else.';
        }
        else
        echo '';
    ?>
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
    <!--<script src="main.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>