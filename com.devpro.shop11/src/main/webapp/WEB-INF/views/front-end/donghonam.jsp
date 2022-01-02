<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Moto Best </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template"
          name="description">
    <meta content="Themesbrand" name="author">
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
    <style>
        .desc-sale {
            position: absolute;
            top: 0;
            background: url(../image/icosale.png);
            width: 50px;
            height: 50px;
        }

        .cost1 {
            font-size: 16px;
            font-weight: bold;
        }

        .cost-sale {
            font-size: 14px;
        }

        .desc-sale span {
            transform: rotate(45deg);
            position: absolute;
            top: 5px;
            right: 0px;
            color: white;
        }

        .item a:hover {
            text-decoration: none;
            color: #FF6633;
        }

        .item-title h6 {
            margin-top: 10px;
            font-size: 16px;
            min-height: 50px;
            color: #5c5c5c;
        }

        .item .item-title h6:hover, h5:hover {
            color: #FF6633;
        }

        .page-item.first, .page-item.last {
            display: none;
        }

        .pagesss {
            float: right;
        }

        .item .item-title {
            padding-bottom: 20px;
            padding-top: 20px;
            text-transform: uppercase;
            color: black;
            text-transform: uppercase;
            min-height: 100px;
        }

        .list-group a {
            text-transform: uppercase;
            font-weight: bold;
            font-size: 18px;
        }

        .xt-ct-menu {
            position: relative;
            display: inline-block;
        }

        .xtlab-ctmenu-item {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            font-size: 20px;
            border: none;
            cursor: pointer;
            margin-right: 15px;
        }

        .xtlab-ctmenu-item:hover, .xtlab-ctmenu-item:focus {
            background-color: #4CAF50;
        }

        .btn-loc {
            padding: 10px;
            font-size: 20px;
        }
    </style>
</head>


<body data-sidebar="dark">
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
<!-- Begin page -->
<div id="layout-wrapper">

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
                    <li><a href="${pageContext.request.contextPath}/">Trang
                        Chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/gioithieu">Giới
                        Thiệu</a></li>
                    <li class="active"><a
                            href="${pageContext.request.contextPath}/donghonam">Sản phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Liên
                        Hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="page-title pt-5">
        <div class="title-left">
            <a href="${pageContext.request.contextPath}/">TRANG CHỦ</a><span
                class="m-3">/</span><a
                href="${pageContext.request.contextPath}/donghonam">Sản phẩm</a>
        </div>
        <div class="d-block d-lg-none btn-show">
            <button id="show-category">
                <i class="fas fa-bars"></i>
            </button>
        </div>
        <button id="close-nav" class="d-block d-lg-none">
            <i class="fas fa-times"></i>
        </button>
    </div>
</div>
<div class="container mt-3">
    <div class="">
        <div class="nav-pro">
            <div class="category">
                <!-- 					<b>THƯƠNG HIỆU</b> -->
                <ul class="list-group">
                    <c:forEach var="brand" items="${brands }">
                        <li><a
                                href="${pageContext.request.contextPath}/brand/${brand.seo}"
                                class="list-group-item ${currentSeo==brand.seo ? 'active' : '' }">${brand.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</div>
<div class="container">
    <div class="xt-ct-menu">
        <select class="xtlab-ctmenu-item" id="gia">
            <option value="" selected disabled hidden>Khoảng giá</option>
            <option value="69">Dưới 70 triệu</option>
            <option value="70">70 triệu - 100 triệu</option>
            <option value="100">100 triệu - 150 triệu</option>
            <option value="150">Trên 150 triệu</option>
        </select>
    </div>

    <div class="xt-ct-menu">
        <select class="xtlab-ctmenu-item" id="dungtich">
            <option value="" selected disabled hidden>Dung tích</option>
            <option value="100">100 cc</option>
            <option value="125">125 cc</option>
            <option value="150">150 cc</option>
            <option value="200">200 cc</option>
        </select>
    </div>
    <button type="button" onclick="Product.filterProduct();" class="btn btn-info float-right" style="font-size: 20px; height: 50px">Lọc</button>

</div>
<div class="container">
    <hr/>

    ${message }
</div>
<div class="container-fluid">
    <div class="container">
        <div class="col-12 p-0 list-pro">
            <div class="row">
                <c:forEach var="product" items="${products}">

                    <div class="item col-12 col-md-6 col-xl-3 mt-3">
                        <div class="item-image">
                            <c:forEach var="productImages" end="0"
                                       items="${product.productImages}">
                                <img src="../file/upload/${productImages.title}" width="100%"
                                     height="300px"/>
                            </c:forEach>
                            <div class="bttn">
                                <button class="btn bttn-l" data-toggle="modal"
                                        data-target="#exampleModal"
                                        onclick="Cart.gioHang(${product.id},1);">Mua hàng
                                </button>
                                <a class="btn bttn-l"
                                   href="${pageContext.request.contextPath}/product-detail/${product.seo}">Xem
                                    chi tiết</a>
                            </div>
                        </div>

                        <div class="item-title">
                            <a
                                    href="${pageContext.request.contextPath}/product-detail/${product.seo}">
                                <h6 class="text-decoration-none">${product.title}</h6> <c:if
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
												<span> -${product.percentSale}%
												</span>
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
            <nav aria-label="Page navigation" class="mt-3">
                <ul class="pagination pagesss" id="pagination"></ul>
            </nav>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
<!-- Footer End-->

<!-- END layout-wrapper -->


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: ${pagesss+1},
            visiblePages: 3,
            startPage: ${currentPage},
            onPageClick: function (event, page) {
                console.info(page + ' (from options)');
            }
        }).on('page', function (event, page) {
            window.location.href = "${pageContext.request.contextPath}/donghonam?page=" + page;
        });
    });

</script>

<!-- Load Facebook SDK for JavaScript -->

</body>
</html>