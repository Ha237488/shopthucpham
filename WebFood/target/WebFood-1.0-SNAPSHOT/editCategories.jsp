<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />

<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />

<div class="container" id="main-content">
      <div class="row justify-content-center">
          <form action="AdminServlet" style="min-width: 300px;" method="post">
          <h5 class="text-center">Edit Categories</h5>
          <input type="hidden" name="id" />
          <div class="mb-3">
             <label class="form-label">Name</label>
             <input class="form-control" value="${ct.name}" name="name" type="text"  />
          </div>
          <div class="mb-3">
             
             <div>
                 <input class="form-check-input" type="checkbox" value="${ct.isActive}"  ${ct.isActive == true ? "checked" : ""} name="isActive" />  Active                                      
             </div>
          </div>
          <div class="mb-3">
             <label class="form-label">Images</label>
            <input class="form-control" type="text" value="${ct.image}" name="image" placeholder="Images..." />
          </div>
          <div class="mb-3">
              <button type="submit" class="btn btn-block btn-primary" name="btAction" value="update">
              <i class="fa fa-save"></i> Save
            </button>
          </div>
        </form>
      </div>
    </div>    