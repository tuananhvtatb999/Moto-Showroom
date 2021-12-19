<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Moto Best</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    ${message }
    <style>
        .desc-sale {
            position: absolute;
            top: 0;
            right: 3px;
            background: url(../image/icosale.png);
            width: 50px;
            height: 50px;
        }

        .container-items .desc-sale {
            top: 8px;
            right: 8px;
        }

        .desc-sale span {
            transform: rotate(45deg);
            position: absolute;
            top: 5px;
            right: 0px;
            font-weight: bold;
        }

        .cost1 {
            font-weight: bold;
            font-size: 18px;
        }

        .item:hover {
            color: #FF6633;
        }

        .item a:hover {
            text-decoration: none;
        }

        .text-outer a:hover {
            text-decoration: none;
        }

        .text-outer a {
            color: #000000;
        }

        .page-item.first, .page-item.last {
            display: none;
        }

        .pagesss {
            float: right;
        }

        .item {
            margin: 50px 10px 20px 10px;
        }

        .item .item-title {
            padding: 10px;
            min-height: 100px;
            color: black;
        }

        h6 {
            text-transform: uppercase;
            margin-top: 8px;
        }

        .item .item-title h6 {
            margin-top: 10px;
            font-size: 16px;
            min-height: 50px;
        }

        .item-title h5 {
            font-size: 18px;
        }

        .item .item-title h6:hover, h5:hover {
            color: #FF6633;
        }
    </style>
</head>

<body>
<header>
    <jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
    <div class="bg-black-menu">
        <div class="container">
            <div class="menu">
					<span id="icon-close" class="d-md-none"><i
                            class="fas fa-times"></i></span>
                <ul>
                    <li>
                        <div class="search d-flex d-md-none d-block">
                            <div>
                                <input type="text" placeholder="Tìm kiếm...">
                            </div>
                            <div>
                                <button>
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </li>
                    <li class="active"><a
                            href="${pageContext.request.contextPath}/">Trang Chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/gioithieu">Giới
                        Thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/donghonam">Sản
                        phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Liên
                        Hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
    </div>
    <div id="carouselExampleIndicators" class="carousel slide banner"
         data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0"
                class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <div class="carousel-caption banner-image" data-aos="fade-down">
                    <h4>Harley Davidson</h4>
                    <h1>Harley Davidson 48</h1>
                    <p class="d-none d-sm-block">Động cơ V-Twin biểu tượng được đổi mới với mô men xoắn thấp và tiếng
                        gầm sảng khoái. Đầu xe và xi lanh bằng nhôm nhẹ tăng cường hiệu quả giải nhiệt bằng gió.</p>
                </div>
                <img class="d-block w-100 banner-image" 48
                     src="../image/slide-bg-1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <div class="carousel-caption banner-image " data-aos="fade-down">
                    <h4>Kawasaki</h4>
                    <h1>NINJA ZX-10R ABS KRT EDITION</h1>
                    <p class="d-none d-sm-block">Khối lượng bản thân bao gồm tất cả các vật liệu cần thiết và chất lỏng
                        để vận hành một cách chính xác, bình chứa nhiên liệu (dung tích hơn 90%) và bộ dụng cụ (nếu được
                        cung cấp).</p>
                </div>
                <img class="d-block w-100" src="../image/slide-bg-2.jpg"
                     alt="Second slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators"
           role="button" data-slide="prev"> <span
                class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                class="sr-only">Previous</span>
        </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
                role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
    </a>
    </div>
