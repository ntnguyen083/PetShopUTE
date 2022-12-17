<%@ page import="bean.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ page import="bean.LoginBean" %>--%>
<%--<%--%>
<%--//    LoginBean loginBean = new LoginBean();--%>
<%--//    List<ProductEntity> product = productDao.getListProduct();--%>
<%--//    request.setAttribute("product", product);--%>
<%--%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Pet Shop</title>
    <link rel="icon" type="image/png" href="./assets/images/pet-shop-center-icon_24877-3877.png"/>
    <link href="./assets/css/style-starter.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./assets/fonts/font-awesome-4.7.0/css/font-awesome.css">
</head>
<body>
<!-- header -->
<header id="site-header" class="fixed-top nav-fixed">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="index.jsp">
                <i class="fas fa-dog"></i>Pet <span>Shop</span>
            </a>
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
                <span class="navbar-toggler-icon fa icon-close fa-times"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav mx-auto my-2 my-lg-0 navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/shop">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                    <li class="nav-item nav--login">
                        <a class="nav-link" href="login.jsp">Sign in</a>
                        <%UserBean user = (UserBean) session.getAttribute("user"); %>
                        <%if(user!=null){%>
                            <p class="hellouser">Xin chào,<%=user.getUserName()%></p>
                        <%}%>
                    </li>
                    <li class="nav-item btn-signout">
                        <%if(user!=null){%>
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                        <%}%>
                    </li>
                </ul>
            </div>
            <!-- toggle switch for light and dark theme -->
            <div class="cont-ser-position">
                <nav class="navigation">
                    <div class="theme-switch-wrapper">
                        <label class="theme-switch" for="checkbox">
                            <input type="checkbox" id="checkbox">
                            <div class="mode-container">
                                <i class="gg-sun"></i>
                                <i class="gg-moon"></i>
                            </div>
                        </label>
                    </div>
                </nav>
            </div>

            <!-- //toggle switch for light and dark theme -->
        </nav>
    </div>
</header>
<!-- //header -->

<!-- hero slider Start -->
<div class="banner-wrap">
    <div class="banner-slider">
        <!-- hero slide start -->
        <div class="banner-slide bg1">
            <div class="container">
                <div class="hero-content">
                    <p class="mb-2">Pets Love </p>
                    <h1>Chăm sóc thú cưng của bạn tốt nhất</h1>
                    <div class="cta-btn">
                        <a href="about.html" class="btn btn-style btn-primary">View More</a>
                    </div>
                </div>
            </div>
            <div class="hero-overlay"></div>
        </div>
        <!-- hero slide end -->
    </div>
    <div class="shape">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 280">
            <path fill-opacity="1">
                <animate attributeName="d" dur="20000ms" repeatCount="indefinite" values="M0,160L48,181.3C96,203,192,245,288,261.3C384,277,480,267,576,234.7C672,203,768,149,864,117.3C960,85,1056,75,1152,90.7C1248,107,1344,149,1392,170.7L1440,192L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z; M0,160L48,181.3C96,203,192,245,288,234.7C384,224,480,160,576,133.3C672,107,768,117,864,138.7C960,160,1056,192,1152,197.3C1248,203,1344,181,1392,170.7L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;												 M0,64L48,74.7C96,85,192,107,288,133.3C384,160,480,192,576,170.7C672,149,768,75,864,80C960,85,1056,171,1152,181.3C1248,192,1344,128,1392,96L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;
                                                 M0,160L48,181.3C96,203,192,245,288,261.3C384,277,480,267,576,234.7C672,203,768,149,864,117.3C960,85,1056,75,1152,90.7C1248,107,1344,149,1392,170.7L1440,192L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;"></animate>

            </path>
        </svg>
    </div>
</div>
<!-- hero slider end -->

