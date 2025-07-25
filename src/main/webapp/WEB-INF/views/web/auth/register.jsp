<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng ký tài khoản</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/template/web/css/style.css'/>">
</head>
<body>
<div class="container" style="max-width: 400px; margin: 40px auto;">
    <h2 class="text-center mb-4">Đăng ký tài khoản</h2>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-group mb-3">
            <label for="fullname">Họ và tên</label>
            <input type="text" class="form-control" id="fullname" name="fullname" required>
        </div>
        <div class="form-group mb-3">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group mb-3">
            <label for="phone">Số điện thoại</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="form-group mb-3">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required minlength="8">
        </div>
        <div class="form-group mb-4">
            <label for="confirmPassword">Xác nhận mật khẩu</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            <div id="passwordError" class="text-danger mt-2"></div>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
    </form>
    <div class="text-center mt-3">
        Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
    </div>
    <!-- Toast notification sẽ hiển thị bằng JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        toastr.options = {
            "positionClass": "toast-top-right",
            "timeOut": 3000,
            "closeButton": true
        };
    </script>
    <c:if test="${not empty sessionScope.error}">
        <script>
            toastr.error('${sessionScope.error}');
            <% session.removeAttribute("error"); %>
        </script>
    </c:if>
    <c:if test="${not empty sessionScope.success}">
        <script>
            toastr.success('${sessionScope.success}');
            <% session.removeAttribute("success"); %>
        </script>
    </c:if>
</div>
<script>
function validatePassword() {
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var error = '';
    var regex = /^(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]).{8,}$/;
    if (!regex.test(password)) {
        error = 'Mật khẩu phải tối thiểu 8 ký tự, có ít nhất 1 chữ hoa và 1 ký tự đặc biệt.';
    } else if (password !== confirmPassword) {
        error = 'Mật khẩu xác nhận không khớp.';
    }
    document.getElementById('passwordError').innerText = error;
    return error === '';
}

document.addEventListener('DOMContentLoaded', function() {
    var form = document.querySelector('form');
    form.addEventListener('submit', function(e) {
        if (!validatePassword()) {
            e.preventDefault();
        }
    });
});
</script>
</body>
</html> 