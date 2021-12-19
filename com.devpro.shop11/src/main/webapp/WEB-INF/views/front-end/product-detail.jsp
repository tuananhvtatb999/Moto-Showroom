<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<meta charset="utf-8">
<title>Chi tiết sản phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description">
<meta content="Themesbrand" name="author">
<jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.css" />
</head>
<style>
.page-content {
	padding-top: 20px;
}

.product-detai-imgs {
	width: 450px;
}

product-detai-imgs ul {
	list-style: none outside none;
	padding-left: 0;
	margin-bottom: 0;
}

product-detai-imgs li {
	display: block;
	float: left;
	margin-right: 6px;
	cursor: pointer;
	border: 1px solid #ccc;
}

.lslide img {
	border: 1px solid #ccc;
	border-radius: 10%;
}

product-detai-imgs img {
	display: block;
	height: auto;
	max-width: 100%;
	margin-right: 5px;
}

.lSPager img {
	border: 1px solid #ccc;
	border-radius: 20%;
}

.detailss, .des {
	font-size: 16px;
}

.price .s {
	font-size: 20px;
}

.desss {
	text-align: center;
	font-size: 32px;
	font-weight: bold;
	padding: 50px 0 50px 0;
	color: red;
}

.lSSlideOuter .lSPager.lSGallery img {
    height:100px;
}
</style>
<body>
	<!-- Begin page -->



	<!-- ========== Left Sidebar Start ========== -->

	<!-- Left Sidebar End -->
	<!-- ============================================================== -->
	<!-- Start right Content here -->
	<!-- ============================================================== -->
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
					<li><a href="${pageContext.request.contextPath}/donghonam">Sản phẩm</a></li>
					<li><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
					<li><a href="${pageContext.request.contextPath}/contact">Liên
							Hệ</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<c:forEach var="product" items="${products }">
			<div class="title-left mt-5">
				<a href="${pageContext.request.contextPath}/">TRANG CHỦ</a><span
					class="m-3">/</span><a
					href="${pageContext.request.contextPath}/donghonam">Thông số kĩ thuật</a>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-xl-6">

					<div class="product-detai-imgs mt-5">

						<ul class="image-products" id="lightSlider">
							<c:forEach var="img" items="${product.productImages }">
								<li data-thumb="../file/upload/${img.title }"><img
									src="../file/upload/${img.title }" width="100%" height="450px">
								</li>
							</c:forEach>
						</ul>
					</div>

				</div>

				<div class="col-xl-6">
					<div class="mt-4 mt-xl-3">
						<h1 class="mt-1 mb-3">${product.title }</h1>

						<div class="text-muted float-left mr-3 ">
							<span class="bx bx-star text-warning"></span> <span
								class="bx bx-star text-warning"></span> <span
								class="bx bx-star text-warning"></span> <span
								class="bx bx-star text-warning"></span> <span class="bx bx-star"></span>
						</div>
						<p class="text-muted mb-3">( 152 Customers Review )</p>
						<c:if test="${product.priceSale != null }">
							<h6 class="text-success text-uppercase">
								Đang giảm giá : ${product.percentSale}%
							</h6>
						</c:if>
						<c:if test="${product.priceSale == null}">
							<h5 class="mb-4 price">
								Giá : <span class="s text-danger mr-2">${product.price}</span>
							</h5>
						</c:if>
						<c:if test="${product.priceSale != null }">
							<h5 class="mb-4 price">
								Giá : <span class="mr-2 s "><del class="">${product.price}</del></span>
								<b class="text-danger s">${product.priceSale}</b>
							</h5>
						</c:if>
						<p class="des text-muted mb-4">${product.shortDes}</p>
						<div class="row mb-3 detailss">
							<div class="col-md-6">
								<div>
									<p class="text-muted">
										<i class="fas fa-trademark mr-2"></i> Thương hiệu : <a
											href="#" class="text-primary">${product.brand.name }</a>
									</p>
									<p class="text-muted">
										<i class="fab fa-product-hunt mr-2"></i> Xuất xứ :
										${product.procedurePro }
									</p>
									<p class="text-muted">
										<i class="fas fa-handshake mr-2"></i> Hộp số :
										${product.waranty } cấp
									</p>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<p class="text-muted">
										<i class="fas fa-tint-slash mr-2"></i> Hệ thống phanh ABS :
										${product.waterproof }
									</p>
									<p class="text-muted">
										<i class="far fa-window-maximize mr-2"></i> Dung tích :
										${product.sizeSuf } cm3
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="text-center">
						<button type="button"
							class="btn btn-primary waves-effect waves-light mt-2 mr-1"
							data-target="#exampleModal" data-toggle="modal"
							onclick="Cart.gioHang(${product.id},1);">
							<i class="bx bx-cart mr-2"></i> Thêm vào giỏ
						</button>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">Tiếp tục mua hàng?</div>
									<div class="modal-footer">

										<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/donghonam'">Tiếp tục</button>
										<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/hien-thi-san-pham-trong-gio-hang'"
											data-dismiss="modal">Vào giỏ hàng</button>
									</div>
								</div>
							</div>
						</div>
						<a href="tel:+84386950395"
							class="btn btn-success waves-effect  mt-2 waves-light">
							<i class="fas fa-phone-alt"></i>Tư vấn
						</a>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>
	<div class="desss">Giới thiệu sản phẩm</div>
	<c:forEach var="pro" items="${products }">
		<div class="container">${pro.shortDetails }</div>
	</c:forEach>
	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>

	<!-- END layout-wrapper -->



	<!-- Right bar overlay-->
	<div class="rightbar-overlay"></div>
	<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function() {
			// MDB Lightbox Init
			$(function() {
				$("#mdb-lightbox-ui").load("mdb-addons/mdb-lightbox-ui.html");
			});
		});
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#lightSlider").lightSlider({
				gallery : true,
				item : 1,
				auto : true,
				loop : true,
				slideMargin : 0,
				thumbItem : 5
			});
		});
	</script>
</body>
</html>