</header>
<div class="container">
    <div class="row mt-5 d-flex justify-content-between">
        <div class="filler col-md-6 col-12" data-aos="fade-right">
            <div class="con">
                <div class="img-content mr-3">
                    <img src="../image/kawasaki.jpg" height="250px" width="100%">
                </div>
                <div class="text-inner">
                    <h3>Sức mạnh</h3>
                    <hr/>
                    <h2>Vượt trội</h2>
                </div>
            </div>
        </div>
        <div class="filler col-md-6 col-12 pt-3 pt-md-0" data-aos="fade-left">
            <div class="con">
                <div class="img-content">
                    <img src="../image/harleydavidson.jpg " height="250px" width="100%">
                </div>
                <div class="text-inner">
                    <h3>Xu hướng</h3>
                    <hr/>
                    <h2>Phong Cách</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="products">
        <div class="title clearfix">
            <h4 class="float-left">
                Mẫu xe nổi bật
            </h4>
            <div class="button-tran float-right">
                <button id="pre" type="button">
                    <i class="fas fa-chevron-left p-2"></i>
                </button>
                <button id="next">
                    <i class="fas fa-chevron-right p-2"></i>
                </button>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">Đã thêm sản phẩm vào giỏ hàng! Hãy
                        tiếp tục mua sắm nào
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="row items-container" data-aos="fade-up">
                <c:forEach var="product" items="${products}">

                    <div class="item col-3 col-sm-3 mt-5 pl-1 pr-1">

                        <div class="item-image">
                            <c:forEach var="productImages" end="0"
                                       items="${product.productImages}">
                                <img src="../file/upload/${productImages.title}" width="100%"
                                     height="300px"/>
                            </c:forEach>
                            <div class="bttn">
                                <button class="btn bttn-l" data-toggle="modal"
                                        data-target="#exampleModal"
                                        onclick="Cart.gioHang(${product.id},1);">Thêm vào giỏ
                                </button>
                                <a class="btn bttn-l"
                                   href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                    chi tiết</a>
                            </div>
                        </div>
                        <div class="item-title">
                            <a
                                    href="${pageContext.request.contextPath}/product-detail/${product.seo}">
                                <h5 class="text-decoration-none">${product.title}</h5> <c:if
                                    test="${product.priceSale != null}">
                                <div class="cost d-flex justify-content-center">
                                    <div class="pr-2 cost1">
                                        <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                          value="${product.priceSale}"/>
                                        đ
                                    </div>
                                    <div class="text-muted ">
                                        <s><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                             value="${product.price}"/> đ</s>
                                    </div>
                                    <div class="desc-sale">
                                        <span> -${product.percentSale}%</span>
                                    </div>
                                </div>
                            </c:if> <c:if test="${product.priceSale == null}">
                                <div class="cost cost1">
                                    <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                      value="${product.price}"/>
                                    đ
                                </div>
                            </c:if>
                            </a>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="container desc">
    <h4>Ưu đãi & Khuyến mãi </h4>
    <div class="row mt-5 d-flex justify-content-between">
        <div class="filler col-md-4 col-12" data-aos="zoom-in-up">
            <div class="con">
                <div class="img-content mr-3">
                    <img src="../image/uudai-1.jpg" height="250px" width="100%">
                </div>
                <div class="text-inner">
                    <h6>Ưu đãi đặc biệt </h6>
                    <hr/>
                </div>
            </div>
        </div>
        <div class="filler col-md-4 col-12 pt-3 pt-md-0"
             data-aos="zoom-in-up">
            <div class="con">
                <div class="img-content">
                    <img src="../image/uudai-2.jpg" height="250px" width="100%">
                </div>
                <div class="text-inner">
                    <h6>Hỗ trợ lệ phí trước bạ </h6>
                    <hr/>
                </div>
            </div>
        </div>
        <div class="filler col-md-4 col-12 pt-3 pt-md-0"
             data-aos="zoom-in-up">
            <div class="con">
                <div class="img-content">
                    <img src="../image/uudai-3.jpg" height="250px" width="100%">
                </div>
                <div class="text-inner">
                    <h6>Tặng ngay lệ phí trước bạ </h6>
                    <hr/>
                </div>
                5
            </div>
        </div>
    </div>
</div>

<nav class="container menu-tab">
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-home-tab"
           data-toggle="tab" href="#nav-home" role="tab"
           aria-controls="nav-home" aria-selected="true">Mẫu xe mới nhất</a>
        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
           href="#nav-profile" role="tab" aria-controls="nav-profile"
           aria-selected="false">Mẫu xe giảm giá </a>
    </div>
