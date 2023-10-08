package dto;

import dto.Orders;
import dto.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-08T17:03:47")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Integer> quantity;
    public static volatile SingularAttribute<OrderDetails, String> productImage;
    public static volatile SingularAttribute<OrderDetails, Products> productID;
    public static volatile SingularAttribute<OrderDetails, Orders> orderID;
    public static volatile SingularAttribute<OrderDetails, Integer> id;
    public static volatile SingularAttribute<OrderDetails, String> productName;
    public static volatile SingularAttribute<OrderDetails, Integer> productPrice;

}