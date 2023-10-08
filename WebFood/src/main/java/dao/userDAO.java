/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Categories;
import dto.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Admin
 */
public class userDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("WebFood");

    public Users findByUsername(String username) {
        EntityManager em = emf.createEntityManager();
        TypedQuery<Users> query = em.createNamedQuery("Users.findByUsername", Users.class);
        query.setParameter("username", username);
        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }

    public Users checkLogin(String username, String password) {
        EntityManager em = emf.createEntityManager();

        try {
            Query query = em.createQuery("SELECT u FROM Users u WHERE u.username = :username AND u.password = :password");
            query.setParameter("username", username);
            query.setParameter("password", password);
            return (Users) query.getSingleResult();
        } catch (Exception e) {
            System.out.println("Chay that bai:" + e.toString());
            return null;
        } finally {
            em.close();
        }
    }
    
     public boolean insert(Users u) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();

        return true;
    }

    public static void main(String[] args) {
        userDAO dao = new userDAO();
        System.out.println(dao.checkLogin("ha123", "123"));
    }

}
