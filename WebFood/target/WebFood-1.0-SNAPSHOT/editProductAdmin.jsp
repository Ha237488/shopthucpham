<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />

<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />

<div class="container" id="main-content">
    <div class="row justify-content-center">
        <form action="AdminProductServlet" style="min-width: 300px;" method="post">
            <h5 class="text-center">Edit Product</h5>
            <input type="hidden" name="id" />
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input class="form-control" value="${pr.name}" name="name" type="text"  />
            </div>
            <div class="mb-3">
                <label class="form-label">Price</label>
                <input class="form-control" value="${pr.price}" name="price" type="text"  />
            </div>
            <div class="mb-3">
                <label class="form-label">Images</label>
                <input class="form-control" type="text" value="${pr.image1}" name="image1" placeholder="Images..." />
            </div>
            <div class="mb-3">
                <label class="form-label">Quantity</label>
                <input class="form-control" value="${pr.quantity}" name="quantity" type="text"  />
            </div>
            <div class="mb-3">
                <label class="form-label">purchasedCount</label>
                <input class="form-control" value="${pr.purchasedCount}" name="purchasedCount" type="text"  />
            </div>
            <div class="mb-3">
                <label class="form-label">description</label>
                <input class="form-control" value="${pr.description}" name="description" type="text"  />
            </div>
            <div class="mb-3">
                <div>
                    <input class="form-check-input" type="checkbox" value="${pr.isActive}"  ${pr.isActive == true ? "checked" : ""} name="isActive" />  Active                                      
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">categoryID</label>
                <select class="form-control" name="categoryID">
                    <c:forEach var="x" items="${listCT}">
                        <option value="${x.id}" ${x.id== pr.id ? "selected":""}>${x.name}</option>
                    </c:forEach>             
                </select>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-block btn-primary" name="btAction" value="update">
                    <i class="fa fa-save"></i> Save
                </button>
            </div>
        </form>
    </div>
</div>    