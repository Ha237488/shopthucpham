package dto;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-08T17:03:47")
@StaticMetamodel(Message.class)
public class Message_ { 

    public static volatile SingularAttribute<Message, Date> createdDate;
    public static volatile SingularAttribute<Message, Integer> fromUserID;
    public static volatile SingularAttribute<Message, Integer> id;
    public static volatile SingularAttribute<Message, Integer> toUserID;
    public static volatile SingularAttribute<Message, Boolean> send;
    public static volatile SingularAttribute<Message, String> content;

}