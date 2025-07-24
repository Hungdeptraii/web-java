<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="pageTitle" value="Xác nhận đơn" scope="request" />
<%@ include file="includes/header.jsp" %>

<main class="main-wrapper">
    <div class="main-content">
        <div class="modal fade text-start" id="AvatarPreview" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog text-center">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>Avatar của bạn</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="AvatarPreviewImg"></div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <h5 class="pe-3">Quản lý đơn hàng</h5>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="payment" class="table table-bordered mb-0" style="width:100%">
                        <thead id="tableHead" class="table-dark">
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên người mua đồ</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ giao hàng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="customer_order" items="${customer_orders}">
                                <tr id="order-row-${customer_order.id}">
                                    <td>${customer_order.code}</td>
                                    <td>${customer_order.fullname}</td>
                                    <td>${customer_order.phone}</td>
                                    <td>${customer_order.address}</td>
                                    <td class="text-center" width="15%">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#payment_${customer_order.id}" class="btn btn-success me-1" title="Xem chi tiết">
                                            <i class="material-icons-outlined">visibility</i>
                                        </button>
                                        <button type="button" class="btn btn-primary me-1 btn-approve-order" data-order-id="${customer_order.id}" data-bs-toggle="modal" data-bs-target="#approve_order_${customer_order.id}" title="Duyệt đơn">
                                            <i class="material-icons-outlined">check</i>
                                        </button>
                                        <!-- Modal xác nhận duyệt đơn -->
                                        <div class="modal fade" id="approve_order_${customer_order.id}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Xác nhận duyệt đơn</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>Bạn có chắc chắn muốn duyệt đơn <b>${customer_order.code}</b> không?</h5>
                                                        <div class="modal-footer d-flex justify-content-center">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                                                            <button type="button" class="btn btn-primary btn-approve-order-confirmed" data-order-id="${customer_order.id}" data-bs-dismiss="modal">Đồng ý</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-danger btn-cancel-order" data-order-id="${customer_order.id}" data-bs-toggle="modal" data-bs-target="#cancel_order_${customer_order.id}" title="Hủy đơn">
                                            <i class="material-icons-outlined">close</i>
                                        </button>
                                        <!-- Modal nhập lý do huỷ đơn -->
                                        <div class="modal fade" id="cancel_order_${customer_order.id}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Huỷ đơn hàng <b>${customer_order.code}</b></h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label for="cancelReason_${customer_order.id}" class="form-label text-start" style="display:block;">Lý do huỷ đơn</label>
                                                            <textarea class="form-control" id="cancelReason_${customer_order.id}" rows="3" placeholder="Nhập lý do huỷ đơn..."></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer d-flex justify-content-center">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                        <button type="button" class="btn btn-danger btn-cancel-order-confirmed" data-order-id="${customer_order.id}" data-bs-dismiss="modal">Xác nhận huỷ</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal fade text-start" id="payment_${customer_order.id}" tabindex="-1" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-scrollable">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Đơn hàng <b>${customer_order.code}</b></h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Tên người mua đồ: ${customer_order.fullname}</label>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Số điện thoại: ${customer_order.phone}</label>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Địa chỉ giao hàng: ${customer_order.address}</label>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Ghi chú: ${customer_order.note}</label>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Danh sách món đã đặt:</label>
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Tên món</th>
                                                                        <th>Ảnh</th>
                                                                        <th>Đơn giá</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Thành tiền</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="item" items="${order_items_map[customer_order.id]}" varStatus="status">
                                                                        <tr>
                                                                            <td>${status.index + 1}</td>
                                                                            <td>${item.productName}</td>
                                                                            <td>
                                                                                <c:if test="${not empty item.image}">
                                                                                    <img src="/template/products/${item.image}" alt="${item.productName}" style="width: 60px; height: 60px; object-fit: cover;" />
                                                                                </c:if>
                                                                            </td>
                                                                            <td><fmt:formatNumber value="${item.unitPrice}" pattern="#,##0" /> VNĐ</td>
                                                                            <td>${item.quantity}</td>
                                                                            <td><fmt:formatNumber value="${item.price}" pattern="#,##0" /> VNĐ</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label text-end" style="display:block; width:100%;">Tổng tiền: <span class="text-end"><fmt:formatNumber value="${order_total_map[customer_order.id]}" pattern="#,##0" /> VNĐ</span></label>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>

<script>
    $(document).ready(function () {
        var dataTableAllText = "Tất cả";

        $('#payment').DataTable({
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

        const savedTheme = localStorage.getItem("theme") || "light";

        if(savedTheme === "dark") {
            $('#tableHead').removeClass('table-dark');
            $('#tableHead').addClass('table-light');
        } else {
            $('#tableHead').removeClass('table-light');
            $('#tableHead').addClass('table-dark');
        }

        // Xử lý duyệt đơn xác nhận bằng modal
        $('.btn-approve-order-confirmed').click(function() {
            var orderId = $(this).data('order-id');
            $.post('/admin/approve-order', {orderId: orderId}, function(res) {
                if (res === 'success') {
                    toastr.success('Xác nhận đơn hàng thành công!', 'Thông báo');
                    $('#order-row-' + orderId).remove();
                    // Nếu không còn đơn nào thì hiển thị dòng không có dữ liệu
                    if ($('#payment tbody tr').length === 0) {
                        $('#payment tbody').append('<tr class="odd"><td valign="top" colspan="5" class="dataTables_empty text-center">Không có dữ liệu trong bảng</td></tr>');
                    }
                }
            });
        });

        $('.btn-cancel-order-confirmed').click(function() {
            var orderId = $(this).data('order-id');
            var reason = $('#cancelReason_' + orderId).val();
            if (!reason || reason.trim() === '') {
                toastr.error('Vui lòng nhập lý do huỷ đơn!', 'Lỗi');
                return;
            }
            $.post('/admin/cancel-order', {orderId: orderId, reason: reason}, function(res) {
                if (res === 'success') {
                    toastr.success('Huỷ đơn hàng thành công!', 'Thông báo');
                    $('#order-row-' + orderId).remove();
                    // Nếu không còn đơn nào thì hiển thị dòng không có dữ liệu
                    if ($('#payment tbody tr').length === 0) {
                        $('#payment tbody').append('<tr class="odd"><td valign="top" colspan="5" class="dataTables_empty text-center">Không có dữ liệu trong bảng</td></tr>');
                    }
                } else {
                    toastr.error('Có lỗi xảy ra!', 'Lỗi');
                }
            });
        });
    });
</script>