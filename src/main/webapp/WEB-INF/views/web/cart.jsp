<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="includes/header.jsp" %>

<section class="ftco-section ftco-cart">
    <div class="col-lg-12">
        <div class="row justify-content-center mt-5 mb-5">
            <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
                <span class="subheading">Giỏ hàng</span>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <table class="table">
                        <thead class="thead-primary">
                            <tr class="text-center">
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>Sản phẩm</th>
                                <th>Giá tiền</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody id="cart-container">
                        <c:choose>
                              <c:when test="${not empty cart.items}">
                                <c:forEach var="item" items="${cart.items.values()}">
                                  <tr class="text-center">
                                      <td class="product-remove">
                                          <a href="javascript:void(0)" id="xoa_cart_${item.product.id}">
                                              <span class="icon-close"></span>
                                          </a>
                                      </td>
                                      <td class="image-prod">
                                          <div class="img"
                                               style="background-image: url('${pageContext.request.contextPath}/template/products/${item.product.image}'); width:60px; height:60px; background-size:cover;">
                                          </div>
                                      </td>
                                      <td class="product-name">
                                          <h3>${item.product.name}</h3>
                                      </td>
                                      <td class="price">
                                          <fmt:formatNumber value="${item.product.price}" type="number" groupingUsed="true"/> VNĐ
                                      </td>
                                      <td class="quantity">
                                          <div class="input-group mb-3">
                                              <input type="text"
                                                     id="quantity_cart_${item.product.id}"
                                                     name="quantity"
                                                     class="quantity form-control input-number"
                                                     value="${item.quantity}"
                                                     min="1"
                                                     max="100">
                                          </div>
                                      </td>
                                      <td id="total_${item.product.id}" class="total">
                                          <fmt:formatNumber value="${item.product.price * item.quantity}" type="number" groupingUsed="true"/> VNĐ
                                      </td>
                                  </tr>
                                  <script>
                                      document.getElementById('xoa_cart_${item.product.id}').addEventListener('click', function () {
                                          let cartId = '${item.product.id}';
                                          RemoveCart(cartId);
                                      });

                                      document.getElementById('quantity_cart_${item.product.id}').addEventListener('change', function () {
                                          let quantity = parseInt(this.value) || 1;
                                          if (quantity < 1) quantity = 1;
                                          if (quantity > 100) quantity = 100;
                                          this.value = quantity;

                                          let cartId = '${item.product.id}';
                                          const totalElement = document.getElementById('total_' + cartId);
                                          totalElement.textContent = new Intl.NumberFormat('vi-VN', { style: 'decimal' }).format(quantity * ${item.product.price}) + " VNĐ";
                                          UpdateCartQuantity(cartId, quantity);
                                      });
                                  </script>
                              </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="text-center">Chưa có sản phẩm nào trong giỏ.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row justify-content-between mt-4">
            <div class="col col-12 col-lg-5 cart-wrap ftco-animate">
                <h3>Thông tin khách hàng<c:if test="${not empty param.ban}"> (Bàn: ${fn:toUpperCase(param.ban)})</c:if></h3>
                <h6 class="d-flex justify-content-between align-items-center mb-2">
                    <span>Họ và tên <span style="color: red;">*</span></span>
                </h6>
                <input autocomplete="off" class="form-control rounded-start rounded-0 bg-light" type="text" id="fullname" placeholder="Họ và tên" required>
                <h6 class="d-flex justify-content-between align-items-center mb-2 mt-2">
                    <span>Số điện thoại <span style="color: red;">*</span></span>
                </h6>
                <input autocomplete="off" class="form-control rounded-start rounded-0 bg-light input-phonevn" type="text" id="phone" placeholder="Số điện thoại" required>
                <c:if test="${empty param.ban}">
                    <h6 class="d-flex justify-content-between align-items-center mb-2 mt-2">
                        <span>Địa chỉ email <span style="color: red;">*</span></span>
                    </h6>
                    <input autocomplete="off" class="form-control rounded-start rounded-0 bg-light" type="email" id="email" placeholder="Địa chỉ email" required>
                    <h6 class="d-flex justify-content-between align-items-center mb-2 mt-2">
                        <span>Địa chỉ giao hàng <span style="color: red;">*</span></span>
                    </h6>
                    <input autocomplete="off" class="form-control rounded-start rounded-0 bg-light" type="text" id="address" placeholder="Địa chỉ giao hàng" required>
                </c:if>
                <h6 class="mb-3 mt-3"><i><span style="color: red;">* là bắt buộc</span></i></h6>
            </div>

            <div class="col col-12 col-lg-3 cart-wrap ftco-animate">
                <div class="cart-total mb-3">
                    <h3>Thanh toán</h3>
                    <p class="d-flex">
                        <span>Thành tiền</span>
                        <span id="thanhTien">
                            <fmt:formatNumber value="${cart.totalPrice}" type="number" groupingUsed="true"/> VNĐ
                        </span>
                    </p>
                    <p class="d-flex">
                        <span>Thuế</span>
                        <span>10%</span>
                    </p>
                    <hr>
                    <p class="d-flex total-price">
                        <span>Tổng tiền</span>
                        <span id="totalPrice">
                            <fmt:formatNumber value="${cart.totalPrice * 1.1}" type="number" groupingUsed="true"/> VNĐ
                        </span>
                    </p>
                </div>
                <p class="text-center">
                    <a href="javascript:void(0)" id="ThanhToan" class="btn btn-primary py-3 px-4">Thanh toán</a>
                </p>
            </div>
        </div>
    </div>
