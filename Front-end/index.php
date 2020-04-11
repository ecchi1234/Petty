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
    <!--Content-->
    <div class="content">
        <div class="item overview">
            <img class="mySlides" src="asset/resource/img/slide1.png">
            <img class="mySlides" src="asset/resource/img/slide2.jpg">
            <img class="mySlides" src="asset/resource/img/slide3.jpg">
            <img class="mySlides" src="asset/resource/img/slide4.jpg">
        </div>
        <div class="item special-product" >
            <div class="hot-product">Sản phẩm hot</div>
            <div class="sale">Sản phẩm giảm giá</div>
        </div>

        <div class="item service">
            <div class="title">Our Services</div>
            <div class="service-description">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Vitae 
                temporibus eos aliquid sapiente dolores quas. Dolorem, excepturi quidem accusantium ut natus 
                neque dignissimos laborum voluptate ipsa obcaecati incidunt suscipit temporibus.</div>
            <div class="service-list">
                <div class="service-item vet">
                    <div class="service-image"></div>
                    <div class="service-title">Vet Services</div>
                    <div class="service-description-sub">Some text</div>
                    <button class="more-info">Read More</button>
                </div>
                <div class="service-item great-products">
                    <div class="service-image"></div>
                    <div class="service-title">Great Products</div>
                    <div class="service-description-sub">Some text</div>
                    <button class="more-info">Read More</button>
                </div>
                <div class="service-item hotel">
                    <div class="service-image"></div>
                    <div class="service-title">Pet Hotel</div>
                    <div class="service-description-sub">Some text</div>
                    <button class="more-info">Read More</button>
                </div>
                <div class="service-item dog-walking">
                    <div class="service-image"></div>
                    <div class="service-title">Dog Walking</div>
                    <div class="service-description-sub">Some text</div>
                    <button class="more-info">Read More</button>
                </div>
                <div class="service-item exotic-pets">
                    <div class="service-image"></div>
                    <div class="service-title">Exotic Pets</div>
                    <div class="service-description-sub">Some text</div>
                    <button class="more-info">Read More</button>
                </div>
            </div>
        </div>
        <div class="item about">Về Petty</div>
        <div class="item feedback">Feedback</div>
        <div class="item contact">Liên hệ</div>

    </div>

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