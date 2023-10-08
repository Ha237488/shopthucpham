package dto;

import dto.Categories;
import dto.OrderDetails;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-08T17:03:47")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, Integer> quantity;
    public static volatile SingularAttribute<Products, Integer> price;
    public static volatile ListAttribute<Products, OrderDetails> orderDetailsList;
    public static volatile SingularAttribute<Products, String> name;
    public static volatile SingularAttribute<Products, String> description;
    public static volatile SingularAttribute<Products, Integer> id;
    public static volatile SingularAttribute<Products, String> image1;
    public static volatile SingularAttribute<Products, Integer> purchasedCount;
    public static volatile SingularAttribute<Products, Boolean> isActive;
    public static volatile SingularAttribute<Products, Categories> categoryID;

}