<!-- about section -->
<section class="home-about-w3l py-5">
    <div class="container py-md-5 py-4">
        <div class="row align-items-center">
            <div class="col-lg-6 pe-lg-5">
                <div class="position-relative">
                    <h3 class="title-style mb-3">Giúp bạn như thế nào?</h3>
                    <div class="title-paw-style">
                        <i class="fas fa-paw"></i>
                        <i class="fas fa-paw paw-2"></i>
                        <i class="fas fa-paw paw-3"></i>
                    </div>
                </div>
                <p class="text-para">Chăm sóc thú cưng của bạn là trách nhiệm của chúng tôi.</p>
                <a href="about.html" class="btn btn-style mt-sm-5 mt-4">Discover More</a>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-5">
                <div class="row">
                    <div class="col-6 grids-1">
                        <i class="fab fa-medrt color-1"></i>
                        <h4 class="title-head mt-2 mb-3">Chẩn đoán và điều trị</h4>
                        <p>Với các thiết bị hiện đại, thú cưng của bạn sẽ luôn mạnh khỏe khi đến với chúng tôi</p>
                    </div>
                    <div class="col-6 grids-1">
                        <i class="fas fa-medal color-3"></i>
                        <h4 class="title-head mt-2 mb-3">Dịch vụ</h4>
                        <p>Nếu bạn không có thời gian để chăm sóc, hãy để chúng tôi làm điều đó</p>
                    </div>
                    <div class="col-6 grids-1 mt-5">
                        <i class="fas fa-bone color-2"></i>
                        <h4 class="title-head mt-2 mb-3">Nuôi thú cưng</h4>
                        <p>Khi đến đây, bạn sẽ được cung cấp các kiến thức cho việc nuôi thú cưng</p>
                    </div>
                    <div class="col-6 grids-1 mt-5">
                        <i class="fas fa-paw color-4"></i>
                        <h4 class="title-head mt-2 mb-3">Huấn luyện</h4>
                        <p>Với đội ngũ dày dặn và nhiều kinh nghiệm, chúng tôi sẽ dạy các kĩ năng cho thúc cưng của bạn</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- about section -->

<!-- aboutblock1 section -->
<section class="w3l-homeblock1 py-5" id="about">
    <div class="container py-md-5 py-4">
        <div class="row align-items-center">
            <div class="col-lg-6 homeaboutblock order-lg-first order-last">
                <div class="position-relative img-border">
                    <img src="assets/images/video.jpg" class="img-fluid video-popup-image radius-image" alt="video-popup">

                    <a href="#small-dialog" class="popup-with-zoom-anim play-view text-center position-absolute">
                            <span class="video-play-icon">
                                <span class="fa fa-play"></span>
                            </span>
                    </a>
                    <!-- dialog itself, mfp-hide class is required to make dialog hidden -->
                    <div id="small-dialog" class="zoom-anim-dialog mfp-hide">
                        <iframe src="https://player.vimeo.com/video/436935040" allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 ps-lg-5 mb-lg-0 mb-5 order-lg-last order-first">
                <div class="position-relative">
                    <h3 class="title-style mb-3">Chúng tôi sẽ làm cho bạn an tâm</h3>
                    <div class="title-paw-style">
                        <i class="fas fa-paw"></i>
                        <i class="fas fa-paw paw-2"></i>
                        <i class="fas fa-paw paw-3"></i>
                    </div>
                </div>

                <div class="mt-4">
                    <ul class="service-list">
                        <li class="service-link"><a href="about.html"><i class="fas fa-check-circle"></i>Được chứng nhận</a></li>
                        <li class="service-link"><a href="about.html"><i class="fas fa-check-circle"></i>20 năm kinh nghiệm</a></li>
                        <li class="service-link"><a href="about.html"><i class="fas fa-check-circle"></i>Tình yêu dành cho thú cưng</a>
                        </li>
                    </ul>
                </div>
                <a href="about.html" class="btn btn-style mt-4">Learn More</a>
            </div>
        </div>
    </div>
</section>
<!-- //aboutblock1 section -->

