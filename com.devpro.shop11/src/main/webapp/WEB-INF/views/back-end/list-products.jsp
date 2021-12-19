<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
</head>
<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/views/back-end/common/header.jsp"></jsp:include>

    <!-- ========== Left Sidebar Start ========== -->
    <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
    <!-- Left Sidebar End -->

    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div
                                class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Danh sách sản phẩm</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a
                                            href="javascript: void(0);">Sản phẩm</a></li>
                                    <li class="breadcrumb-item active">Danh sách sản phẩm</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <div class="col-sm-4">
                                        <div class="search-box mr-2 mb-2 d-inline-block">
                                            <form method="get"
                                                  action="${pageContext.request.contextPath}/admin/list-products">
                                                <div class="position-relative" id="position-relative">
                                                    <input type="text" class="form-control"
                                                           placeholder="Search..." id="search" name="search">
                                                    <i class="bx bx-search-alt search-icon"></i>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>

                                <div class="table-responsive">
                                    ${message}
                                    <table class="table table-centered table-nowrap">
                                        <thead class="thead-light">
                                        <tr>

                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Ngày tạo</th>
                                            <th>Ngày sửa gần nhất</th>
                                            <th>Giá</th>
                                            <th>Giá sale</th>
                                            <th>Trạng thái</th>
                                            <th>Sửa/ Xóa</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td><a href="javascript: void(0);"
                                                       class="text-body font-weight-bold">${product.id }</a></td>
                                                <td><span id="title">${product.title}</span></td>
                                                <fmt:parseDate value="${product.createdDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='startFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${startFormat}</td>
                                                <fmt:parseDate value="${product.updatedDate}" type="date"
                                                               pattern="yyyy-MM-dd" var="parsedDate"/>
                                                <fmt:formatDate value="${parsedDate}" var='updateFormat' type='date'
                                                                pattern='dd-MM-yyyy'/>
                                                <td>${updateFormat}</td>
                                                <fmt:setLocale value="vi_VN"/>
                                                <td><span><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/></span></td>
                                                <td><span><fmt:formatNumber value="${product.priceSale}" type="currency" currencySymbol="đ"/></span></td>
                                                <td><c:if test="${product.status == 0 }">
																<span
                                                                        class="badge badge-pill badge-soft-danger font-size-12"><c:out
                                                                        value="Sản phẩm nghỉ bán"/></span>
                                                </c:if> <c:if test="${product.status == 1 }">
																<span
                                                                        class="badge badge-pill badge-soft-primary font-size-12"><c:out
                                                                        value="Sản phẩm đang bán"/></span>
                                                </c:if></td>
                                                <td><a
                                                        href="${pageContext.request.contextPath}/admin/update-product/${product.id}"
                                                        class="mr-3 text-primary" data-toggle="tooltip"
                                                        data-placement="top" title="" data-original-title="Sửa"><i
                                                        class="mdi mdi-pencil font-size-18"></i></a>
                                                    <a onclick="Product.deleteProduct(${product.id});"
                                                       class="text-danger" data-original-title="Xóa"><i
                                                            class="mdi mdi-close font-size-18"></i>
                                                    </a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <ul
                                        class="pagination pagination-rounded justify-content-end mb-2">
                                    <li class="page-item disabled"><a class="page-link"
                                                                      href="javascript: void(0);" aria-label="Previous">
                                        <i
                                                class="mdi mdi-chevron-left"></i>
                                    </a></li>
                                    <li class="page-item active"><a class="page-link"
                                                                    href="javascript: void(0);">1</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">2</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">3</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">4</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);">5</a></li>
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript: void(0);" aria-label="Next"> <i
                                            class="mdi mdi-chevron-right"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script>
                        © Mona.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-right d-none d-sm-block">Design &
                            Develop by TuanAnh
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/back-end/common/footer.jsp"></jsp:include>
    <!-- Footer End-->

</div>
<!-- END layout-wrapper -->


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
<script type="text/javascript">
    document.getElementById('search').onkeypress = function (e) {
        if (e.keyCode == 13) {
            document.getElementById('search').click();
        }
    }
</script>
</body>
</html>