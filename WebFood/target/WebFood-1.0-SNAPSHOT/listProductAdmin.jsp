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
                    <a href="AdminProductServlet?btAction=add" class="btn btn-success float-right">
                        <i class="fa fa-plus-square"></i> Create New
                    </a>
                </div>
            </div>                  
                
           <div class="row mt-4">
                <div class="table-responsive">
                    <h5>List of Product</h5>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>PurchasedCount</th>
                                <th>Description</th>
                                <th>IsActive</th>
                                <th>CategoryID</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="x" items="${listPR}">
                                
                            <tr>
                                <th scope="row">${x.id}</th>
                                <td>${x.name}</td>
                                <td>${x.price}</td>
                                <td>${x.image1}</td>
                                <td>${x.quantity}</td>
                                <td>${x.purchasedCount}</td>
                                <td>${x.description}</td>
                                <td>${x.isActive}</td>
                                <td>${x.categoryID.name}</td>
                                <td>
                                    <a href="AdminProductServlet?id=${x.id}&btAction=edit" class="mr-sm-2 text-primary"><i class="fa fa-pencil"></i></a>
                                    <a href="AdminProductServlet?id=${x.id}&btAction=delete" onclick="return confirm('Are you sure delete')" class="text-danger"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                             </c:forEach>
                           
                        </tbody>
                    </table>
                    <div class="text-center">
                        <c:forEach var="i" begin="1" end="${pages}">
                            <a href="AdminProductServlet?page=${i}" style="text-decoration: none;color: black"> ${i} </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div><!-- /.container -->
<!--nhung noi dung footer.jsp-->
<jsp:include page="shared/footer.jsp" />   
