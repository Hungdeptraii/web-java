<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="ftco-footer ftco-section img">
  <div class="overlay"></div>
  <div class="container">
    <div class="row mb-5">
      <div class="col-lg-9">
        <div class="ftco-footer-widget mb-4">
          <h2 class="ftco-heading-2">Thông tin về chúng tôi</h2>
          <p>${infoWebsite['Mô tả']}</p>
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
                <li><span class="icon icon-map-marker"></span><span class="text">${infoWebsite['Địa chỉ']}</span></li>
              <li><a href="tel:${infoWebsite['Số điện thoại']}"><span class="icon icon-phone"></span><span class="text">${infoWebsite['Số điện thoại']}</span></a></li>
              <li><a href="mailto:${infoWebsite['Địa chỉ email']}"><span class="icon icon-envelope"></span><span class="text">${infoWebsite['Địa chỉ email']}</span></a></li>
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
  <svg class="circular" width="48px" height="48px">
    <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
    <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
  </svg>
</div>

<!-- JS Scripts -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
        integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