<!-- faq section -->
<div class="w3l-faq-block py-5" id="faq">
    <div class="container py-lg-5">
        <div class="row align-items-center">
            <div class="col-lg-7 pe-lg-5 order-lg-first order-last">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">01. Tại sao thú cưng là một phần trong cuộc sống của chúng ta?

                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">Mỗi chúng ta đều có sở thích và thú vui cho riêng mình. Việc nuôi thú cưng là một trong những điều đó.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">02. Chúng ta chăm sóc thú cưng của mình như thế nào?

                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">Luôn yêu thương và chăm sóc bằng những điều tốt đẹp.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">03. Bạn chọn thú cưng nào và tại sao?

                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">Hãy xem bản thân thích những thú cưng nào. Để ý những tác nhân xung quanh và chọn phù hợp cho mình.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 mb-lg-0 mb-5 order-lg-last order-first">
                <div class="position-relative">
                    <h3 class="title-style mb-3">Vì một cộng đồng</h3>
                    <div class="title-paw-style">
                        <i class="fas fa-paw"></i>
                        <i class="fas fa-paw paw-2"></i>
                        <i class="fas fa-paw paw-3"></i>
                    </div>
                </div>
                <p>Vì một xã hội tốt đẹp và văn minh cho muôn loài.</p>
                <p class="mt-2 mb-sm-5 mb-4">Chúng tôi luôn ưu đãi cho các trường hợp đặc biệt.</p>
                <a href="tel:+(21) 255 999 8888" class="call-style d-flex align-items-center"><i class="fas fa-phone-volume me-2"></i> +(21) 255
                    999 8888</a>
            </div>
        </div>
    </div>
</div>
<!-- //faq section -->

<!-- grids section -->
<section class="w3l-bottom-grids-6 pb-5 pt-4" id="services">
    <div class="container pb-lg-5 pb-4">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6">
                <div class="area-box">
                    <i class="fas fa-hand-holding-heart"></i>
                    <h4><a href="services.html" class="title-head">Chăm sóc thú cưng</a></h4>
                    <p>Chăm sóc và cho đi những tình yêu thương tốt đẹp.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mt-md-0 mt-4">
                <div class="area-box">
                    <i class="fas fa-paw"></i>
                    <h4><a href="services.html" class="title-head">Huấn luyện</a></h4>
                    <p>Các kĩ năng được đào tạo bài bản.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mt-lg-0 mt-4">
                <div class="area-box">
                    <i class="fas fa-dog"></i>
                    <h4><a href="services.html" class="title-head">Thời gian nghỉ cho thú cưng</a></h4>
                    <p>Đừng bắt thú cưng phải luôn hoạt động mà hãy để chúng được nghỉ ngơi, hồi phục thể trạng tốt nhất.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- //grids section -->

<!-- stats section -->
<section class="homeblock-stats py-5" id="stats">
    <div class="container py-md-5 py-4">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <div class="position-relative">
                    <h3 class="title-style mb-2">Hoạt động và kinh nghiệm</h3>
                    <div class="title-paw-style">
                        <i class="fas fa-paw"></i>
                        <i class="fas fa-paw paw-2"></i>
                        <i class="fas fa-paw paw-3"></i>
                    </div>
                </div>
                <p>Nhiều hoạt động chăm sóc các thú cưng bị bỏ rơi và tìm nhà phù hợp cho chúng.</p>
                <div class="row mt-4 pt-2">
                    <div class="col-6">
                        <div class="counter color-bg-1">
                            <div class="count-title d-flex align-items-center">
                                <div class="timer count-number">630</div>
                                <span class="ms-2">+</span>
                            </div>
                            <p class="count-text">Happy Clients</p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="counter color-bg-2">
                            <div class="count-title d-flex align-items-center">
                                <div class="timer count-number">80</div>
                                <span class="ms-2">+</span>
                            </div>
                            <p class="count-text">Professionals</p>
                        </div>
                    </div>
                    <div class="col-6 mt-4">
                        <div class="counter color-bg-3">
                            <div class="count-title d-flex align-items-center">
                                <div class="timer count-number">820</div>
                                <span class="ms-2">+</span>
                            </div>
                            <p class="count-text">Adopted Pets</p>
                        </div>
                    </div>
                    <div class="col-6 mt-4">
                        <div class="counter color-bg-4">
                            <div class="count-title d-flex align-items-center">
                                <div class="timer count-number">90</div>
                                <span class="ms-2">+</span>
                            </div>
                            <p class="count-text">Awards</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-5 col-lg-6 offset-xl-1 ps-xl-0 mt-lg-0 mt-5">
                <img src="assets/images/about1.jpg" class="img-fluid radius-image" alt="">
            </div>
        </div>
    </div>
</section>
<!-- //stats section -->

