package dto;

import dto.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-08T17:03:47")
@StaticMetamodel(Categories.class)
public class Categories_ { 

    public static volatile SingularAttribute<Categories, String> image;
    public static volatile ListAttribute<Categories, Products> productsList;
    public static volatile SingularAttribute<Categories, String> name;
    public static volatile SingularAttribute<Categories, Integer> id;
    public static volatile SingularAttribute<Categories, Boolean> isActive;

}