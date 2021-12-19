<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<html>
<head>

    <meta charset="utf-8">
    <title>Giới thiệu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta content="Themesbrand" name="author">
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
</head>

<body>

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
                <li class="active"><a
                        href="${pageContext.request.contextPath}/gioithieu">Giới Thiệu</a></li>
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
<div class="container">
    <div class="row mt-5">
        <div class="col-12 col-md-6" data-aos="fade-right">
            <img src="../image/gioithieu-bg.jpg" width="100%" height="450px">
        </div>
        <div class="col-12 col-md-6 pt-5 content-about" data-aos="fade-left">
            <h2>Giới thiệu về Moto Best</h2>
            <p>“Động cơ trên các xe moto (xe thể thao) cho thấy khả năng tăng tốc ấn tượng và cảm giác lái đầy uy
                lực trên nhiều dải vận tốc. Bên cạnh thiết kế nổi bật mang đậm nết thể thao, các dòng xe moto của hãng
                còn được trang bị phanh ABS, phuộc Upside down giúp xe lướt êm trên mọi địa hình, van biến thiên VVA cho
                cảm giác tăng tốc mượt mà và khung thép dạng kim cương giúp trọng lượng nhẹ hơn trong khi vẫn giữ được
                độ cứng hoàn hảo.”</p>
        </div>
    </div>
</div>
<div class="container">
    <div class="row about-service">
        <div class="col-12 col-sm-6 col-md-4 d-flex" data-aos="fade-left">
            <i class="fas fa-star-and-crescent"></i>
            <div class="title">
                <h3>Hàng chính hãng</h3>
                <p>Có phải anh em yêu thích xe mô tô phân khối lớn thường có nhu cầu: Bảo dưỡng máy và thay thế linh
                    kiện định kỳ cho xế yêu</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4 d-flex" data-aos="fade-left">
            <i class="fas fa-child"></i>
            <div class="title">
                <h3>Sản phẩm mới 100%</h3>
                <p>Có phải anh em yêu thích xe mô tô phân khối lớn thường có nhu cầu: Bảo dưỡng máy và thay thế linh
                    kiện định kỳ cho xế yêu</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4 d-flex" data-aos="fade-left">
            <i class="fas fa-hand-holding-medical"></i>
            <div class="title">
                <h3>BH 12 tháng</h3>
                <p>Có phải anh em yêu thích xe mô tô phân khối lớn thường có nhu cầu: Bảo dưỡng máy và thay thế linh
                    kiện định kỳ cho xế yêu</p>
            </div>
        </div>
        <div class="col-12 col-6 col-md-4 d-flex " data-aos="fade-left">
            <i class="fas fa-history"></i>
            <div class="title">
                <h3>Đổi trả trong vòng 7 ngày</h3>
                <p>Có phải anh em yêu thích xe mô tô phân khối lớn thường có nhu cầu: Bảo dưỡng máy và thay thế linh
                    kiện định kỳ cho xế yêu</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4 d-flex " data-aos="fade-left">
            <i class="fas fa-shipping-fast"></i>
            <div class="title">
                <h3>Miễn phí giao hàng</h3>
                <p>Có phải anh em yêu thích xe mô tô phân khối lớn thường có nhu cầu: Bảo dưỡng máy và thay thế linh
                    kiện định kỳ cho xế yêu</p>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4 d-flex " data-aos="fade-left">
            <i class="fas fa-hand-holding-usd"></i>
            <div class="title">
                <h3>Giá cả hợp lí</h3>
                <p>Có phải anh em yêu thích xe mô tô phân khối lớn thường có nhu cầu: Bảo dưỡng máy và thay thế linh
                    kiện định kỳ cho xế yêu</p>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-5 p-0">
    <div class="banner-des d-flex align-items-center">
        <div class="container">
            <div class="row text-center">
                <div class="col-6 col-sm-3">
                    <div class="banner-content">
                        <div>
                            <h2 class="num">12099</h2>
                        </div>
                        <p>Sản phẩm</p>
                    </div>
                </div>
                <div class="col-6 col-sm-3">
                    <div class="banner-content">
                        <div>
                            <h2 class="num">12</h2>
                        </div>
                        <p>Giải thưởng</p>
                    </div>
                </div>
                <div class="col-6 col-sm-3">
                    <div class="banner-content">
                        <div>
                            <h2 class="num">120589</h2>
                        </div>
                        <p>Khách hàng hài lòng</p>
                    </div>
                </div>
                <div class="col-6 col-sm-3">
                    <div class="banner-content">
                        <div>
                            <h2 class="num">2525</h2>
                        </div>
                        <p>Cửa hàng chi nhánh</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row about-service">
        <div class="col-12 col-sm-6 col-md-4 " data-aos="zoom-in-up">
            <div class="image">
                <img src="../image/model.jpg" width="30%" height="100">
            </div>
            <div class="title2">
                <p>Showroom tận tình chăm sóc khách hàng.</p>
                <h3>Tuấn Anh - CEO ASoft</h3>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4 " data-aos="zoom-in-up">
            <div class="image">
                <img src="../image/model.jpg" width="30%" height="100">
            </div>
            <div class="title2">
                <p>Thật tuyệt vời khi tin tưởng showroom.</p>
                <h3>Tuấn Anh - CEO ASoft</h3>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-4" data-aos="zoom-in-up">
            <div class="image">
                <img src="../image/model.jpg" width="30%" height="100">
            </div>
            <div class="title2">
                <p>Định kì bảo dưỡng thật tốt!</p>
                <h3>Tuấn Anh - CEO ASoft</h3>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
<script type="text/javascript">
    $(".num").counterUp({
        delay: 10,
        time: 1000
    });
</script>
</body>
</html>