<%-- 
    Document   : addcontact
    Created on : 12 thg 9, 2023, 15:54:47
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="common/head.jsp" />

<body style="background-image: url('img/blog/login.jpg');height: 100%">
    <div class="container w-25" id="main-content">
        <div class="row justify-content-center">
            <form action="LoginServlet" style="min-width: 300px;" method="post">
                <h3 class="text-center">LOGIN</h3>
                <div class="mb-3">
                    <label class="form-label"> User Name</label>
                    <input class="form-control" type="text" name="username" placeholder="username name..." />
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input class="form-control" type="password" name="password" placeholder="passd word..." />
                </div> 
                <div class="mb-3">
                    <button type="submit" value="login" class="btn btn-primary float-left" >
                        <i class="fa fa-long-arrow-right"></i> Login 
                    </button>

                    <a href="DangkyServlet?btAction=dangky" class="btn btn-success float-right">
                        <i class="fa fa-plus-square"></i> Register
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>

