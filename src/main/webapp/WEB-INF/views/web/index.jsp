<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>


<section class="ftco-menu pb-5 mt-5">
    <div class="col-lg-12">
        <div class="row justify-content-center">
            <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
                <span class="subheading">Menu</span>
            </div>
        </div>
    </div>
    <div class="col-lg-12 ftco-animate p-md-5">
        <div class="row">
            <div class="col-md-12 nav-link-wrap">
                <div class="nav ftco-animate nav-pills justify-content-center" aria-orientation="vertical">
                    <a href="javascript:void(0)" class="nav-link active" id="nav_0">Tất cả</a>
<%--                    @foreach ($categories as $categorie)--%>
<%--                    <a href="javascript:void(0)" class="nav-link" id="nav_{{ $categorie->id }}">{{ $categorie->name }}</a>--%>
<%--                    <script>--%>
<%--                        document.getElementById('nav_0').addEventListener('click', function () {--%>
<%--                            ChangeCategory(0);--%>
<%--                        });--%>

<%--                        document.getElementById('nav_{{ $categorie->id }}').addEventListener('click', function () {--%>
<%--                            ChangeCategory('{{ $categorie->id }}');--%>
<%--                        });--%>
<%--                    </script>--%>
<%--                    @endforeach--%>
    <%--                    <c:forEach var="$category" items="${$category}">--%>
    <%--                        <div class="col-md-3">--%>
    <%--                            <div class="menu-entry">--%>
    <%--                                <a class="img"--%>
    <%--                                   style="width: 255px; height: 255px; object-fit: cover;--%>
    <%--                                           background-image: url(<c:url value='/template/products/${product.image}'/>);">--%>
    <%--                                </a>--%>
    <%--                                <div class="text text-center pt-4">--%>
    <%--                                    <h3><a href="javascript:void(0)">${product.name}</a></h3>--%>
    <%--                                    <p class="price">--%>
    <%--                                    <span>--%>
    <%--                                        <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ--%>
    <%--                                    </span>--%>
    <%--                                    </p>--%>
    <%--                                    <p>--%>
    <%--                                        <a href="javascript:void(0)"--%>
    <%--                                           id="chon_product_${product.id}"--%>
    <%--                                           class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a>--%>
    <%--                                    </p>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </c:forEach>--%>
                </div>
            </div>
            <div class="col-md-12 ftco-animate d-flex justify-content-center mb-5">
                <div class="sidebar-box" style="width: 500px">
                    <div action="#" class="search-form">
                        <div class="form-group">
                            <div class="icon" id="searchProduct_btn" style="cursor: pointer;">
                                <span class="icon-search"></span>
                            </div>
                            <input type="text" id="searchProduct" class="form-control" placeholder="Tìm kiếm...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="loader-product">
        <svg class="circular" width="48px" height="48px"> <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
    </div>

    <div class="container ftco-animate" id="product-container">
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-3">
                    <div class="menu-entry">
                        <a class="img"
                           style="width: 255px; height: 255px; object-fit: cover;
                                   background-image: url(<c:url value='/template/products/${product.image}'/>);">
                        </a>
                        <div class="text text-center pt-4">
                            <h3><a href="javascript:void(0)">${product.name}</a></h3>
                            <p class="price">
                            <span>
                                <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ
                            </span>
                            </p>
                            <p>
                                <a href="javascript:void(0)"
                                   id="chon_product_${product.id}"
                                   class="btn btn-primary btn-outline-primary">Thêm vào giỏ hàng</a>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>


