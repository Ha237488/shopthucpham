package dto;

import dto.OrderDetails;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-08T17:03:47")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Date> dateShip;
    public static volatile SingularAttribute<Orders, Boolean> isPaid;
    public static volatile ListAttribute<Orders, OrderDetails> orderDetailsList;
    public static volatile SingularAttribute<Orders, Date> dateOrder;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Integer> userID;
    public static volatile SingularAttribute<Orders, String> status;

}