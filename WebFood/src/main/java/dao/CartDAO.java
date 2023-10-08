/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.CartIteam;
import dto.OrderDetails;
import dto.Products;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author DELL
 */
public class CartDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("WebFood");

    public Products findByIDCT(int productID) {
        EntityManager em = emf.createEntityManager();
        return em.find(Products.class, productID);
    }
    public double findPriceByID(int productID) {
    EntityManager em = emf.createEntityManager();
    Products product = em.find(Products.class, productID);
    if (product != null) {
        em.close();
        return product.getPrice();
    } else {
        em.close();
        return -1.0; // Hoặc giá trị khác để thể hiện rằng không tìm thấy sản phẩm
    }
}
    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        System.out.println(dao.findPriceByID(2));
    }
}
