<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>

    <meta charset="utf-8">
    <title>Blogs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Themesbrand" name="author">
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"/>
</head>
<style>
    .text-outer{
        color: #0b0b0b;
    }
    .title-blog {
        margin-top: 50px;
        margin-left: 15px;
        margin-right: 15px;
        border-bottom: 1px solid #70c248;
    }

    .title-blog span {
        position: relative;
        display: inline-block;
        background: #69be28;
        color: #fff;
        text-transform: uppercase;
        padding: 11px 20px;
        font-size: 20px;
    }

    .title-blog span::after {
        content: "";
        width: 0;
        position: absolute;
        left: 100%;
        top: 0;
        height: 0;
        border-style: solid;
        border-width: 53px 0 0 48px;
        border-color: transparent transparent transparent #70c248;
    }

    .blog-s {
        font-size: 16px;
    }

    .blog-s img {
        height: 100%;
    }

    .blog-s ul {
        list-style-type: none;
        padding-top: 20px;
        border-bottom: 1px solid #ccc;
        align-items: center;
    }

    .blog-s ul:nth-last-child(1) {
        border: none;
    }

    .blog-s a {
        overflow: hidden;
        display: block;
    }

    .blog-s a:hover {
        text-decoration: none;
        color: #f0a152;
    }

    .con-blogs {
        margin-top: 20px;
        border: 1px solid #ccc;
    }
</style>
<body data-sidebar="dark">

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
                                <input type="text" placeholder="T??m ki???m...">
                            </div>
                            <div>
                                <button>
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/">Trang Ch???</a></li>
                    <li><a href="${pageContext.request.contextPath}/gioithieu">Gi???i Thi???u</a></li>
                    <li><a href="${pageContext.request.contextPath}/donghonam">S???n ph???m</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/blog">Blogs</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Li??n H???</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid blog-s">

    <div class="container">
        <div class="title-blog">
            <span>Blogs</span>
        </div>
        <div class="row">
            <%--                    <div class="col-md-3 -col-12">--%>
            <%--                        <h4>B??i vi???t m???i</h4>--%>
            <%--                        <div class="con-blogs">--%>
            <%--                            --%>
            <%--                            <div>--%>
            <%--                                <ul class="d-flex">--%>
            <%--                                    <img src="../image/product-01.png " width="50px">--%>
            <%--                                    <li><a href="#">Chi???c ?????ng h??? c???a nh???ng CEO quy???n l???c nh???t th??? gi???i</a></li>--%>
            <%--                                </ul>--%>
            <%--                            </div>--%>
            <%--                            <div>--%>
            <%--                                <ul class="d-flex">--%>
            <%--                                    <img src="../image/product-01.png " width="50px">--%>
            <%--                                    <li><a href="#">12 chi???c ?????ng h??? d??nh cho n??? gi???i ?????t gi?? nh???t m???i th???i ?????i</a></li>--%>
            <%--                                </ul>--%>
            <%--                            </div>--%>
            <%--                            <div>--%>
            <%--                                <ul class="d-flex">--%>
            <%--                                    <img src="../image/product-01.png " width="50px">--%>
            <%--                                    <li><a href="#">10 th????ng hi???u ?????ng h??? cao c???p h??ng ?????u m???i qu?? ??ng ?????u quan t??m, Rolex x???p h???ng s??? 3</a></li>--%>
            <%--                                </ul>--%>
            <%--                            </div>--%>
            <%--                            <div>--%>
            <%--                                <ul class="d-flex">--%>
            <%--                                    <img src="../image/product-01.png " width="50px">--%>
            <%--                                    <li><a href="#">Chi???c ?????ng h??? c???a nh???ng CEO quy???n l???c nh???t th??? gi???i</a></li>--%>
            <%--                                </ul>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>

        </div>
        <div class="col-12 container infor">
            <div class="row mt-2">
                <c:forEach var="blog" items="${blogs}">
                    <div class="filler col-md-4 col-12" data-aos="fade-right">
                        <a href="${pageContext.request.contextPath}/blogs/detail/${blog.id}">
                            <div class="con">
                                <div class="img-content mr-3">
                                    <img src="../file/upload/${blog.image}" height="250px" width="100%">
                                </div>
                            </div>
                            <div class="text-outer">
                                <h5>${blog.title}</h5>
                                <p>${blog.description}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <div class="filler col-md-4 col-12 pt-3 pt-md-0" data-aos="fade-up">
                    <div class="con">
                        <div class="img-content">
                            <img src="../image/thoi-thuong.png " height="250px" width="100%">
                        </div>

                    </div>
                    <div class="text-outer">
                        <h5>12 chi???c ?????ng h??? d??nh cho n??? gi???i ?????t gi?? nh???t m???i th???i ?????i</h5>
                        <p>C??ng nghi???p s???n xu???t ?????ng h??? sang tr???ng c?? d???u hi???u ch???ng l???i trong hai ...</p>
                    </div>
                </div>
                <div class="filler col-md-4 col-12 pt-3 pt-md-0" data-aos="fade-left">
                    <div class="con">
                        <div class="img-content">
                            <img src="../image/quyen-ru.png" height="250px" width="100%">
                        </div>
                    </div>
                    <div class="text-outer">
                        <h5>10 th????ng hi???u ?????ng h??? cao c???p h??ng ?????u m???i qu?? ??ng ?????u quan t??m, Rolex x???p h???ng s??? 3</h5>
                        <p>1. Audemars Piguet ???????c th??nh l???p v??o n??m 1875 b???i Jules-Louis Audemars v?? Edward-Auguste
                            Piguet, ...</p>
                    </div>
                </div>
                <div class="filler col-md-4 col-12 pt-3 pt-md-0" data-aos="fade-up">
                    <div class="con">
                        <div class="img-content">
                            <img src="../image/thoi-thuong.png " height="250px" width="100%">
                        </div>

                    </div>
                    <div class="text-outer">
                        <h5>12 chi???c ?????ng h??? d??nh cho n??? gi???i ?????t gi?? nh???t m???i th???i ?????i</h5>
                        <p>C??ng nghi???p s???n xu???t ?????ng h??? sang tr???ng c?? d???u hi???u ch???ng l???i trong hai ...</p>
                    </div>
                </div>
                <div class="filler col-md-4 col-12 pt-3 pt-md-0" data-aos="fade-left">
                    <div class="con">
                        <div class="img-content">
                            <img src="../image/quyen-ru.png" height="250px" width="100%">
                        </div>
                    </div>
                    <div class="text-outer">
                        <h5>10 th????ng hi???u ?????ng h??? cao c???p h??ng ?????u m???i qu?? ??ng ?????u quan t??m, Rolex x???p h???ng s??? 3</h5>
                        <p>1. Audemars Piguet ???????c th??nh l???p v??o n??m 1875 b???i Jules-Louis Audemars v?? Edward-Auguste
                            Piguet, ...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%--  <div class="container">
 <div class="content-footer">
     <div class="left float-left">
         <h3>????ng k?? nh???n th??ng tin</h3>
     </div>
     <div class="right float-right">
         <form class="form-inline"
             action="${pageContext.request.contextPath}/" method="post">

             <div class="input-group mb-2 mr-sm-2">
                 <input type="text" class="form-control" id="emailfield"
                     placeholder="Email" />
             </div>
             <button type="submit" class="btn btn-info mb-2">Subcribe</button>
         </form>
     </div>
 </div>
</div> --%>
<!-- Footer -->
<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
<!-- Footer End-->


<!-- END layout-wrapper -->


<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"/>

</body>
</html>