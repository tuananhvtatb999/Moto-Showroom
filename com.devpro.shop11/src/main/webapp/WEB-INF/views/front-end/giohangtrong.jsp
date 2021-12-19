<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Homepage - Start Bootstrap Template</title>

<jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation -->
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
	<div class="container text-center clearfix">
		<img alt="#" src="../image/empty-cart.png">
		<div class="mt-5"><button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/donghonam'">Tiếp tục mua hàng</button></div>
	</div>
	<!-- /.container -->

	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>


</body>

</html>
