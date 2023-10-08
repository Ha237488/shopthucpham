<%-- 
    Document   : add
    Created on : Sep 15, 2023, 8:14:58 AM
    Author     : KHOACNTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />

<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />

<div class="container" id="main-content">
      <div class="row justify-content-center">
          <form action="AdminProductServlet" style="min-width: 300px;" method="post">
          <h5 class="text-center">Add Product</h5>
          <input type="hidden" name="id" />
          <div class="mb-3">
             <label class="form-label">Name</label>
            <input class="form-control" name="name" type="text"  />
          </div>
          <div class="mb-3">
             <label class="form-label">Prices</label>
            <input class="form-control" name="price" type="text"  />
          </div>
           <div class="mb-3">
             <label class="form-label">Images</label>
             <input class="form-control" type="text"  name="image1" />
          </div>
           <div class="mb-3">
             <label class="form-label">quantity</label>
            <input class="form-control" type="text"  name="quantity" />
          </div>
          <div class="mb-3">
             <label class="form-label">purchasedCount</label>
            <input class="form-control" type="text"  name="purchasedCount" />
          </div>
          <div class="mb-3">
             <label class="form-label">description</label>
            <input class="form-control" type="text"  name="description" />
          </div>
          <div class="mb-3"> 
             <div>
                 <input class="form-check-input" type="checkbox" name="isActive" />  Active                                      
             </div>
          </div>
          <div class="mb-3">
             <label class="form-label">categoryID</label>
             <select class="form-control" name="categoryID">
                 <c:forEach var="x" items="${listCT}">
                     <option value="${x.id}">${x.name}</option>
                 </c:forEach>             
             </select>
          </div>
          <div class="mb-3">
              <button type="submit" class="btn btn-block btn-primary" name="btAction" value="save">
              <i class="fa fa-save"></i> Save
            </button>
          </div>
        </form>
      </div>
    </div>       
     