<!-- blog section -->
<div class="w3l-grids-block-5 blog-bg-sec py-5">
    <div class="container py-md-5 py-4">
        <div class="position-relative mb-lg-5 mb-4">
            <h3 class="title-style mb-2 text-center">Bài đăng mới nhất</h3>
            <div class="title-paw-style">
                <i class="fas fa-paw"></i>
                <i class="fas fa-paw paw-2"></i>
                <i class="fas fa-paw paw-3"></i>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 grids5-info">
                <a href="#blog"><img src="assets/images/blog1.jpg" alt="" class="img-fluid radius-image"></a>
                <div class="blog-info-grid">
                    <h5><span class="fa fa-clock-o"></span> Aug 1, 2021</h5>
                    <h4><a href="#blog">Domestic animals can save you from loneliness</a></h4>
                    <div class="blog-info mt-3">
                        <a href="#read">Read More <span class="fa fa-arrow-right ms-1"></span></a>
                        <a href="#comments"><span class="fa fa-comment-o"></span> 3 comments</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 grids5-info mt-md-0 mt-5">
                <a href="#blog"><img src="assets/images/blog2.jpg" alt="" class="img-fluid radius-image"></a>
                <div class="blog-info-grid">
                    <h5><span class="fa fa-clock-o"></span> Aug 2, 2021</h5>
                    <h4><a href="#blog">How to bond with your new rescue pet? </a></h4>
                    <div class="blog-info mt-3">
                        <a href="#read">Read More <span class="fa fa-arrow-right ms-1"></span></a>
                        <a href="#comments"><span class="fa fa-comment-o"></span> 3 comments</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 grids5-info mt-lg-0 mt-5">
                <a href="#blog"><img src="assets/images/blog3.jpg" alt="" class="img-fluid radius-image"></a>
                <div class="blog-info-grid">
                    <h5><span class="fa fa-clock-o"></span> Aug 3, 2021</h5>
                    <h4><a href="#blog">What happens if a dog doesn’t get adopted? </a></h4>
                    <div class="blog-info mt-3">
                        <a href="#read">Read More <span class="fa fa-arrow-right ms-1"></span></a>
                        <a href="#comments"><span class="fa fa-comment-o"></span> 3 comments</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //blog section -->

<!-- testimonials -->
<section class="w3l-clients py-5" id="testimonials">
    <div class="container pt-md-5 pt-4">
        <div class="row w3-testimonial-grids align-items-center">
            <div class="col-lg-6 w3-testimonial-content-top pr-lg-5">
                <div class="position-relative mb-lg-4 mb-sm-2 mb-4">
                    <h3 class="title-style">Khách hàng nghĩ gì về chúng tôi</h3>
                    <div class="title-paw-style">
                        <i class="fas fa-paw"></i>
                        <i class="fas fa-paw paw-2"></i>
                        <i class="fas fa-paw paw-3"></i>
                    </div>
                </div>
                <div id="owl-demo1" class="owl-carousel owl-theme py-sm-2 mb-4 owl-loaded owl-drag">




                    <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-1530px, 0px, 0px); transition: all 0.25s ease 0s; width: 4080px;"><div class="owl-item cloned" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae
                                        laudantium
                                        voluptate rem ullam dolore nisi voluptatibus esse quasi, doloribus tempora.
                                        Dolores molestias adipisci dolor sit amet! by the Desire to achieve
                                        Success.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/testi3.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Roy Mmdson</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item cloned" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae
                                        laudantium
                                        voluptate rem ullam dolore nisi voluptatibus esse quasi, doloribus tempora.
                                        Dolores molestias adipisci dolor sit amet! by the Desire to achieve
                                        Success.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/testi2.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Mike Thyson</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Quá tuyệt vời.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/testi1.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>John wilson</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Không có gì phải chê. 10 điểm.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/testi2.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Julia sakura</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Dịch vụ tuyệt vời.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/testi3.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Roy Mmdson</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Thú cưng của tôi như được mới mẻ khi đến shop này.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="https://cdn.britannica.com/28/215028-050-94E9EA1E/American-actor-Chris-Evans-2019.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Chris Evans</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item cloned" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>10 điểm ❤️  </q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="https://img.a.transfermarkt.technology/portrait/big/8198-1631656078.jpg?lm=1" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Cristiano Ronaldo</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div><div class="owl-item cloned" style="width: 510px;"><div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae
                                        laudantium
                                        voluptate rem ullam dolore nisi voluptatibus esse quasi, doloribus tempora.
                                        Dolores molestias adipisci dolor sit amet! by the Desire to achieve
                                        Success.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/testi2.jpg" class="img-fluid" alt="client-img">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Julia sakura</h3>
                                        <p class="indentity">Subtitle goes here</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous"> <span class="fa fa-chevron-left"></span> </span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next"> <span class="fa fa-chevron-right"></span> </span></button></div><div class="owl-dots"><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot active"><span></span></button><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot"><span></span></button></div></div>
            </div>
            <div class="col-lg-6 position-relative ps-lg-5 mt-lg-0 mt-5 pt-lg-0 pt-sm-4">
                <img src="assets/images/about2.jpg" alt="" class="radius-image img-fluid">
            </div>
        </div>
    </div>