</nav>
<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active container" id="nav-home"
         role="tabpanel" aria-labelledby="nav-home-tab">

        <div class="row container-items">
            <c:forEach var="product" items="${products}" begin="0" end="5">
                <div class="item col-12 col-md-6 col-xl-3 p-2 m-0">

                    <div class="item-image">
                        <c:forEach var="productImages" end="0"
                                   items="${product.productImages}">
                            <img src="../file/upload/${productImages.title}" width="100%"
                                 height="300px"/>
                        </c:forEach>
                        <div class="bttn">
                            <button class="btn bttn-l" data-toggle="modal"
                                    data-target="#exampleModal"
                                    onclick="Cart.gioHang(${product.id},1);">Thêm vào giỏ
                            </button>
                            <a class="btn bttn-l"
                               href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                chi tiết</a>
                        </div>
                    </div>
                    <div class="item-title">
                        <a
                                href="${pageContext.request.contextPath}/product-detail/${product.seo}">
                            <h5 class="text-decoration-none">${product.title}</h5> <c:if
                                test="${product.priceSale != null}">
                            <div class="cost d-flex justify-content-center">
                                <div class="pr-2 cost1">
                                    <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                      value="${product.priceSale}"/>
                                    đ
                                </div>
                                <div class="text-muted ">
                                    <s><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                         value="${product.price}"/> đ</s>
                                </div>
                                <div class="desc-sale">
											<span> -${product.percentSale}%</span>
                                </div>
                            </div>
                        </c:if> <c:if test="${product.priceSale == null}">
                            <div class="cost cost1">
                                <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                  value="${product.price}"/>
                                đ
                            </div>
                        </c:if>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="tab-pane fade container" id="nav-profile" role="tabpanel"
         aria-labelledby="nav-profile-tab">

        <div class="row container-items">
            <c:forEach var="product" items="${productsSale}" begin="0" end="5">
                <div class="item col-3 p-2 m-0">
                    <div class="item-image">
                        <c:forEach var="productImages" end="0"
                                   items="${product.productImages}">
                            <img src="../file/upload/${productImages.title}" width="100%"
                                 height="300px"/>
                        </c:forEach>
                        <div class="bttn">
                            <button class="btn bttn-l" data-toggle="modal"
                                    data-target="#exampleModal"
                                    onclick="Cart.gioHang(${product.id},1);">Thêm vào giỏ
                            </button>
                            <a class="btn bttn-l"
                               href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                chi tiết</a>
                        </div>
                    </div>
                    <div class="item-title">
                        <a
                                href="${pageContext.request.contextPath}/product-detail/${product.seo}">
                            <h5 class="text-decoration-none">${product.title}</h5> <c:if
                                test="${product.priceSale != null}">
                            <div class="cost d-flex justify-content-center">
                                <div class="pr-2 cost1">
                                    <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                      value="${product.priceSale}"/>
                                    đ
                                </div>
                                <div class="text-muted ">
                                    <s><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                         value="${product.price}"/> đ</s>
                                </div>
                                <div class="desc-sale">
											<span> -${product.percentSale}%</span>
                                </div>
                            </div>
                        </c:if> <c:if test="${product.priceSale == null}">
                            <div class="cost cost1">
                                <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                  value="${product.price}"/>
                                đ
                            </div>
                        </c:if>
                        </a>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</div>
<div class="container infor">
    <div class="row mt-5 d-flex justify-content-between">
        <div class="filler col-md-4 col-12" data-aos="fade-right">
            <div class="con">
                <div class="img-content mr-3">
                    <img src="../image/tin-2.jpg" height="250px" width="100%">
                </div>
            </div>
            <div class="text-outer">
                <a href="https://thuongmotor.com/sieu-xe-ve-nha-chu-moi-le-ban-giao-xe-kawasaki-h2-tai-showroom-kawasaki-ha-noi.html">
                    <h5>SIÊU XE VỀ NHÀ CHỦ MỚI – LỄ BÀN GIAO XE KAWASAKI H2 TẠI SHOWROOM KAWASAKI HÀ NỘI</h5></a>
                <p>Helo anh em sao bao ngày chờ đợi thì hôm nay ngày 27/10/2021 chiếc Kawasaki H2 cacbon đã chính
                    thức
                    được trao tay...</p>
            </div>
        </div>
        <div class="filler col-md-4 col-12 pt-3 pt-md-0" data-aos="fade-up">
            <div class="con">
                <div class="img-content">
                    <img src="../image/tin-3.jpg " height="250px" width="100%">
                </div>

            </div>
            <div class="text-outer">
                <a href="https://thuongmotor.com/kawasaki-zx10r-2021-ai-se-la-nguoi-dau-tien-so-huu-voi-nhieu-uu-dai-hap-dan-tai-thuong-motor.html">
                    <h5>KAWASAKI ZX10R 2021 AI SẼ LÀ NGƯỜI ĐẦU TIÊN SỞ HỮU VỚI NHIỀU ƯU ĐÃI HẤP DẪN</h5></a>
                <p>Ninja ZX-10R 2021 có chiều dài 2.085 mm, rộng 745 mm và cao 1.145 mm. Chiều cao yên 835 mm, độ
                    dài cơ
                    sở...</p>
            </div>
        </div>
        <div class="filler col-md-4 col-12 pt-3 pt-md-0" data-aos="fade-left">
            <div class="con">
                <div class="img-content">
                    <img src="../image/tin-1.png" height="250px" width="100%">
                </div>
            </div>
            <div class="text-outer">
                <a href="https://thuongmotor.com/sieu-xe-ve-nha-chu-moi-le-ban-giao-xe-kawasaki-h2-tai-showroom-kawasaki-ha-noi.html">
                    <h5>VALENTINO ROSSI ĐƯỢC YAMAHA ƯU ÁI DÀNH RIÊNG PHIÊN BẢN ĐẶC BIỆT CỦA YAMAHA R1 GYTR VR46
                        2022</h5></a>
                <p>Yamaha R1 GYTR VR46 2022 phiên bản đặc biệt có 1 không 2 được nhà yamaha dành riêng cho tay đua
                    Valentino Rossi.</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</html>