</section>

<script>
    let leaveTime = null, tabActive = true;
    document.addEventListener('visibilitychange', function () {
        tabActive = !document.hidden;
        if (tabActive) {
            const now = Date.now();
            if (leaveTime && (now - leaveTime >= 5 * 60 * 1000)) {
                location.reload();
            }
            leaveTime = null;
        } else {
            leaveTime = Date.now();
        }
    });

    function generateCode(length = 10) {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        return Array.from({ length }, () => chars[Math.floor(Math.random() * chars.length)]).join('');
    }

    // Handler nút thanh toán
    document.getElementById('ThanhToan').addEventListener('click', function () {
        var code = generateCode(10);
        var isBan = "${param.ban}" !== "";

        var info = {
            fullname: document.getElementById('fullname').value,
            phone: document.getElementById('phone').value,
            email: document.getElementById('email') ? document.getElementById('email').value : "",
            address: document.getElementById('address') ? document.getElementById('address').value : ""
        };

        if (!info.fullname || !info.phone || (!isBan && (!info.email || !info.address))) {
            alert("Vui lòng nhập đầy đủ thông tin bắt buộc.");
            return;
        }

        if (info.phone.length < 11 || info.phone.length > 12) {
            alert("Số điện thoại không hợp lệ.");
            return;
        }

        let banVal = "${param.ban}" === "null" ? "" : "${param.ban}";
        let url = '/cart/checkout?code=' + code;
        if (isBan && banVal) url += '&ban=' + encodeURIComponent(banVal);
        window.location.href = url;
    });

    function bindCartEvents() {
        document.querySelectorAll('[id^="xoa_cart_"]').forEach(function(btn) {
            btn.addEventListener('click', function () {
                let cartId = this.id.replace('xoa_cart_', '');
                RemoveCart(cartId);
            });
        });
        document.querySelectorAll('[id^="quantity_cart_"]').forEach(function(input) {
            input.addEventListener('change', function () {
                let quantity = parseInt(this.value) || 1;
                if (quantity < 1) quantity = 1;
                if (quantity > 100) quantity = 100;
                this.value = quantity;
                let cartId = this.id.replace('quantity_cart_', '');
                const totalElement = document.getElementById('total_' + cartId);
                const price = parseInt(this.dataset.price);
                totalElement.textContent = new Intl.NumberFormat('vi-VN', { style: 'decimal' }).format(quantity * price) + " VNĐ";
                UpdateCartQuantity(cartId, quantity);
            });
        });
    }

    document.addEventListener("DOMContentLoaded", function() {
        bindCartEvents();
    });

    function RemoveCart(cartId) {
        fetch('/cart/remove?id=' + encodeURIComponent(cartId), {
            method: 'GET'
        })
            .then(response => response.json())
            .then(data => {
                document.getElementById('cart-container').innerHTML = data.html;
                bindCartEvents();
                document.getElementById('totalQuantity').textContent = data.totalQuantity;
                document.getElementById('thanhTien').textContent = data.thanhTien;
                document.getElementById('totalPrice').textContent = data.totalPrice;
                toastr.success("Xóa sản phẩm khỏi giỏ hàng thành công", "Thông báo");
            });
    }
    function UpdateCartQuantity(cartId, quantity) {
        fetch('/cart/update?id=' + encodeURIComponent(cartId) + '&quantity=' + quantity, {
            method: 'GET'
        })
            .then(response => response.json())
            .then(data => {
                document.getElementById('cart-container').innerHTML = data.html;
                bindCartEvents();
                document.getElementById('totalQuantity').textContent = data.totalQuantity;
                document.getElementById('thanhTien').textContent = data.thanhTien;
                document.getElementById('totalPrice').textContent = data.totalPrice;
                toastr.success("Cập nhật giỏ hàng thành công", "Thông báo");
            });
    }
</script>

<%@ include file="includes/footer.jsp" %>
