<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/template/web/css/style.css'/>">
</head>
<body>
<div class="container" style="max-width: 400px; margin: 40px auto;">
    <h2 class="text-center mb-4">Đăng nhập</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group mb-3">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group mb-3">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="form-group mb-3">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="remember" id="remember">
                <label class="form-check-label" for="remember">Ghi nhớ tài khoản</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <div class="text-center mt-3">
        Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
    </div>
    <c:if test="${not empty sessionScope.notice}">
        <div class="alert alert-${sessionScope.status} mt-3">${sessionScope.notice}</div>
    </c:if>
</div>
</body>
</html>

