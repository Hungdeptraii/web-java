<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="<c:url value='/template/admins/assets/js/bootstrap.bundle.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/js/jquery.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/metismenu/metisMenu.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/apexchart/apexcharts.min.js' />"></script>

<!-- <script src="<c:url value='/template/admins/assets/js/index.js' />"></script> -->

<script src="<c:url value='/template/admins/assets/plugins/peity/jquery.peity.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/datatable/js/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/datatable/js/dataTables.bootstrap5.min.js' />"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="<c:url value='/template/admins/assets/plugins/select2/js/select2-custom.js' />"></script>

<script src="<c:url value='/template/admins/assets/plugins/simplebar/js/simplebar.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/mask/jquery.mask.min.js' />"></script>


<script src="<c:url value='/template/admins/assets/js/main.js' />"></script>

<script>
  $(document).ready(function () {
    $("#show_hide_password a").on('click', function (event) {
      event.preventDefault();
      if ($('#show_hide_password input').attr("type") == "text") {
        $('#show_hide_password input').attr('type', 'password');
        $('#show_hide_password i').addClass("bi-eye-slash-fill");
        $('#show_hide_password i').removeClass("bi-eye-fill");
      } else if ($('#show_hide_password input').attr("type") == "password") {
        $('#show_hide_password input').attr('type', 'text');
        $('#show_hide_password i').removeClass("bi-eye-slash-fill");
        $('#show_hide_password i').addClass("bi-eye-fill");
      }
    });
  });
</script>
</body>
</html>
