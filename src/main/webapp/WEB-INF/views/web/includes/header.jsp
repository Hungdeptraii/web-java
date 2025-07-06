<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>${pageTitle}</title> <!-- Thay cho @yield('title') -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

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

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css"
        integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
      <img width='60' src="${pageContext.request.contextPath}/template/logo/${infoWebsite.logo}" />
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
            aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="oi oi-menu"></span> Menu
    </button>

    <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item ${activePage == 'home' ? 'active' : ''}">
          <c:choose>
            <c:when test="${not empty param.ban}">
              <a href="${pageContext.request.contextPath}/?ban=${param.ban}" class="nav-link">Trang chủ</a>
            </c:when>
            <c:otherwise>
              <a href="${pageContext.request.contextPath}/" class="nav-link">Trang chủ</a>
            </c:otherwise>
          </c:choose>
        </li>

        <c:if test="${not empty param.ban}">
          <li class="nav-item"><a href="javascript:void(0)" class="nav-link">Bàn: ${param.ban}</a></li>
          <li class="nav-item"><a href="javascript:void(0)" class="nav-link">Dịch vụ (chưa làm)</a></li>
        </c:if>

        <li class="nav-item ${activePage == 'contact' ? 'active' : ''}">
          <a href="services.html" class="nav-link">Liên hệ (chưa làm)</a>
        </li>

        <li class="nav-item cart ${activePage == 'cart' ? 'active' : ''}">
          <a href="#" class="nav-link">
            <span style="font-size: 1.5rem;" class="icon icon-shopping_cart"></span>
            <span class="bag d-flex justify-content-center align-items-center">
              <small id="totalQuantity">${cart.totalQuantity}</small>
            </span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
