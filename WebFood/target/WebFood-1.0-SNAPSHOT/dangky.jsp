<%-- 
    Document   : dangky
    Created on : 30 thg 9, 2023, 19:18:58
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/head.jsp" />

<body style="background-image: url('img/blog/login.jpg')" >
    <div class="container" id="main-content">
        <div class="row justify-content-center">
            <form action="DangkyServlet" style="min-width: 300px;" method="post">
                <h3 class="text-center">REGISTER</h3>

                <div class="mb-3">
                    <label class="form-label">username</label>
                    <input class="form-control" name="username" type="text"  />
                </div>
                <div class="mb-3">
                    <label class="form-label">email</label>
                    <input class="form-control" name="email" type="text"  />
                </div>
                <div class="mb-3">
                    <label class="form-label">password</label>
                    <input class="form-control" type="text"  name="password" />
                </div>
                <div class="mb-3"> 
                    <div>
                        <input class="form-check-input" type="checkbox" name="isAdmim" />  Active                                      
                    </div>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-block btn-primary" name="btAction" value="save">
                        <i class="fa fa-save"></i> Save
                    </button>
                </div>
            </form>
        </div>
    </div>   
</body>