</section>
<!-- //testimonials -->

<!-- footer -->
<footer class="w3l-footer">
    <div class="shape-footer">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 280">
            <path fill-opacity="1">
                <animate attributeName="d" dur="20000ms" repeatCount="indefinite" values="M0,160L48,181.3C96,203,192,245,288,261.3C384,277,480,267,576,234.7C672,203,768,149,864,117.3C960,85,1056,75,1152,90.7C1248,107,1344,149,1392,170.7L1440,192L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z; M0,160L48,181.3C96,203,192,245,288,234.7C384,224,480,160,576,133.3C672,107,768,117,864,138.7C960,160,1056,192,1152,197.3C1248,203,1344,181,1392,170.7L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;												 M0,64L48,74.7C96,85,192,107,288,133.3C384,160,480,192,576,170.7C672,149,768,75,864,80C960,85,1056,171,1152,181.3C1248,192,1344,128,1392,96L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;
                                             M0,160L48,181.3C96,203,192,245,288,261.3C384,277,480,267,576,234.7C672,203,768,149,864,117.3C960,85,1056,75,1152,90.7C1248,107,1344,149,1392,170.7L1440,192L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z;"></animate>

            </path>
        </svg>
    </div>
    <div class="w3l-footer-16 py-5">
        <div class="container">
            <div class="row footer-p">
                <div class="col-lg-4 pe-lg-5">
                    <h3>About Us</h3>
                    <p class="mt-3">Thú cưng của bạn sẽ được chăm sóc đặc biệt khi ở đây.</p>
                    <div class="columns-2 mt-lg-5 mt-4">
                        <ul class="social">
                            <li><a href="#facebook"><i class="fab fa-facebook-f"></i></a>
                            </li>
                            <li><a href="#linkedin"><i class="fab fa-linkedin-in"></i></a>
                            </li>
                            <li><a href="#twitter"><i class="fab fa-twitter"></i></a>
                            </li>
                            <li><a href="#google"><i class="fab fa-google-plus-g"></i></a>
                            </li>
                            <li><a href="#github"><i class="fab fa-github"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-5 mt-lg-0 mt-5">
                    <div class="row">
                        <div class="col-xl-5 col-6 column">
                            <h3>Quick Link</h3>
                            <ul class="footer-gd-16">
                                <li><a href="about.html">About Us</a></li>
                                <li><a href="#clients">Our Clients</a></li>
                                <li><a href="services.html">Services</a></li>
                                <li><a href="#blog">Blog Posts</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </div>
                        <div class="col-6 column">
                            <h3>Contact Info</h3>
                            <ul class="footer-contact-list">
                                <li class="">Số 1 Võ Văn Ngân, Thủ Đức, TP. Hồ Chí Minh</li>
                                <li class="mt-2"><a href="tel:+12 23456790">+1223 456 790</a></li>
                                <li class="mt-2"><a href="mailto:ex2002@gmai.com">ex2002@gmai.com</a></li>
                                <li class="mt-2"><a href="mailto:hcmute@gmail.com">hcmute@gmail.com</a></li>
                            </ul>
                        </div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.484231881318!2d106.76973361407143!3d10.85072666078669!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUcC4gSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1668351911848!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <div class="col-lg-3 col-md-7 col-sm-8 column mt-lg-0 mt-4 pl-xl-0">
                    <h3>Newsletter </h3>
                    <div class="end-column">
                        <form action="#" class="subscribe" method="post">
                            <input type="email" name="email" placeholder="Email Address" required="">
                            <button><span class="fa fa-paper-plane" aria-hidden="true"></span></button>
                        </form>
                        <p class="mt-4">Subscribe to our mailing list and get updates to your email inbox.</p>
                    </div>
                </div>
            </div>
            <div class="below-section text-center pt-lg-4 mt-5">
                <p class="copy-text">© 2022 Pet Shop. All rights reserved. Design by <a href="https://w3layouts.com/" target="_blank">Vngocz &amp; Trnguyen</a>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- //footer -->

