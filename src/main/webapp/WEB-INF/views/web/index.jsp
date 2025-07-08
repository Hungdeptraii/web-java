<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <c:forEach var="category" items="${categories}">
                        <a href="javascript:void(0)" class="nav-link" id="nav_${category.id}">${category.name}</a>
                    </c:forEach>
                </div>
            </div>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    document.getElementById('nav_0').addEventListener('click', function () {
                        ChangeCategory(0);
                    });

                    <c:forEach var="category" items="${categories}">
                        document.getElementById('nav_${category.id}').addEventListener('click', function () {
                            ChangeCategory('${category.id}');
                        });
                    </c:forEach>
                });

                function ChangeCategory(categoryId) {
                    document.getElementById("loader-product").style.display = "block";
                    fetch(`/api/products/by-category/${categoryId}`)
                        .then(response => response.json())
                        .then(products => {
                            let html = '<div class="row">';
                            products.forEach(product => {
                                html += `
                <div class="col-md-3">
                    <div class="menu-entry">
                        <a class="img"
                            style="width: 255px; height: 255px; object-fit: cover; background-image: url('/template/products/${product.image}');">
                        </a>
                        <div class="text text-center pt-4">
                            <h3><a href="javascript:void(0)">${product.name}</a></h3>
                            <p class="price"><span>${product.price.toLocaleString()} VNĐ</span></p>
                            <p>
                                <a onclick="addToCart(${product.id})"
                                    href="javascript:void(0)"
                                    id="chon_product_${product.id}"
                                    class="btn btn-primary btn-outline-primary">
                                    Thêm vào giỏ hàng
                                </a>
                            </p>
                        </div>
                    </div>
                </div>`;
                            });
                            html += '</div>';
                            document.getElementById("product-container").innerHTML = html;
                            document.getElementById("loader-product").style.display = "none";
                        });
                }


                document.addEventListener("DOMContentLoaded", function() {
                    document.getElementById("loader-product").style.display = "none";
                })

                function addToCart(productId) {
                    fetch('/cart/add', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'productId=' + productId
                    })
                        .then(response => response.json())
                        .then(data => {
                            toastr.success("Thêm vào giỏ hàng thành công", "Thông báo");
                            $('#totalQuantity').text(data.totalQuantity);
                        });
                }

            </script>

            <div class="col-md-12 ftco-animate d-flex justify-content-center mb-5">
                <div class="sidebar-box" style="width: 500px">
                    <div class="search-form">
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
        <svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
        </svg>
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
                                <a
                                    onclick="addToCart(${product.id})"
                                    href="javascript:void(0)"
                                    id="chon_product_${product.id}"
                                    class="btn btn-primary btn-outline-primary">
                                    Thêm vào giỏ hàng
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>
