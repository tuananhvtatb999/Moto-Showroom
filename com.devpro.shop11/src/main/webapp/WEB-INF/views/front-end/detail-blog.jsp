<%--
  Created by IntelliJ IDEA.
  User: TuanAnh
  Date: 12/18/2021
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Blog</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Themesbrand" name="author">
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"/>
</head>

<body>
<!-- Begin page -->
<div id="layout-wrapper">

    <jsp:include page="/WEB-INF/views/front-end/common/header.jsp"/>

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
                    <li><a href="${pageContext.request.contextPath}/">Trang Chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/gioithieu">Giới Thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/donghonam">Sản phẩm</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Liên Hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container">${blog.content}</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"/>
<!-- Footer End-->

<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"/>
</body>
</html>