<!-- Js scripts -->
<!-- move top -->
<button onclick="topFunction()" id="movetop" title="Go to top" style="display: block;">
    <span class="fas fa-level-up-alt" aria-hidden="true"></span>
</button>
<script>
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("movetop").style.display = "block";
        } else {
            document.getElementById("movetop").style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
</script>
<!-- //move top -->

<!-- common jquery plugin -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<!-- //common jquery plugin -->

<!-- tesimonials carousel slider -->
<script src="assets/js/owl.carousel.js"></script>
<script>
    $(document).ready(function () {
        $("#owl-demo1").owlCarousel({
            loop: true,
            nav: false,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1,
                    nav: false
                },
                736: {
                    items: 1,
                    nav: false
                }
            }
        })
    })
</script>
<!-- //script for tesimonials carousel slider -->

<!-- magnific popup -->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',

            fixedContentPos: false,
            fixedBgPos: true,

            overflowY: 'auto',

            closeBtnInside: true,
            preloader: false,

            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

        $('.popup-with-move-anim').magnificPopup({
            type: 'inline',

            fixedContentPos: false,
            fixedBgPos: true,

            overflowY: 'auto',

            closeBtnInside: true,
            preloader: false,

            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-slide-bottom'
        });
    });
</script>
<!-- //magnific popup -->

<%-- Script login--%>
<script>
    var login = document.querySelector(".nav--login > p");
    if(login.classList.contains("hellouser"))
    {
        var sublogin = document.querySelector(".nav--login .nav-link");
        sublogin.style.display = "none";
    }
</script>

<script>
    var btnsignout = document.querySelector(".btn-signout");
    btnsignout.onclick = function ()
    {
        let choice = confirm("Bạn có muốn đăng xuất?");
        if (choice == true) {
            window.location = "<%=request.getContextPath()%>/LogoutServlet";
        } else {

        }
    }
</script>

<!-- theme switch js (light and dark)-->
<script src="assets/js/theme-change.js"></script>
<!-- //theme switch js (light and dark)-->

<!-- MENU-JS -->
<script>
    $(window).on("scroll", function () {
        var scroll = $(window).scrollTop();

        if (scroll >= 80) {
            $("#site-header").addClass("nav-fixed");
        } else {
            $("#site-header").removeClass("nav-fixed");
        }
    });

    //Main navigation Active Class Add Remove
    $(".navbar-toggler").on("click", function () {
        $("header").toggleClass("active");
    });
    $(document).on("ready", function () {
        if ($(window).width() > 991) {
            $("header").removeClass("active");
        }
        $(window).on("resize", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
        });
    });
</script>
<!-- //MENU-JS -->

<!-- disable body scroll which navbar is in active -->
<script>
    $(function () {
        $('.navbar-toggler').click(function () {
            $('body').toggleClass('noscroll');
        })
    });
</script>
<!-- //disable body scroll which navbar is in active -->

<!-- bootstrap -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- //bootstrap -->
<!-- //Js scripts -->
<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support
    if ('WebSocket' in window) {
        (function () {
            function refreshCSS() {
                var sheets = [].slice.call(document.getElementsByTagName("link"));
                var head = document.getElementsByTagName("head")[0];
                for (var i = 0; i < sheets.length; ++i) {
                    var elem = sheets[i];
                    var parent = elem.parentElement || head;
                    parent.removeChild(elem);
                    var rel = elem.rel;
                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                    }
                    parent.appendChild(elem);
                }
            }
            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
            var address = protocol + window.location.host + window.location.pathname + '/ws';
            var socket = new WebSocket(address);
            socket.onmessage = function (msg) {
                if (msg.data == 'reload') window.location.reload();
                else if (msg.data == 'refreshcss') refreshCSS();
            };
            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                console.log('Live reload enabled.');
                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
            }
        })();
    }
    else {
        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    }
    // ]]>
</script>


</body>
</html>