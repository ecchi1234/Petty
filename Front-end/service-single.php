<?php
    session_start();
    require_once('config.php');
    $name = $price = $serviceLine = $description = " ";
    if(!isset($_SESSION['cart']) || !isset($_SESSION['number']))
    {
        $_SESSION['cart'] = array();
        $_SESSION['number'] = array();
        $_SESSION['price'] = array();
    }
    if(isset($_GET['id']) && $_GET['id'] != '')
    {
        $query_string = "SELECT *,FORMAT(price, 0) as f_price,(SELECT serviceLine FROM serviceLine sl WHERE sl.ID = s.serviceLine) as service_line FROM services s WHERE serviceID =".$_GET['id'];
        $query = mysqli_query($link, $query_string);
        if(mysqli_num_rows($query) > 0)
        {
            $row = mysqli_fetch_assoc($query);
            $name = $row['serviceName'];
            $serviceLine = $row['service_line'];
            $image = $row['serviceImage'];
            $price = $row['f_price']."đ";
            $description = $row['serviceDescription'];
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
    <?php
        include "header.php";
    ?>
    <!--Menu-->
    <?php
        include "menu.php";
    ?>
    <!--Content-->
    <div class="product-detail-page content container" style="min-height: 300px;">
        <h3 class="title-catalog">Danh mục</h3>
        <div class="view-product">
            <div class="product-image" style="margin-right: 20px;">
                <img src="<?=$image?>">
            </div>
            <div class="product-detail">
                <div class="product-name">
                    <h3><?=$name?></h3>
                </div>
                <div class="product-status">
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
                    <h2><?php $price?></h2>
                </div>
                <div class="product-description">
                   <p>
                        <?=$serviceLine?>
                   </p>
                </div>
                <div class="add-cart" style="margin-top: 20px;">
                    <button type="submit" id="addcart">
                        <i class="fas fa-calendar-check"></i>
                        <span>Đặt lịch</span>
                    </button>
                </div>
            </div>
       </div>
       <div class="detailed-description">
            <h3 class="title">Mô tả sản phẩm</h3>
            <div class="text">
                <?=$description?>
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
                    <!--Button để mở modal nhận xét-->
                    <button data-toggle="modal" data-target="#comment-modal">Viết nhận xét của bạn</button>
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
       <!--Đây là modal cho comment-->
       <div class="modal fade" id="comment-modal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Viết nhận xét</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              <form>
                <label for="star-rating" style="margin-right: 10px;">1.Đánh giá của bạn về sản phẩm này: </label>
                <span id="star-row">
                    <i id="s1" class="vote-star fas fa-star"></i>
                    <i id="s2" class="vote-star fas fa-star"></i>
                    <i id="s3" class="vote-star fas fa-star"></i>
                    <i id="s4" class="vote-star fas fa-star"></i>
                    <i id="s5" class="vote-star fas fa-star"></i>
                </span>
                <br>
                <label for="comment-heading">2.Tiêu đề của nhận xét: </label>
                <input class="form-control" type="text" placeholder="Tiêu đề..."></input><br>
                <label for="comment">3.Viết nhận xét của bạn bên dưới:</label>
                <textarea class="form-control" rows="5" id="comment" placeholder="Viết nhận xét của bạn ở đây..."></textarea>
              </form>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn" data-dismiss="modal" style="background-color: #f19f1f; color: #fff;">Gửi nhận xét</button>
            </div>
      
          </div>
        </div>
      </div>
       <!--Hết phần review của khách hàng-->
       
    </div>

    <!--Footer-->
    <?php
        include "footer.php";
    ?>
    <script>
        $(document).ready(function(){
            $(".vote-star").click(function(){
                var n = parseInt(this.getAttribute("id").substring(1, 2));
                console.log('s'+n);
                for (var i = 1; i <= 5; ++i) {
                    if(i <= n)
                    {
                        $('#s'+i).css("color", "#FFC400");
                    }
                    else
                    {
                        $('#s'+i).css("color", "black");
                    }
                }
            });
            $('#addcart').click(function(){
                $('.toast').toast('show');
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }) 
        });
    </script>
</body>
</html>