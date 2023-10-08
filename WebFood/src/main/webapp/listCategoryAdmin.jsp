<%-- 
    Document   : list.jsp
    Created on : Sep 15, 2023, 8:14:39 AM
    Author     : KHOACNTT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />
<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />

<div class="container" id="main-content">
            <div class="row">
                <div class="col-md-6">
                    <form method="post">  
                        <div class="row">
                        <div class="col-md-8"> 
                            <input class="form-control" type="search" placeholder="Search by name ..." />
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-primary" type="submit" name="search">
                                <i class="fa fa-search"></i> Search
                            </button>
                        </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 text-end">
                    <a href="AdminServlet?btAction=add" class="btn btn-success float-right">
                        <i class="fa fa-plus-square"></i> Create New
                    </a>
                </div>
            </div>                  
                
           <div class="row mt-4">
                <div class="table-responsive">
                    <h5>List of Categories</h5>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>IsActive</th>
                                <th>Image</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="x" items="${listCT}">
                                
                            <tr>
                                <th scope="row">${x.id}</th>
                                <td>${x.name}</td>
                                <td>${x.isActive?"Active":"IsActive"}</td>
                                <td>${x.image}</td>
                                
                                <td>
                                    <a href="AdminServlet?id=${x.id}&btAction=edit" class="mr-sm-2 text-primary"><i class="fa fa-pencil"></i></a>
                                    <a href="AdminServlet?id=${x.id}&btAction=delete" onclick="return confirm('Are you sure delete')" class="text-danger"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                             </c:forEach>
                           
                        </tbody>
                    </table>
                    <div class="text-center">
                        <c:forEach var="i" begin="1" end="${pages}">
                            <a href="AdminServlet?page=${i}">${i}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div><!-- /.container -->
<!--nhung noi dung footer.jsp-->
<jsp:include page="shared/footer.jsp" />   
