<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>

<section class="ftco-section ftco-cart">
  <div class="container">
    <div class="row">
      <div class="col-md-12 ftco-animate">
        <div class="cart-list">
          <table class="table">
            <thead class="thead-primary">
              <tr class="text-center">
                <th>&nbsp;</th>
                <th>&nbsp;</th>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${cart.items}">
                <tr class="text-center">
                  <td class="product-remove">
                    <a href="#"><span class="icon-close"></span></a>
                  </td>

                  <td class="image-prod">
                    <div class="img" style="background-image: url(<c:url value='/template/products/${item.product.image}'/>);"></div>
                  </td>

                  <td class="product-name">
                    <h3>${item.product.name}</h3>
                    <p>${item.product.description}</p>
                  </td>

                  <td class="price">
                    <fmt:formatNumber value="${item.product.price}" type="number" groupingUsed="true"/> VNĐ
                  </td>

                  <td class="quantity">
                    <div class="input-group mb-3">
                      <input type="text" name="quantity" class="quantity form-control input-number"
                             value="${item.quantity}" min="1" max="100">
                    </div>
                  </td>

                  <td class="total">
                    <fmt:formatNumber value="${item.quantity * item.product.price}" type="number" groupingUsed="true"/> VNĐ
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row justify-content-end">
      <div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
        <div class="cart-total mb-3">
          <h3>Cart Totals</h3>
          <p class="d-flex">
            <span>Subtotal</span>
            <span><fmt:formatNumber value="${cart.totalPrice}" type="number" groupingUsed="true"/> VNĐ</span>
          </p>
          <p class="d-flex">
            <span>Delivery</span>
            <span>0 VNĐ</span>
          </p>
          <p class="d-flex">
            <span>Discount</span>
            <span>0 VNĐ</span>
          </p>
          <hr>
          <p class="d-flex total-price">
            <span>Total</span>
            <span><fmt:formatNumber value="${cart.totalPrice}" type="number" groupingUsed="true"/> VNĐ</span>
          </p>
        </div>
        <p class="text-center">
          <a href="checkout.jsp" class="btn btn-primary py-3 px-4">Proceed to Checkout</a>
        </p>
      </div>
    </div>
  </div>
</section>

<%@ include file="includes/footer.jsp" %>

