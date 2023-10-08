<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="default"><img src="img/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.dem == null ? 0 : sessionScope.dem}</span></a></li>
        </ul>
        <fmt:formatNumber type="number" pattern="#,##0" value="${sessionScope.totalPrice}" var="formattedTotalPrice" />
        <div class="header__cart__price">item: <span>${formattedTotalPrice == null ? 0 : formattedTotalPrice} </span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="img/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth">
            <a href="login.jsp"><i class="fa fa-user"></i> Login</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="default">Home</a></li>
            <li><a href="products">Shop</a></li>
            <li><a href="#">Manage</a>
                <ul class="header__menu__dropdown">
                    <li><a href="AdminProductServlet">Product</a></li>
                    <li><a href="AdminServlet">Categories</a></li>
                </ul>
            </li>
            <li><a href="./blog.html">Blog</a></li>
            <li><a href="./contact.html">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="https://www.facebook.com/profile.php?id=100065842343616"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> lethuc037253@gmail.com</li>
            <li>Free Shipping for all Order of $99 </li>
        </ul>
    </div>
</div>
<!-- Humberger End -->
<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> lethuc037253@gmail.com</li>
                            <li>Free Shipping for all Order of $99 </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="https://www.facebook.com/profile.php?id=100065842343616"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        </div>
                        <div class="header__top__right__auth">

                            <%
                                String username = (String) session.getAttribute("username");
                                if (username != null) {
                            %>
                            <a href="LogoutServlet"><i class="fa fa-user"></i> Welecom: <%= username%> - Logout</a>

                            <%
                            } else {
                            %>
                            <a href="LoginServlet"><i class="fa fa-user"></i> Login</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="default"><img src="img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="default">Home</a></li>
                        <li><a href="products">Shop</a></li>
                        <li><a href="#">Manage</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="AdminProductServlet">Product</a></li>
                                <li><a href="AdminServlet">Categories</a></li>
                            </ul>
                        </li>
                        <li><a href="./blog.html">Blog</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.dem == null ? 0 : sessionScope.dem}</span></a></li>
                    </ul>
                    <fmt:formatNumber type="number" pattern="#,##0" value="${sessionScope.totalPrice}" var="formattedTotalPrice" />
                    <div class="header__cart__price">item: <span>${formattedTotalPrice == null ? 0 : formattedTotalPrice}</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

