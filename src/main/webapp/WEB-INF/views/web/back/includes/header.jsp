<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en" data-bs-theme="light">

<head>
    <title>${pageTitle}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="${pageContext.request.contextPath}/public/logo.png" type="image/png">

    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/metismenu/metisMenu.min.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/metismenu/mm-vertical.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/simplebar/css/simplebar.css' />">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/datatable/css/dataTables.bootstrap5.min.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/fancy-file-uploader/fancy_fileupload.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/plugins/notifications/css/lobibox.min.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/assets/css/bootstrap-extended.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/sass/main.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/sass/dark-theme.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/sass/semi-dark.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/sass/bordered-theme.css' />">
    <link rel="stylesheet" href="<c:url value='/template/admins/sass/responsive.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
</head>

<body>
<header class="top-header">
  <nav class="navbar navbar-expand align-items-center gap-4">
    <div class="btn-toggle">
      <a href="javascript:;"><i class="material-icons-outlined">menu</i></a>
    </div>
    <div class="search-bar flex-grow-1">
      <div class="position-relative">
        <div class="search-popup p-3">
          <div class="card rounded-4 overflow-hidden">
            <div class="card-body search-content">
            </div>
          </div>
        </div>
      </div>
    </div>

    <ul class="navbar-nav gap-1 nav-right-links align-items-center">
      <li class="nav-item dropdown">
        <div class="dropdown-menu dropdown-notify dropdown-menu-end shadow">
          <div class="notify-list">
          </div>
        </div>
      </li>

      <li class="nav-item dropdown">
        <a href="javascript:;" class="dropdown-toggle dropdown-toggle-nocaret" data-bs-toggle="dropdown">
          <c:choose>
            <c:when test="${not empty sessionScope.user and not empty sessionScope.user.avatar}">
              <img id="avatarNav" src="${pageContext.request.contextPath}/template/avatar/${sessionScope.user.avatar}" class="rounded-circle p-1 border" width="45" height="45">
            </c:when>
            <c:otherwise>
              <img id="avatarNav" src="${pageContext.request.contextPath}/template/avatar/avatar.png" class="rounded-circle p-1 border" width="45" height="45">
            </c:otherwise>
          </c:choose>
        </a>

        <div class="dropdown-menu dropdown-user dropdown-menu-end shadow">
          <a class="dropdown-item gap-2 py-2" href="${pageContext.request.contextPath}/profile">
            <div class="text-center">
              <c:choose>
                <c:when test="${not empty sessionScope.user and not empty sessionScope.user.avatar}">
                  <img id="avatarNavProfile" src="${pageContext.request.contextPath}/template/avatar/${sessionScope.user.avatar}" class="rounded-circle p-1 shadow mb-3" width="90" height="90" alt="">
                </c:when>
                <c:otherwise>
                  <img id="avatarNavProfile" src="${pageContext.request.contextPath}/template/avatar/avatar.png" class="rounded-circle p-1 shadow mb-3" width="90" height="90" alt="">
                </c:otherwise>
              </c:choose>

              <h5 class="user-name mb-0 fw-bold">
                Xin chào,
                <c:choose>
                  <c:when test="${not empty sessionScope.user and not empty sessionScope.user.fullname}">
                    <c:set var="nameParts" value="${fn:split(sessionScope.user.fullname, ' ')}" />
                    <c:out value="${nameParts[fn:length(nameParts)-2]} ${nameParts[fn:length(nameParts)-1]}" />
                  </c:when>
                  <c:otherwise>Khách</c:otherwise>
                </c:choose>
              </h5>
            </div>
          </a>

          <hr class="dropdown-divider">
          <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="${pageContext.request.contextPath}/admin/profile">
            <i class="material-icons-outlined">person_outline</i>Thông tin tài khoản
          </a>

          <hr class="dropdown-divider">
          <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="${pageContext.request.contextPath}/logout?key=${sessionScope.user.rememberToken}">
            <i class="material-icons-outlined">power_settings_new</i>Đăng xuất
          </a>
        </div>
      </li>
    </ul>
  </nav>
</header>

<aside class="sidebar-wrapper">
  <div class="sidebar-header">
    <div class="logo-icon">
      <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/public/logo.png" class="logo-img" alt=""></a>
    </div>
    <div class="logo-name flex-grow-1">
      <h5 class="mb-0">Quản lý</h5>
    </div>
    <div class="sidebar-close">
      <span class="material-icons-outlined">close</span>
    </div>
  </div>
  <div class="sidebar-nav" data-simplebar="true">
    <ul class="metismenu" id="sidenav">
      <li class="${activePage == 'admin' ? 'mm-active' : ''}">
        <a href="${pageContext.request.contextPath}/admin">
          <div class="parent-icon"><i class="material-icons-outlined">home</i></div>
          <div class="menu-title">Bảng điều khiển</div>
        </a>
      </li>
      <li class="${activePage == 'products' ? 'mm-active' : ''}">
        <a href="${pageContext.request.contextPath}/admin/products">
          <div class="parent-icon"><i class="material-icons-outlined">restaurant_menu</i></div>
          <div class="menu-title">Quản lý món</div>
        </a>
      </li>
      <li class="${activePage == 'orderconfirm' ? 'mm-active' : ''}">
        <a href="${pageContext.request.contextPath}/admin/orderconfirm">
          <div class="parent-icon"><i class="material-icons-outlined">assignment_turned_in</i></div>
          <div class="menu-title">Quản lý đơn hàng</div>
        </a>
      </li>
      <li class="${activePage == 'orderconfirmed' ? 'mm-active' : ''}">
        <a href="${pageContext.request.contextPath}/admin/orderconfirmed">
          <div class="parent-icon"><i class="material-icons-outlined">check_circle</i></div>
          <div class="menu-title">Đơn hàng đã xác nhận</div>
        </a>
      </li>
      <li class="${activePage == 'ordercancelled' ? 'mm-active' : ''}">
        <a href="${pageContext.request.contextPath}/admin/ordercancelled">
          <div class="parent-icon"><i class="material-icons-outlined">close</i></div>
          <div class="menu-title">Đơn hàng đã bị huỷ</div>
        </a>
      </li>
    </ul>
  </div>
  <div class="sidebar-bottom gap-4">
    <div class="dark-mode" id="switTheme">
      <a href="javascript:;" class="footer-icon dark-mode-icon">
        <i class="material-icons-outlined">dark_mode</i>
      </a>
    </div>
  </div>
</aside>
