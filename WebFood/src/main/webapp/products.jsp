<%-- 
    Document   : products
    Created on : Sep 30, 2023, 9:08:42 PM
    Author     : DELL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="common/head.jsp" />
<jsp:include page="common/nav.jsp" />
<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <c:forEach var="x" items="${listC}">
                            <li><a href="default?id=${x.id}&action=loaisp">${x.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<jsp:include page="common/nav2.jsp" />
<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
                        <ul>
                            <c:forEach var="x" items="${listC}">
                                <li><a href="products?id=${x.id}&action=loaisp">${x.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>Price</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="10" data-max="540">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Colors</h4>
                        <div class="sidebar__item__color sidebar__item__color--white">
                            <label for="white">
                                White
                                <input type="radio" id="white">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--gray">
                            <label for="gray">
                                Gray
                                <input type="radio" id="gray">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--red">
                            <label for="red">
                                Red
                                <input type="radio" id="red">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--black">
                            <label for="black">
                                Black
                                <input type="radio" id="black">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--blue">
                            <label for="blue">
                                Blue
                                <input type="radio" id="blue">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--green">
                            <label for="green">
                                Green
                                <input type="radio" id="green">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <h4>Popular Size</h4>
                        <div class="sidebar__item__size">
                            <label for="large">
                                Large
                                <input type="radio" id="large">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="medium">
                                Medium
                                <input type="radio" id="medium">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="small">
                                Small
                                <input type="radio" id="small">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="tiny">
                                Tiny
                                <input type="radio" id="tiny">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Latest Products</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="x" items="${list09}">
                                        <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="images/${x.image1}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${x.name}</h6>
                                                <fmt:formatNumber type="number" pattern="#,##0" value="${x.getPrice()}" var="price" />
                                                <span>${price} đ</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="x" items="${list10}">
                                        <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="images/${x.image1}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${x.name}</h6>
                                                <fmt:formatNumber type="number" pattern="#,##0" value="${x.getPrice()}" var="price" />
                                                <span>${price} đ</span>
                                            </div>
                                        </a>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Sale Off</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <c:forEach var="x" items="${listprice}">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg" style="width: 200px;height: 160px"
                                             data-setbg="images/${x.image1}">
                                            <div class="product__discount__percent">-50%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="products?idct=${x.id}&action=chitiet"><i class="fa fa-info-circle"></i></a></li>
                                                <li><a href="cart?idcart=${x.id}&action=addcart"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                            
                                        <div class="product__discount__item__text">
                                            <span>${x.categoryID.name}</span>
                                            <h5><a href="#">${x.name}</a></h5>
                                            <div class="product__item__price">${x.price/2} đ<span>${x.price} đ</span></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sort By</span>
                                <select>
                                    <option value="0">Default</option>
                                    <option value="0">Default</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${dem}</span> Products found</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="x" items="${listP}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="images/${x.image1}" style="width: 200px;height: 160px">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="products?idct=${x.id}&action=chitiet"><i class="fa fa-info-circle"></i></a></li>
                                        <li><a href="cart?idcart=${x.id}&action=addcart"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${x.name}</a></h6>
                                    <fmt:formatNumber type="number" pattern="#,##0" value="${x.getPrice()}" var="price" />
                                    <h5>${price} đ</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="product__pagination">
                    <c:forEach var="i" begin="1" end="${pages}">
                        <c:choose>
                            <c:when test="${i == param.page}">
                                <a href="products?page=${i}" class="active">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="products?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->
<jsp:include page="common/footer.jsp" />
