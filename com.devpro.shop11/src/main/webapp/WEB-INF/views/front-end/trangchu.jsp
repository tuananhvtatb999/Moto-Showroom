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
                                <input type="text" placeholder="T??m ki???m...">
                            </div>
                            <div>
                                <button>
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </li>
                    <li class="active"><a
                            href="${pageContext.request.contextPath}/">Trang Ch???</a></li>
                    <li><a href="${pageContext.request.contextPath}/gioithieu">Gi???i
                        Thi???u</a></li>
                    <li><a href="${pageContext.request.contextPath}/donghonam">S???n
                        ph???m</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Li??n
                        H???</a></li>
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
                    <h2>Harley Davidson</h2>
                    <h1>Harley Davidson 48</h1>
                    <p class="d-none d-sm-block">?????ng c?? V-Twin bi???u t?????ng ???????c ?????i m???i v???i m?? men xo???n th???p v?? ti???ng
                        g???m s???ng kho??i. ?????u xe v?? xi lanh b???ng nh??m nh??? t??ng c?????ng hi???u qu??? gi???i nhi???t b???ng gi??.</p>
                </div>
                <img class="d-block w-100 banner-image" 48
                     src="../image/slide-bg-1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <div class="carousel-caption banner-image " data-aos="fade-down">
                    <h2>Kawasaki</h2>
                    <h1>NINJA ZX-10R ABS KRT EDITION</h1>
                    <p class="d-none d-sm-block">Kh???i l?????ng b???n th??n bao g???m t???t c??? c??c v???t li???u c???n thi???t v?? ch???t l???ng
                        ????? v???n h??nh m???t c??ch ch??nh x??c, b??nh ch???a nhi??n li???u (dung t??ch h??n 90%) v?? b??? d???ng c??? (n???u ???????c
                        cung c???p).</p>
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
<%--<div class="container">--%>
<%--    <div class="row mt-5 d-flex justify-content-between">--%>
<%--        <div class="filler col-md-6 col-12" data-aos="fade-right">--%>
<%--            <div class="con">--%>
<%--                <div class="img-content mr-3">--%>
<%--                    <img src="../image/kawasaki.jpg" height="250px" width="100%">--%>
<%--                </div>--%>
<%--                <div class="text-inner">--%>
<%--                    <h3>S???c m???nh</h3>--%>
<%--                    <hr/>--%>
<%--                    <h2>V?????t tr???i</h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="filler col-md-6 col-12 pt-3 pt-md-0" data-aos="fade-left">--%>
<%--            <div class="con">--%>
<%--                <div class="img-content">--%>
<%--                    <img src="../image/harleydavidson.jpg " height="250px" width="100%">--%>
<%--                </div>--%>
<%--                <div class="text-inner">--%>
<%--                    <h3>Xu h?????ng</h3>--%>
<%--                    <hr/>--%>
<%--                    <h2>Phong C??ch</h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="container">
    <div class="products">
        <div class="title clearfix">
            <h4 class="float-left">
                M???u xe n???i b???t
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
                        <h5 class="modal-title" id="exampleModalLabel">Th??ng b??o</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">???? th??m s???n ph???m v??o gi??? h??ng! H??y
                        ti???p t???c mua s???m n??o
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
                                        onclick="Cart.gioHang(${product.id},1);">Th??m v??o gi???
                                </button>
                                <a class="btn bttn-l"
                                   href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                    chi ti???t</a>
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
                                        ??
                                    </div>
                                    <div class="text-muted ">
                                        <s><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                             value="${product.price}"/> ??</s>
                                    </div>
                                    <div class="desc-sale">
                                        <span> -${product.percentSale}%</span>
                                    </div>
                                </div>
                            </c:if> <c:if test="${product.priceSale == null}">
                                <div class="cost cost1">
                                    <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                      value="${product.price}"/>
                                    ??
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
    <h4>??u ????i & Khuy???n m??i </h4>
    <div class="row mt-5 d-flex justify-content-between">
        <div class="filler col-md-4 col-12" data-aos="zoom-in-up">
            <div class="con">
                <div class="img-content mr-3">
                    <img src="../image/uudai-1.jpg" height="250px" width="100%">
                </div>
                <div class="text-inner">
                    <h6>??u ????i ?????c bi???t </h6>
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
                    <h6>H??? tr??? l??? ph?? tr?????c b??? </h6>
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
                    <h6>T???ng ngay l??? ph?? tr?????c b??? </h6>
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
           aria-controls="nav-home" aria-selected="true">M???u xe m???i nh???t</a>
        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
           href="#nav-profile" role="tab" aria-controls="nav-profile"
           aria-selected="false">M???u xe gi???m gi?? </a>
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
                                    onclick="Cart.gioHang(${product.id},1);">Th??m v??o gi???
                            </button>
                            <a class="btn bttn-l"
                               href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                chi ti???t</a>
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
                                    ??
                                </div>
                                <div class="text-muted ">
                                    <s><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                         value="${product.price}"/> ??</s>
                                </div>
                                <div class="desc-sale">
											<span> -${product.percentSale}%</span>
                                </div>
                            </div>
                        </c:if> <c:if test="${product.priceSale == null}">
                            <div class="cost cost1">
                                <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                  value="${product.price}"/>
                                ??
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
                                    onclick="Cart.gioHang(${product.id},1);">Th??m v??o gi???
                            </button>
                            <a class="btn bttn-l"
                               href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                chi ti???t</a>
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
                                    ??
                                </div>
                                <div class="text-muted ">
                                    <s><fmt:formatNumber type="number" maxIntegerDigits="13"
                                                         value="${product.price}"/> ??</s>
                                </div>
                                <div class="desc-sale">
											<span> -${product.percentSale}%</span>
                                </div>
                            </div>
                        </c:if> <c:if test="${product.priceSale == null}">
                            <div class="cost cost1">
                                <fmt:formatNumber type="number" maxIntegerDigits="13"
                                                  value="${product.price}"/>
                                ??
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
                    <h5>SI??U XE V??? NH?? CH??? M???I ??? L??? B??N GIAO XE KAWASAKI H2 T???I SHOWROOM KAWASAKI H?? N???I</h5></a>
                <p>Helo anh em sao bao ng??y ch??? ?????i th?? h??m nay ng??y 27/10/2021 chi???c Kawasaki H2 cacbon ???? ch??nh
                    th???c
                    ???????c trao tay...</p>
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
                    <h5>KAWASAKI ZX10R 2021 AI S??? L?? NG?????I ?????U TI??N S??? H???U V???I NHI???U ??U ????I H???P D???N</h5></a>
                <p>Ninja ZX-10R 2021 c?? chi???u d??i 2.085 mm, r???ng 745 mm v?? cao 1.145 mm. Chi???u cao y??n 835 mm, ?????
                    d??i c??
                    s???...</p>
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
                    <h5>VALENTINO ROSSI ???????C YAMAHA ??U ??I D??NH RI??NG PHI??N B???N ?????C BI???T C???A YAMAHA R1 GYTR VR46
                        2022</h5></a>
                <p>Yamaha R1 GYTR VR46 2022 phi??n b???n ?????c bi???t c?? 1 kh??ng 2 ???????c nh?? yamaha d??nh ri??ng cho tay ??ua
                    Valentino Rossi.</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</html>