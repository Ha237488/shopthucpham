<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="common/head.jsp" />
<jsp:include page="common/nav.jsp" />
<!-- Hero Section Begin -->
<section class="hero">
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
                            <input type="text" name="search" value="${search}" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn" name="action" value="save">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>0903719504</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
                <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                    <div class="hero__text">
                        <span>FRUIT FRESH</span>
                        <h2>Vegetable <br />100% Organic</h2>
                        <p>Free Pickup and Delivery Available</p>
                        <a href="#" class="primary-btn">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->
<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <c:forEach var="x" items="${listC}">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg">
                            <img src="img/categories/${x.image}" alt="alt"/>
                            <h5><a href="#">${x.name}</a></h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->
<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Featured Product</h2>
                </div>
            </div>
        </div>
        <div class="row featured__filter">        
            <c:forEach var="pr" items="${listP}">             
                <div class="col-lg-4 col-md-4 col-sm-6 mix fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="images/${pr.getImage1()}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="default?idct=${pr.id}&action=chitiet"><i class="fa fa-info-circle"></i></a></li>
                                <li><a href="cart?idcart=${pr.id}&action=addcart"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <fmt:formatNumber type="number" pattern="#,##0" value="${pr.getPrice()}" var="price" />
                        <div class="featured__item__text">
                            <h6><a href="#">${pr.getName()}</a></h6>
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
                        <a href="default?page=${i}" class="active">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="default?page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-1.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Latest Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <c:forEach var="x" items="${list06}">
                                <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="images/${x.image1}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${x.name}</h6>
                                        <span>${x.price} đ</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <c:forEach var="x" items="${list07}">
                                <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="images/${x.image1}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${x.name}</h6>
                                        <span>${x.price} đ</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Top Rated Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <c:forEach var="x" items="${list08}">
                                <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="images/${x.image1}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${x.name}</h6>
                                        <span>${x.price} đ</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <c:forEach var="x" items="${list09}">
                                <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="images/${x.image1}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${x.name}</h6>
                                        <span>${x.price} đ</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Review Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <c:forEach var="x" items="${list10}">
                                <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="images/${x.image1}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${x.name}</h6>
                                        <span>${x.price} đ</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <c:forEach var="x" items="${list09}">
                                <a href="default?idct=${x.id}&action=chitiet" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="images/${x.image1}" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>${x.name}</h6>
                                        <span>${x.price} đ</span>
                                    </div>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>From The Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-1.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="blog-details.html">Cooking tips make cooking simple</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-2.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="blog-details.html">6 ways to prepare breakfast for 30</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-3.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="blog-details.html">Visit the clean farm in the US</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->
<jsp:include page="common/footer.jsp" />
