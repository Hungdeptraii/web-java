<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  </div>
</main>

<%@ include file="includes/footer.jsp" %>

