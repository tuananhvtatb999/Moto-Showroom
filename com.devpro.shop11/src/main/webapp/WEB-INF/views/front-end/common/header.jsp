<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

		<div class="container-fluid bg-black d-none d-md-block " >
			<div class="container">
				<div class="header clearfix">
					<div class="header_left d-flex float-left">
						<div class="location">
							<i class="fas fa-map-marker-alt"></i>
							Số 7 Thiền Quang, Nguyễn Du, Hai Bà Trưng, Hà Nội
						</div>
						<div class="phone">
							<a href="tel:+84386950395" class="text-white" style="text-decoration: none"><i class="fas fa-phone-alt"></i>
							0386950395</a>
						</div>
					</div>
					<%-- <div class="header_right d-flex float-right ">
						<a href="${pageContext.request.contextPath}/dangnhap">Đăng nhập</a>
						<a href="${pageContext.request.contextPath}/dangki">Đăng kí</a>
					</div> --%>
				</div>
			</div>
			<div class="container d-flex justify-content-between align-items-center ">
				<div class="logo ml-5">
					<img src="../image/logo.png" width="100%" height="100px" alt="">
				</div>
				<div class="search d-flex">
					<div>
						<form action="${pageContext.request.contextPath}/donghonam" method="post">
							<input id="search" name="search-product" type="text" placeholder="Tìm kiếm..." required="required">
						</form>
					</div>
					<%-- <div>
						<button onchange="Product.search(<% request.getParameter("search-product"); %>)"><i class="fas fa-search" ></i></button>
					</div> --%>
				</div>
				<a class="nav-link btn" href="${pageContext.request.contextPath}/hien-thi-san-pham-trong-gio-hang">
				<div class="cart">
					<i class="fas fa-shopping-cart"></i>
					<div class="number-cart text-light" id="thong_tin_gio_hang">${SL_SP_GIO_HANG }</div>
				</div>
				</a>
			</div>
			<div class="container-fluid bg-black-menu" id="menuNav">
			<div class="d-md-none d-flex">
				<button id="show-menu-mobi">
					<i class="fas fa-list"></i>
				</button>
				<img src="../image/logo.png" width="100%" height="100px">
				<div class="cart pt-4">
					<i class="fas fa-shopping-cart"></i>
				</div>
			</div>
		</div>
		</div>
		