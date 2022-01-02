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
					<li><a href="${pageContext.request.contextPath}/donghonam">Sản
							phẩm</a></li>
					<li><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
					<li><a href="${pageContext.request.contextPath}/contact">Liên
							Hệ</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container clearfix">
		<div class="title-left mt-5">
			<a href="${pageContext.request.contextPath}/">TRANG CHỦ</a><span
				class="m-3">/</span><a
				href="${pageContext.request.contextPath}/donghonam">Đồng hồ nam</a>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container">

		<div class="row mb-4 mt-5">
			<div class="col">

				<table class="table table-striped">
					<thead>
						<tr>
							<h3>Giỏ hàng của bạn</h3>
						</tr>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Đơn giá</th>
							<th>Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="${0}" />
						<c:forEach items="${GIO_HANG.sanPhamTrongGioHangs }" var="item"
							varStatus="loop">

							<tr>
								<th scope="row">${loop.index + 1}</th>
								<td>${item.tenSanPham }</td>
								<td><img src="../file/upload/${item.urlImage }"
									width="100px" height="150px"></td>
								<td><input style="width: 50px" type="number" min="1"
									value="${item.soluong }"
									onchange="Cart.updateGioHang(${item.maSanPham }, ${item.giaban }, this.value, ${total });">
								</td>
								<td id="${item.maSanPham }"><fmt:formatNumber type="number" maxIntegerDigits="13"
										value="${item.giaban}" /> đ</td>
								<td>
									<button class="btn btn-primary"
										onclick="location.href='${pageContext.request.contextPath}/hien-thi-san-pham-trong-gio-hang/${item.maSanPham}'">Xóa</button>
								</td>

							</tr>
							<c:set var="total" value="${total + item.soluong*item.giaban}" />
						</c:forEach>
						
						<tr class="text-right">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>Tổng tiền: </td>
							<td id="total"><fmt:formatNumber type="number" maxIntegerDigits="13"
										value="${total }" /> đ</td>
						</tr>
						
					</tbody>
				</table>

			</div>
		</div>



		<div class="row mb-4">
			<div class="col">


				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Thông tin
									người đặt hàng</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/luu_don_hang"
									method="post">
									<div class="form-group">
										<label for="name">Tên khách hàng:</label> <input type="text"
											class="form-control" id="name" name="name" required>
									</div>
									<div class="form-group">
										<label for="email">Địa chỉ email:</label> <input type="email"
											class="form-control" id="email" name="email" required>
									</div>
									<div class="form-group">
										<label for="phone">Điện thoại liên hệ:</label> <input
											type="text" class="form-control" id="phone" name="phone"
											required>
									</div>
									<div class="form-group">
										<label for="address">Địa chỉ giao hàng:</label> <input
											type="text" class="form-control" id="address" name="address"
											required>
									</div>

									<button type="submit" class="btn btn-warning float-right">Gửi
										đơn hàng</button>

								</form>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-primary float-right"
					data-toggle="modal" data-target="#exampleModal">Đặt hàng</button>
			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
	<script type="text/javascript">
	
	function handleChange(val) {
		alert();
		}
	
	</script>


</body>

</html>
