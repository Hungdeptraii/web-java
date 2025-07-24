<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="pageTitle" value="Quản lý món" scope="request" />
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
            <h5 class="pe-3">Cài đặt món</h5>
            <div class="ms-auto">
                <div class="btn-group">
                    <button type="button" data-bs-toggle="modal" data-bs-target="#add_product" class="btn btn-primary">Thêm</button>
                    <div class="modal fade text-start" id="add_product" tabindex="-1"
                         aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Thêm món</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form method="POST" action="${pageContext.request.contextPath}/admin/products/add" enctype="multipart/form-data" id="addProductForm">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Tên món</label>
                                            <input name="name" type="text" class="form-control" id="name" required minlength="2" maxlength="100">
                                            <div class="invalid-feedback">Vui lòng nhập tên món (2-100 ký tự)</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">Giá</label>
                                            <input type="text" name="price" class="form-control input-money" required>
                                            <div class="invalid-feedback">Vui lòng nhập giá</div>
                                        </div>
                                        <div class="input-group mb-3">
                                            <label class="input-group-text" for="categorySelect">Thể loại</label>
                                            <select name="category_id" class="form-select" id="categorySelect" data-placeholder="Chọn thể loại" required>
                                                <option value="" selected disabled>Chọn thể loại</option>
                                                <c:forEach var="category" items="${categories}">
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="invalid-feedback">Vui lòng chọn thể loại</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="image" id="imageTitle" class="form-label">Ảnh món (W: 300px, H: 300px)</label>
                                                <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <img src="" class="d-none ratio-1x1 object-fit-cover" style="width: 300px; height: 300px;" alt="...">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="btnImage" class="col-md-6 mb-3 d-flex align-items-center justify-content-center flex-column">
                                                <input type="file" name="image" id="image" class="d-none" accept="image/*">
                                                <button type="button" id="changeImageBtn" class="btn btn-primary mb-2">Tải ảnh lên</button>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Thêm</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${not empty sessionScope.message}">
            <div class="mt-2 alert alert-${sessionScope.messageType == 'success' ? 'success' : 'danger'} border-0 bg-${sessionScope.messageType == 'success' ? 'success' : 'danger'} alert-dismissible">
                <div class="text-white">${sessionScope.message}</div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% session.removeAttribute("message"); %>
            <% session.removeAttribute("messageType"); %>
        </c:if>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="product" class="table table-bordered mb-0" style="width:100%">
                        <thead id="tableHead" class="table-dark">
                        <tr>
                            <th>Tên món</th>
                            <th>Giá tiền</th>
                            <th>Thể loại</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.name}</td>
                            <td><fmt:formatNumber value="${product.price}" pattern="#,##0" /> VNĐ</td>
                            <td>${product.category.name}</td>
                            <td class="text-center" width="10%">
                                <button type="button" data-bs-toggle="modal" data-bs-target="#edit_product_${product.id}" class="btn btn-success"><i class="material-icons-outlined">edit</i></button>
                                <div class="modal fade text-start" id="edit_product_${product.id}" tabindex="-1"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Sửa món</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="POST" action="${pageContext.request.contextPath}/admin/products/edit/${product.id}" enctype="multipart/form-data" id="editProductForm_${product.id}">
                                                    <div class="mb-3">
                                                        <label for="name_${product.id}" class="form-label">Tên món</label>
                                                        <input name="name" type="text" class="form-control" id="name_${product.id}" value="${product.name}" required minlength="2" maxlength="100">
                                                        <div class="invalid-feedback">Vui lòng nhập tên món (2-100 ký tự)</div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="price_${product.id}" class="form-label">Giá</label>
                                                        <input type="text" id="price_${product.id}" name="price" class="form-control input-money" value="${product.price}" required>
                                                        <div class="invalid-feedback">Vui lòng nhập giá</div>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <label class="input-group-text" for="categorySelect_${product.id}">Thể loại</label>
                                                        <select name="category_id" class="form-select" id="categorySelect_${product.id}" data-placeholder="Chọn thể loại" required>
                                                            <c:forEach var="category" items="${categories}">
                                                                <option value="${category.id}" ${product.category.id == category.id ? 'selected' : ''}>
                                                                    ${category.name}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                        <div class="invalid-feedback">Vui lòng chọn thể loại</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 mb-3">
                                                            <label for="image" id="imageTitle_${product.id}" class="form-label">Ảnh món hiện tại (W: 300px, H: 300px)</label>
                                                            <div id="carouselExampleSlidesOnly_${product.id}" class="carousel slide" data-bs-ride="carousel">
                                                                <div class="carousel-inner">
                                                                    <div class="carousel-item active">
                                                                        <c:choose>
                                                                            <c:when test="${not empty product.image}">
                                                                                <img src="${pageContext.request.contextPath}/template/products/${product.image}" class="d-block ratio-1x1 object-fit-cover" style="width: 300px; height: 300px;" alt="...">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <img src="" class="d-none ratio-1x1 object-fit-cover" style="width: 300px; height: 300px;" alt="...">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="btnImage_${product.id}" class="col-md-6 mb-3 d-flex align-items-center justify-content-center flex-column">
                                                            <input type="file" name="image" id="image_${product.id}" class="d-none" accept="image/*">
                                                            <button type="button" id="changeImageBtn_${product.id}" class="btn btn-primary mb-2">Thay đổi ảnh</button>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Đóng</button>
                                                        <button type="submit" class="btn btn-primary">Sửa</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" data-bs-toggle="modal" data-bs-target="#delete_product_${product.id}" class="btn ripple btn-danger"><i class="material-icons-outlined">delete</i></button>
                                <div class="modal fade" id="delete_product_${product.id}" tabindex="-1"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn xoá không?</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="POST" action="${pageContext.request.contextPath}/admin/products/delete/${product.id}">
                                                    <h5>Bạn có chắc chắn muốn xoá <b>${product.name}</b> không?</h5>
                                                    <div class="modal-footer d-flex justify-content-center">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Không</button>
                                                        <button type="submit" class="btn btn-primary">Đồng ý</button>
                                                    </div>
                                                </form>
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
    $(document).ready(function() {
        
        // Add product form
        $('#name').on('input', function(e) {
            let text = $(this).val().toLowerCase();
            text = text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            text = text.replace(/\s+/g, '-');
            text = text.replace(/[^a-z0-9-]/g, '');
        });

        $('#changeImageBtn').on('click', function() {
            $('#image').click();
        });

        $('#image').on('change', function() {
            var file = $(this)[0].files[0];
            if (file) {
                // Validate file type
                if (!file.type.startsWith('image/')) {
                    alert('Vui lòng chọn file ảnh!');
                    $(this).val('');
                    return;
                }
                
                // Validate file size (max 5MB)
                if (file.size > 5 * 1024 * 1024) {
                    alert('File ảnh quá lớn! Vui lòng chọn file nhỏ hơn 5MB.');
                    $(this).val('');
                    return;
                }
                
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#carouselExampleSlidesOnly').find('img').attr('src', e.target.result);
                    $('#carouselExampleSlidesOnly').find('img').removeClass('d-none');
                    $('#carouselExampleSlidesOnly').find('img').addClass('d-block');
                    $('#imageTitle').text('Ảnh món mới (W: 300px, H: 300px)');
                    $('#changeImageBtn').text('Thay đổi ảnh');
                }
                reader.readAsDataURL(file);
            }
        });

        // Edit product forms - dynamically generated for each product
        var productIds = [];
        <c:forEach var="product" items="${products}">
        productIds.push('${product.id}');
        </c:forEach>
        
        productIds.forEach(function(productId) {
            $('#name_' + productId).on('input', function(e) {
                let text = $(this).val().toLowerCase();
                text = text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                text = text.replace(/\s+/g, '-');
                text = text.replace(/[^a-z0-9-]/g, '');
            });

            $('#changeImageBtn_' + productId).on('click', function() {
                $('#image_' + productId).click();
            });

            $('#image_' + productId).on('change', function() {
                var file = $(this)[0].files[0];
                if (file) {
                    // Validate file type
                    if (!file.type.startsWith('image/')) {
                        alert('Vui lòng chọn file ảnh!');
                        $(this).val('');
                        return;
                    }
                    
                    // Validate file size (max 5MB)
                    if (file.size > 5 * 1024 * 1024) {
                        alert('File ảnh quá lớn! Vui lòng chọn file nhỏ hơn 5MB.');
                        $(this).val('');
                        return;
                    }
                    
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#carouselExampleSlidesOnly_' + productId).find('img').attr('src', e.target.result);
                        $('#imageTitle_' + productId).text('Ảnh món mới (W: 300px, H: 300px)');
                        $('#changeImageBtn_' + productId).text('Thay đổi ảnh');
                    }
                    reader.readAsDataURL(file);
                }
            });

            // Form validation for edit
            $('#editProductForm_' + productId).on('submit', function(e) {
                var isValid = true;
                
                // Validate name
                var name = $('#name_' + productId).val().trim();
                if (name.length < 2 || name.length > 100) {
                    $('#name_' + productId).addClass('is-invalid');
                    isValid = false;
                } else {
                    $('#name_' + productId).removeClass('is-invalid');
                }
                
                // Validate price
                var price = $('#price_' + productId).val().replace(/[^0-9]/g, '');
                if (!price || parseInt(price) <= 0) {
                    $('#price_' + productId).addClass('is-invalid');
                    isValid = false;
                } else {
                    $('#price_' + productId).removeClass('is-invalid');
                }
                
                // Validate category
                var category = $('#categorySelect_' + productId).val();
                if (!category) {
                    $('#categorySelect_' + productId).addClass('is-invalid');
                    isValid = false;
                } else {
                    $('#categorySelect_' + productId).removeClass('is-invalid');
                }
                
                if (!isValid) {
                    e.preventDefault();
                    alert('Vui lòng kiểm tra lại thông tin!');
                }
            });
        });

        // DataTable initialization
        var dataTableAllText = "Tất cả";

        $('#product').DataTable({
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
            ordering: false,
            "lengthMenu": [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, dataTableAllText]
            ]
        });

        // Money input mask
        function applyMask() {
            $('.input-money').mask("#.##0", { reverse: true });
        }
        applyMask();

        // Form validation
        $('#addProductForm').on('submit', function(e) {
            var isValid = true;
            
            // Validate name
            var name = $('#name').val().trim();
            if (name.length < 2 || name.length > 100) {
                $('#name').addClass('is-invalid');
                isValid = false;
            } else {
                $('#name').removeClass('is-invalid');
            }
            
            // Validate price
            var price = $('#price').val().replace(/[^0-9]/g, '');
            if (!price || parseInt(price) <= 0) {
                $('#price').addClass('is-invalid');
                isValid = false;
            } else {
                $('#price').removeClass('is-invalid');
            }
            
            // Validate category
            var category = $('#categorySelect').val();
            if (!category) {
                $('#categorySelect').addClass('is-invalid');
                isValid = false;
            } else {
                $('#categorySelect').removeClass('is-invalid');
            }
            
            if (!isValid) {
                e.preventDefault();
                alert('Vui lòng kiểm tra lại thông tin!');
            }
        });

        // Theme handling
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