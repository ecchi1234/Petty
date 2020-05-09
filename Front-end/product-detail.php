<?php
    session_start();
    require_once "config.php";
    $name = $productLine = $n_price = $price = $image = $producer = $description = '';
    if(!isset($_SESSION['cart']) || !isset($_SESSION['number']))
    {
        $_SESSION['cart'] = array();
        $_SESSION['number'] = array();
        $_SESSION['price'] = array();
    }
    // print_r($_SESSION['cart']);
    // print_r($_SESSION['number']);
    if(isset($_GET['id']) && $_GET['id'] != '')
    {
        $query_string = "SELECT *,FORMAT(price, 0) as f_price FROM products WHERE productCode =".$_GET['id'];
        $query = mysqli_query($link, $query_string);
        if(mysqli_num_rows($query) > 0)
        {
            $row = mysqli_fetch_assoc($query);
            $name = $row['productName'];
            $productLine = $row['productLine'];
            $image = $row['image'];
            $n_price = $row['price'];
            $price = $row['f_price']."đ";
            $producer = $row['producer'];
            $description = $row['productDescription'];
        }
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
        <div class='container' id='petty-header' style='width: 100%; height: 100%;'>
            <a class='logo' href='../index.php'></a>
            <form class='search' action='search.php' method='GET'>
                <input class='txtSearch' name='key' type='text' placeholder='Tìm kiếm'>
                <button type='submit' id='btnSearch' onclick='window.location.href = "search.php";'><i id='search-icon'></i></button>
            </form>
            <span><i class='fas fa-bell' style='color: white; position: absolute; right: 350px; font-size: 20px; top: 19px;'></i></span>
            <div class='user mt-2 ml-4'>
                <span><i class='fas fa-user-alt' style='color: #ef5030; font-size: 20px;'></i></span>
                <a href='login.php' style='color: #fff;'>
                <?php
                if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)
                {
                    echo $_SESSION["username"];
                }
                else
                {
                    echo "Đăng ký/đăng nhập";
                }
                ?>
                </a>
            </div>
            <a href="cart.php">
                <div class="cart">
                    <i></i>
                    <span>Giỏ hàng</span>
                    <div class="product-count"><?php 
                    if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true && sizeOf($_SESSION['cart']) > 0)
                    echo sizeOf($_SESSION['cart']);?></div>
                </div>
            </a>
        </div>
        <div class="container" style="position: relative;">
            <div class="toast" data-autohide="false" style="position: absolute; right: 0px;">
                <div class="toast-header">
                    <span class="fas fa-check-circle mr-2 text-success"></span>
                    <strong class="mr-auto text-success">Thêm vào giỏ hàng thành công!</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                </div>
                <div class="toast-body" style="text-align: center;">
                    <a href="cart.php"><button>Xem giỏ hàng và thanh toán</button></a>
                </div>
            </div>
        </div>
    </div>
    <!--Menu-->
    <div class="catalog">
        <div class="item-catalog home">Trang chủ</div>
        <div class="item-catalog">Giới thiệu</div>
        <div class="item-catalog">Dịch vụ</div>
        <div class="item-catalog">Liên hệ</div>
        <div class="item-catalog">Blog</div>
    </div>
    <!--Content-->
    <div class="product-detail-page content container" style="min-height: 300px;">
        <h3 class="title-catalog">Danh mục</h3>
        <div class="view-product">
            <div class="product-image">
                <img src="<?php echo $image?>">
            </div>
            <div class="product-detail">
                <div class="product-name">
                    <h3><?php echo $name?></h3>
                </div>
                <div class="product-status">
                    <!-- rating -->
                    <div class="rating">
                        <span class="level">5.0</span>
                        <span class="label">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </span>
                    </div>
                    <div class="number-of-rating"><a href="#demo">100 <span>đánh giá</span></a></div>
                </div>
                <div class="product-price">
                    <h2><?php echo $price;?></h2>
                </div>
                <div class="product-description">
                    <p>
                        <?php echo $producer;?>
                    </p>
                    <br>
                    <p>
                        <?php echo $description;?>
                    </p>
                </div>
                <!-- change quantity button -->
                <div class="product-quantity">
                    <div class="input-group quantity-block">
                        <span class="left" style="border: 1px solid #ccc; border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
                            <button type="button" id="minus-quantity" class="btn">
                                <i class="fas fa-minus">
                                </i>
                            </button>
                        </span>
                        <input type="number" id="quantity" class="input-number" name="quantity"  min="1" max="100" value="1" oninput="validity.valid||(value=0);" style="text-align: center; width: 50px;">
                        <span class="right" style="border: 1px solid #ccc; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
                            <button type="button" id="plus-quantity" class="btn">
                                <i class="fas fa-plus">
                                </i>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="add-cart" style="margin-top: 20px;">
                    <button type="button" id="addcart">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Chọn mua</span>
                    </button>
                    <span class="add-wishlist">
                        <i class="far fa-heart"></i>
                    </span>
                </div>
            </div>
       </div>
       <div class="detailed-description">
            <h3 class="title">Mô tả sản phẩm</h3>
            <div class="text">
                <?php
                    echo $description;
                ?>
            </div>
       </div>
       <!--Phần review của khách hàng-->
       <div class="customer-review">
            <h3 class="title">Nhận xét của khách hàng</h3>
            <div class="rating-overview row shadow">
                <div class="rating-average col-3" style="padding: 30px;">
                    <p>Đánh giá trung bình</p>
                    <h1 style="color: #ef5030;">5/5</h1>
                    <span class="label">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </span>
                </div>
                <div class="rating-percentage col-5">
                    <div class="rate-item rate-5">
                        <div class="rating-num" style="margin-right: 5px;">5<i class="fas fa-star"></i></div>
                        <div class="progress" style="width: 300px;">
                            <div class="progress-bar" style="width:70%">70%</div>
                        </div>
                    </div>
                    <div class="rate-item rate-4">
                        <div class="rating-num" style="margin-right: 5px;">4<i class="fas fa-star"></i></div>
                        <div class="progress" style="width: 300px;">
                            <div class="progress-bar" style="width:70%">70%</div>
                        </div>
                    </div>
                    <div class="rate-item rate-3">
                        <div class="rating-num" style="margin-right: 5px;">3<i class="fas fa-star"></i></div>
                        <div class="progress" style="width: 300px;">
                            <div class="progress-bar" style="width:70%">70%</div>
                        </div>
                    </div>
                    <div class="rate-item rate-5">
                        <div class="rating-num" style="margin-right: 5px;">2<i class="fas fa-star"></i></div>
                        <div class="progress" style="width: 300px;">
                            <div class="progress-bar" style="width:70%">70%</div>
                        </div>
                    </div>
                    <div class="rate-item rate-5">
                        <div class="rating-num" style="margin-right: 5px;">1<i class="fas fa-star"></i></div>
                        <div class="progress" style="width: 300px;">
                            <div class="progress-bar" style="width:15%">0%</div>
                        </div>
                    </div>

                </div>
                <div class="sharing-comment col">
                    <p>Chia sẻ nhận xét của bạn</p>
                    <button>Viết nhận xét của bạn</button>
                </div>
            </div>
            <div class="product-review-box" style="padding: 20px;">
                <div class="review-filter">
                    <form>
                        <label for="filter" class="mr-3 ml-5">Chọn xem nhận xét</label>
                        <select id="filter" style="width: 200px; height: 30px; border-radius: 5px;">
                            <option value="all">Tất cả</option>
                            <option value="5sao">5 sao</option>
                            <option value="4sao">4 sao</option>
                            <option value="3sao">3 sao</option>
                            <option value="2sao">2 sao</option>
                            <option value="1sao">1 sao</option>
                        </select>
                    </form>
                </div>
                <div class="item-review row" style="padding: 20px;">
                    <div class="col-2" style="text-align: center;">
                        <img src="../Front-end/asset/resource/img/avatar.jpg" class="rounded-circle" style="width: 80px;">
                        <div class="customer-name">Nguyễn Ngọc Chi</div>
                        <div class="posted-time">2 tháng trước</div>
                    </div>
                    <div class="col review-description">
                        <div>
                            <span class="label">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                            <span class="ml-2">Hài lòng</span>
                        </div>
                        <div style="color: #ccc;"><i>Đã mua sản phẩm</i></div>
                        <div>
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
                            Eos aut praesentium voluptatem expedita maiores. Maiores 
                            quos tempora accusantium dolorem in, magni tenetur, ea deleniti 
                            voluptas aperiam, ullam laudantium exercitationem eum.
                        </div>
                    </div>
                </div>
                <div class="item-review row" style="padding: 20px;">
                    <div class="col-2" style="text-align: center;">
                        <img src="../Front-end/asset/resource/img/avatar.jpg" class="rounded-circle" style="width: 80px;">
                        <div class="customer-name">Nguyễn Ngọc Chi</div>
                        <div class="posted-time">2 tháng trước</div>
                    </div>
                    <div class="col review-description">
                        <div>
                            <span class="label">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                            <span class="ml-2">Hài lòng</span>
                        </div>
                        <div style="color: #ccc;"><i>Đã mua sản phẩm</i></div>
                        <div>
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
                            Eos aut praesentium voluptatem expedita maiores. Maiores 
                            quos tempora accusantium dolorem in, magni tenetur, ea deleniti 
                            voluptas aperiam, ullam laudantium exercitationem eum.
                        </div>
                    </div>
                </div>
                <div class="item-review row" style="padding: 20px;">
                    <div class="col-2" style="text-align: center;">
                        <img src="../Front-end/asset/resource/img/avatar.jpg" class="rounded-circle" style="width: 80px;">
                        <div class="customer-name">Nguyễn Ngọc Chi</div>
                        <div class="posted-time">2 tháng trước</div>
                    </div>
                    <div class="col review-description">
                        <div>
                            <span class="label">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                            <span class="ml-2">Hài lòng</span>
                        </div>
                        <div style="color: #ccc;"><i>Đã mua sản phẩm</i></div>
                        <div>
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
                            Eos aut praesentium voluptatem expedita maiores. Maiores 
                            quos tempora accusantium dolorem in, magni tenetur, ea deleniti 
                            voluptas aperiam, ullam laudantium exercitationem eum.
                        </div>
                    </div>
                </div>
            </div>
       </div>
       <!--Hết phần review của khách hàng-->
       <!--Phần sản phẩm liên quan-->
       <!--Chỗ này cho hiện 4 sản phẩm liên quan nhất thôi, nhiều hơn thì bấm xem thêm-->
       <div class="related-products" style="position: relative;">
            <h3 class="title related-title m-4">Sản phẩm liên quan</h3>
            <div class="row">
                <!--Một ô sản phẩm tương ứng với một cái div có class col-md-3 col-sm-6-->
                <?php
                $sql = "SELECT * FROM products WHERE productLine = '".$productLine."' AND producer ='".$producer."' AND productCode <> ".$_GET['id']." LIMIT 4";
                $query_relate = mysqli_query($link, $sql);
                while($row_relate = mysqli_fetch_assoc($query_relate))
                {
                    echo "
                    <div class='col-md-3 col-sm-6'>
                    <div class='product-grid'>
                        <div class='product-image'>
                            <a href='#' class='image'>
                                <img class='pic-1' src='".$row_relate['image']."'>
                                <img class='pic-2' src='".$row_relate['image']."'>
                            </a>
                        </div>
                        <div class='product-content'>
                            <ul class='rating'>
                                <li class='fa fa-star'></li>
                                <li class='fa fa-star'></li>
                                <li class='fa fa-star'></li>
                                <li class='fa fa-star disable'></li>
                                <li class='fa fa-star disable'></li>
                            </ul>
                            <h3 class='title'><a href='#'>".$row_relate['productName']."</a></h3>
                            <div class='price'>".$row_relate['productName']."</div>
                            <ul class='social'>
                                <li><a href='#'><i class='fa fa-shopping-cart'></i></a></li>
                                <li><a href='#'><i class='fa fa-heart'></i></a></li>
                                <li><a href='#'><i class='fa fa-eye'></i></a></li>
                                <li><a href='#'><i class='fa fa-random'></i></a></li>
                            </ul>
                        </div>
                    </div>  
                    </div>
                    ";
                }
                ?>
                <!-- <div class="col-md-3 col-sm-6">
                    <div class="product-grid">
                        <div class="product-image">
                            <a href="#" class="image">
                                <img class="pic-1" src="../Front-end/asset/resource/img/Cat.jpg">
                                <img class="pic-2" src="../Front-end/asset/resource/img/Cat.jpg">
                            </a> -->
                            <!--Khi nào sản phẩm ý có khuyến mãi thì thêm cái span này-->
                            <!-- <span class="product-discount-label">-33%</span>
                        </div>
                        <div class="product-content">
                            <ul class="rating">
                                <li class="fa fa-star"></li>
                                <li class="fa fa-star"></li>
                                <li class="fa fa-star"></li>
                                <li class="fa fa-star"></li>
                                <li class="fa fa-star disable"></li>
                            </ul>
                            <h3 class="title"><a href="#">Mèo Hoàng gia</a></h3> -->
                            <!--Nếu có khuyến mãi thì thêm một span bên cạnh giá gốc-->
                            <!-- <div class="price">$20.00<span>$30.00</span></div>
                            <ul class="social">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div> -->
            </div>
            <!--Chỗ hiện mặt hàng-->
            <form class="more"><button type="button">Xem thêm</button></form>
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
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="JS/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#addcart').click(function(){
                var check = <?php if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) echo"true"; else echo "false";?>;
                if(check == true)
                {
                    $('.toast').toast('show');
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                    var number = document.getElementById("quantity").value;
                    var id = <?php echo $_GET['id'];?>;
                    var price = <?php echo $n_price;?>;
                    $.ajax({
                        url:"addToCart.php",
                        method:"POST",
                        data: {number: number, id: id, price:price},
                        success: function(data)
                        {
                            $('.product-count').html(data);
                        }
                    });
                }
            }); 
            $('#minus-quantity').click(function(){
                if(parseInt(document.getElementById("quantity").value) > 1)
                {
                    var i = parseInt(document.getElementById("quantity").value) - 1;
                    document.getElementById("quantity").value = i;
                }
            });
            $('#plus-quantity').click(function(){
                var i = parseInt(document.getElementById("quantity").value) + 1;
                document.getElementById("quantity").value = i;
            });
        });
    </script>
</body>
</html>