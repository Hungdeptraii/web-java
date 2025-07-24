<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="includes/header.jsp" %>

<div class="container-fluid my-5">
    <div class="row">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5 col-xxl-4 mx-auto">
            <div class="card rounded-4">
                <div class="card-body p-5">
                    <h4 class="fw-bold">Đăng nhập</h4>
                    <p class="mb-0">Nhập thông tin đăng nhập của bạn</p>

                    <!-- Thông báo -->
                    <c:if test="${not empty sessionScope.notice}">
                        <div class="mt-2 alert alert-${sessionScope.status} border-0 bg-${sessionScope.status} alert-dismissible fade show">
                            <div class="text-white">${sessionScope.notice}</div>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <div class="form-body my-4">
                        <form class="row g-3" method="POST" action="${pageContext.request.contextPath}/login">
                            <div class="col-12">
                                <label for="inputEmailAddress" class="form-label">Tài khoản</label>
                                <input type="text" class="form-control" name="email" placeholder="Nhập tài khoản" required>
                            </div>
                            <div class="col-12">
                                <label for="inputChoosePassword" class="form-label">Mật khẩu</label>
                                <div class="input-group" id="show_hide_password">
                                    <input type="password" class="form-control border-end-0" name="password" placeholder="Nhập mật khẩu" required>
                                    <a href="javascript:;" class="input-group-text bg-transparent">
                                        <i class="bi bi-eye-slash-fill"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="remember">
                                    <label class="form-check-label" for="flexSwitchCheckChecked">Ghi nhớ tài khoản</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("body").attr("class", "bg-login");
    })
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let isLoginPage = window.location.pathname.includes("login");

        if (isLoginPage) {
            $(document).ajaxError(function(event, xhr) {
                if (xhr.status === 419) {
                    location.reload();
                }
            });
        }
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".login-popup").forEach(function (element) {
            element.addEventListener("click", function () {
                var url = this.getAttribute("data-url");

                var loginWindow = window.open(
                    url,
                    "loginPopup",
                    "width=600,height=600,scrollbars=yes"
                );

                window.addEventListener("message", function (event) {
                    if (event.origin === window.location.origin) {
                        if (event.data.status === "success") {
                            window.location.href = event.data.redirectUrl;
                        } else if (event.data.status === "error") {
                            alert(event.data.message);
                        }
                    }
                });
            });
        });
    });
</script>


<%@ include file="includes/footer.jsp" %>

