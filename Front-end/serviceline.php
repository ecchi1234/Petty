<?php
    session_start();
    require_once('config.php');
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
    <div class="content container about-page" style="min-height: 500px;">
        <?php
        if(isset($_GET['id']) && $_GET['id'] != ''){
            $id = $_GET['id'];
            $sql = 'SELECT * FROM serviceline WHERE ID ='.$id;
            $query = mysqli_query($link, $sql);
            if ($row = mysqli_fetch_assoc($query)){
                $sql = 'SELECT * FROM services WHERE serviceline ='.$row['ID'];
                $query_tmp = mysqli_query($link, $sql);
                echo "<div style='text-align: center;'>
                <h3 class='title-about' style='font-size: 40px;'><span class='fas fa-paw'></span>".$row['serviceLine']."<span class='fas fa-paw'></span></h3>
                </div>
                <div class='underline'></div>
                <div class='serviceline-overview'>

                <div class='img-serviceline' style='background-image:url(".$row['imageLink'].");'></div>
            <div class='description-serviceline'>
                <h3>Mọi thứ đều dành cho thú cưng của bạn</h3>
                <p>".$row['description']."
                </p>
                <ul style='display: block;' class='list'>";

                while ($row_tmp = mysqli_fetch_assoc($query_tmp)) {
                    echo "
                    <li>
                        <div class='heading-list'></div>
                        <span><a style='color: #108896;' href='service-single.php?id=".$row_tmp['serviceID']."'>".$row_tmp['serviceName']."</a></span>
                    </li>";
                }
                echo "</ul>
            </div>
        </div>";
            }
        }
        ?>
        <div style="text-align: center;">
            <h3 class="title-about"><span class="fas fa-paw"></span>Đặt lịch ngay<span class="fas fa-paw"></span></h3>
        </div>
        <div class="serviceinline-list item service">
            <div class="service-list container owl-carousel owl-theme">
                <!--Nếu thêm dịch vụ gì thì thêm vào đây-->
                <?php
                    $sql = 'SELECT * FROM services WHERE 1';
                    $query = mysqli_query($link, $sql);
                    while ($row = mysqli_fetch_assoc($query)) {
                        echo "<div class='service-item shadow vet'>
                    <div class='service-image' style='background-image:url(".$row['serviceImage'].");'></div>
                    <div class='service-title'>".$row['serviceName']."</div>
                    <div class='service-description-sub'>Some text</div>
                    <button class='more-info'>Đặt lịch</button>
                    </div>";
                    }
                ?>
            </div>
        </div>
    </div>
    
    <!--Footer-->
    <?php include "footer.php"?>
</body>
</html>