<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>@yield('title')</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

<%--    <link rel="shortcut icon" href="<c:url value'/template/web $infoWebsite['Logo']) }}" type="image/x-icon">--%>

    <link rel="stylesheet" href="<c:url value='/template/web/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/web/css/animate.css'/>">

    <link rel="stylesheet" href="<c:url value='/template/web/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/web/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/web/css/magnific-popup.css'/>">

    <link rel="stylesheet" href="<c:url value='/template/web/css/aos.css'/>">

    <link rel="stylesheet" href="<c:url value='/template/web/css/ionicons.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/template/web/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/web/css/jquery.timepicker.css'/>">

    <link rel="stylesheet" href="<c:url value='/template/web/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/web/css/icomoon.css'/>">
    <link rel="stylesheet" href="<c:url value='/template/web/css/style.css'/>">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="{{ route('home') }}"><img width='60' src="{{ url('public/logo/'. $infoWebsite['Logo']) }}"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item {{ request()->routeIs('home') ? 'active' : '' }}">
                    @if(request('ban'))
                    <a href="{{ route('home') . '?ban=' . request('ban') }}" class="nav-link">Trang chủ</a>
                    @else
                    <a href="{{  route('home') }}" class="nav-link">Trang chủ</a>
                    @endif
                </li>
                @if (request('ban'))
                <li class="nav-item"><a href="javascript:void(0)" class="nav-link">Bàn: {{ request('ban') }}</a></li>
                <li class="nav-item"><a href="javascript:void(0)" class="nav-link">Dịch vụ (chưa làm)</a></li>
                @endif
                <li class="nav-item {{ request()->routeIs('home') ? 'active' : '' }}">
                    <a href="services.html" class="nav-link">Liên hệ (chưa làm)</a>
                </li>
                <li class="nav-item cart {{ request()->routeIs('cart.index') ? 'active' : '' }}">
                    <a href="#" class="nav-link">
                        <span style="font-size: 1.5rem;" class="icon icon-shopping_cart"></span>
                        <span class="bag d-flex justify-content-center align-items-center">
                            <small id="totalQuantity">
                                {{ $cart->totalQuantity }}
                            </small>
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

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
                                   background-image: url('public/products/${product.image}');">
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

<footer class="ftco-footer ftco-section img">
    <div class="overlay"></div>
    <div class="container">
        <div class="row mb-5">
            <div class="col-lg-9">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Thông tin về chúng tôi</h2>
                    <p>{{ $infoWebsite['Mô tả'] }}</p>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ftco-footer-widget mb-4">
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">{{ $infoWebsite['Địa chỉ'] }}</span></li>
                            <li><a href="tel:"><span class="icon icon-phone"></span><span class="text">{{ $infoWebsite['Số điện thoại'] }}</span></a></li>
                            <li><a href="mailto:"><span class="icon icon-envelope"></span><span class="text">{{ $infoWebsite['Địa chỉ email'] }}</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <p>
                    Copyright &copy;
                    <script>
                        document.write(new Date().getFullYear());
                    </script> All rights reserved
                </p>
            </div>
        </div>
    </div>
</footer>

<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px"> <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>

<script src="<c:url value='/template/web/js/jquery.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery-migrate-3.0.1.min.js'/>"></script>
<script src="<c:url value='/template/web/js/popper.min.js'/>"></script>
<script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.easing.1.3.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.stellar.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.mask.min.js'/>"></script>
<script src="<c:url value='/template/web/js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='/template/web/js/aos.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.animateNumber.min.js'/>"></script>
<script src="<c:url value='/template/web/js/bootstrap-datepicker.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.timepicker.min.js'/>"></script>
<script src="<c:url value='/template/web/js/scrollax.min.js'/>"></script>
<script src="<c:url value='/template/web/js/google-map.js'/>"></script>
<script src="<c:url value='/template/web/js/main.js'/>"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    $(document).ready(function () {
        toastr.options = {
            "closeButton": true,
            "progressBar": true,
        }

        $('.input-phonevn').mask('000 0000000');
    })
</script>
</body>

</html>
