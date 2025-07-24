<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="<c:url value='/template/admins/assets/js/jquery.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/js/bootstrap.bundle.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/metismenu/metisMenu.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/apexchart/apexcharts.min.js' />"></script>
<!-- <script src="<c:url value='/template/admins/assets/js/index.js' />"></script> -->
<script src="<c:url value='/template/admins/assets/plugins/peity/jquery.peity.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/fancy-file-uploader/jquery.ui.widget.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/fancy-file-uploader/jquery.fileupload.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/fancy-file-uploader/jquery.iframe-transport.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/fancy-file-uploader/jquery.fancy-fileupload.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/datatable/js/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/datatable/js/dataTables.bootstrap5.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/mask/jquery.mask.min.js' />"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script src="<c:url value='/template/admins/assets/plugins/select2/js/select2-custom.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/form-repeater/repeater.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/notifications/js/lobibox.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/notifications/js/notifications.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/notifications/js/notification-custom-script.js' />"></script>
<script src="<c:url value='/template/admins/assets/plugins/simplebar/js/simplebar.min.js' />"></script>
<script src="<c:url value='/template/admins/assets/js/main.js' />"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js" integrity="sha512-Gs+PsXsGkmr+15rqObPJbenQ2wB3qYvTHuJO6YJzPe/dTLvhy0fmae2BcnaozxDo5iaF8emzmCZWbQ1XXiX2Ig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
  $(document).ready(function() {
    $('.input-phonevn').mask('000 0000000');

    $('.input-money').mask("#.##0", {
      reverse: true
    });

    $('.input-discount').mask('000', {
      translation: {
        '0': { pattern: /[0-9]/ }
      },
      onKeyPress: function(value, event, currentField) {
        if (parseInt(value) > 100) {
          currentField.val('100');
        }
      }
    });

    $(document).on('click', '#avatarNavProfile', function() {
      $('#AvatarPreview').modal('show');
      $('#AvatarPreviewImg').html('<img src="' + $(this).attr('src') + '" class="img-fluid">');
    });

    const savedTheme = localStorage.getItem("theme") || "light";
    $("html").attr("data-bs-theme", savedTheme);
    $("#switTheme i").text(savedTheme === "dark" ? "light_mode" : "dark_mode");

    $('#switTheme').on("change", function () {
      const theme = $(this).prop("checked") ? "dark" : "light";
      $("html").attr("data-bs-theme", theme);
      localStorage.setItem("theme", theme);
    });
  });

  $(document).ready(function () {
        var dataTableAllText = "Tất cả";

        $('#event').DataTable({
            language: {
                oPaginate: {
                    sNext: "Tiếp",
                    sPrevious: "Trước"
                },
                sEmptyTable: "Không có dữ liệu trong bảng",
                sInfo: "Hiển thị _START_ đến _END_ trong số _TOTAL_ mục",
                sInfoEmpty: "Hiển thị 0 đến 0 trong 0 mục",
                infoFiltered: '(được lọc từ tổng số _MAX_ mục)',
                sSearch: "Tìm kiếm",
                sLengthMenu: "Hiển thị _MENU_",
                zeroRecords: 'Không tìm thấy dữ liệu',
            },
            searching: true,
            autoWidth: true,
            ordering:  false,
            "lengthMenu": [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, dataTableAllText]
            ]
        });

        $('#fancy-file-upload').FancyFileUpload({
			params: {
				action: 'fileuploader'
			},
			maxfilesize: 1000000
		});

        const savedTheme = localStorage.getItem("theme") || "light";

        if(savedTheme === "dark") {
            $('#tableHead').removeClass('table-dark');
            $('#tableHead').addClass('table-light');
        } else {
            $('#tableHead').removeClass('table-light');
            $('#tableHead').addClass('table-dark');
        }
    });
</script>
</body>
</html>
